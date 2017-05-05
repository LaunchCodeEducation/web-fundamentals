---
title: 'Virtual Environment'
currentMenu: tutorials
---

## on Mac

If you do not have Flask installed or you see this error: 

```nohighlight
$ python main.py
Traceback (most recent call last):
File "main.py", line 1, in <module>
from flask import Flask
ImportError: No module named flask
```

We will use this utility to install Flask and common Python build tools.

```nohighlight
$ sudo easy_install virtualenv
Password:
Searching for virtualenv
Reading https://pypi.python.org/simple/virtualenv/
Best match: virtualenv 15.1.0
Downloading https://pypi.python.org/packages/d4/0c/9840c08189e030873387a73b90ada981885010dd9aea134d6de30cd24cb8/virtualenv-15.1.0.tar.gz#md5=44e19f4134906fe2d75124427dc9b716
Processing virtualenv-15.1.0.tar.gz
Writing /tmp/easy_install-sH7a_n/virtualenv-15.1.0/setup.cfg
Running virtualenv-15.1.0/setup.py -q bdist_egg --dist-dir /tmp/easy_install-sH7a_n/virtualenv-15.1.0/egg-dist-tmp-WqxVe7
warning: no previously-included files matching '*' found under directory 'docs/_templates'
warning: no previously-included files matching '*' found under directory 'docs/_build'
creating /usr/local/lib/python2.7/site-packages/virtualenv-15.1.0-py2.7.egg
Extracting virtualenv-15.1.0-py2.7.egg to /usr/local/lib/python2.7/site-packages
Adding virtualenv 15.1.0 to easy-install.pth file
Installing virtualenv script to /usr/local/bin

Installed /usr/local/lib/python2.7/site-packages/virtualenv-15.1.0-py2.7.egg
Processing dependencies for virtualenv
Finished processing dependencies for virtualenv
```

Now follow this command to install a virtual environment.

```nohighlight
$ python -m virtualenv venv
New python executable in /Users/cheryl/Development/flicklist-flask/venv/bin/python2.7
Also creating executable in /Users/cheryl/Development/flicklist-flask/venv/bin/python
Installing setuptools, pip, wheel...done.
```

Problems: Check the [Wiki](https://github.com/LaunchCodeEducation/web-fundamentals/wiki/Virtual-Environment-Setup:-Mac)
