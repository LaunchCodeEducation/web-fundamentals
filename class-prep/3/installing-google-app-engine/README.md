---
title: Installing Google App Engine
---

As we learn how web apps work, and how to build our own web apps, we'll be using Google App Engine. This tool will help us create and run web apps on our computers.

<aside class="aside-warning" markdown="1">
**Do not** watch or follow the video "Quiz: Google App Engine" under the heading "Problem Set 1 - Creating Your First Site" on the Udacity course. This video is a bit out-of-date and therefore likely to confuse you. Skip this video, follow the instructions here, and you'll be set.
</aside>

<aside class="aside-warning" markdown="1">
If you read any information from Udacity or Google that makes it seem like you need to *publish* or *host* your site on the Google App Engine platform, or that you need to sign up for a Google App Engine account with a credit card, **ignore it**. We'll only use Google App Engine to run our apps locally on our computers, and you do not need to publish your work remotely to the Google App Engine platform. When Udactiy prompts you to do so, and to submit your URL to them for grading, ignore it. We'll do our own grading. And we'll remind you of this a few more times.
</aside>

### Install Google App Engine (GAE)

#### Windows

[Windows Installer](https://www.dropbox.com/s/czx5u65zix1569g/GoogleAppEngine-1.9.40.msi?dl=1)

1. Download and run the installer. If downloading from the first URL is slow, try using the second link.
2. Click the install screen, using all default options
3. After the installer finishes running, select **Run the Installer** and **Finish**
4. Configure GAE found your Python 2 installation by going to *Edit > Preferences* and setting the path to your Python 2 installation. Most likely, it's already in the default location, but some students may find that they need to set this path explicitly.

#### Mac

[Mac Installer](https://www.dropbox.com/s/ykjyqqun3k5oeav/GoogleAppEngineLauncher-1.9.38.dmg?dl=1)

1. Download the installer file. If downloading from the first URL is slow, try using the second link.
2. Open the installer .dmg file, and in the window that opens drag the Google App Engine Launcher icon to the Applications folder
3. Visit your Applications folder, and open the GoogleAppEngineLaunchder application
4. When prompted to "Make Command Symlinks?" select OK and enter the credentials for an admin on your computer
5. Once the application fully loads, we recommend right-clicking on its icon in the dock and select **Options > Keep in Dock**

#### Linux

For Linux systems, follow [this walkthrough][gae-on-linux] to install and run GAE on your machine.

### Using Google App Engine

Now that you have GAE installed on your laptop, let's learn how to use it by walking through a Hello, World! app.

If you're using Linux, much of the video will not be precisely applicable since there isn't a GUI tool for using GAE. However, you may find some value in the discussion of common errors messages.

[Watch: Google App Engine Walkthrough](https://www.youtube.com/watch?v=KSFaeLRZNE8)

<aside class="aside-note" markdown="1">
When creating GAE apps, the application name must be *lowercase*.
</aside>

[gae-on-linux]: linux.html
