#! /bin/bash

# we should only run this script on the master branch of the "generic" parent repo

# check generic parent repo
if [ "$(git config --get remote.origin.url)" -ne "git@github.com:LaunchCodeEducation/cs50x-live.git" ]; then
	echo "I am aborting because this is a child repo"
	exit 0
fi

# check master branch
if [ "$(git rev-parse --abbrev-ref HEAD)" -ne "master" ]; then
	echo "I am aborting because this is not the master branch"
	exit 0
fi

# deepen the repository
git fetch --unshallow

if [[ $? != 0 ]]; then
	echo "unable to deepen repository"
	exit 2
fi


# configure local permissions so that we can push to github
git config --global user.email "kegan+ci@launchcode.org"
git config --global user.name "launch-ci"

CHILD_SSH_KEY="${TRAVIS_BUILD_DIR}/scripts/deploy_ssh_key"

openssl aes-256-cbc -K $encrypted_30536b4245ad_key -iv $encrypted_30536b4245ad_iv -in scripts/deploy_ssh_key.enc -out "${CHILD_SSH_KEY}" -d


eval $(ssh-agent)
chmod 400 "${CHILD_SSH_KEY}"
ssh-add "${CHILD_SSH_KEY}"


PREFIX="git@github.com:LaunchCodeEducation"
CHILDREN=("cs50x-stlouis" "cs50x-kansascity" "cs50x-maryville" "cs50x-rhodeisland" "cs50x-stcharles")
FAILURES=()

TEMPDIR=$(mktemp -d)
pushd "${TEMPDIR}"


for CHILD in "${CHILDREN[@]}"; do
	echo
	echo "I will now attempt to propogate changes downstream to ${CHILD}"

	git clone "${PREFIX}/${CHILD}"

	if [[ $? != 0 ]]; then
		echo "unable to clone"
		exit 1
	fi

	pushd "${CHILD}"
		git remote add upstream "file://${TRAVIS_BUILD_DIR}"
		git checkout gh-pages
		git pull origin gh-pages
		echo
		echo "Now I will attempt to merge in changes from upstream (cs50x-live)"
		git pull -q --commit --no-edit upstream master

		# if merge conflicts,
		if [[ $? != 0 ]]; then
			# add this to FAILURES array
			FAILURES+="${CHILD}"
			# skip to next iteration
			continue
		fi

		# run the update-website script
		"${TRAVIS_BUILD_DIR}/update-website.sh"

	popd
done

# if there were any failures, report them and cuase build failure
if [[ ${#FAILURES[@]} != 0 ]]; then
	echo
	echo "The following child repos failed: ${FAILURES[*]}"
	exit 1
fi

popd
