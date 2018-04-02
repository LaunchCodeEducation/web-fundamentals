---
title: Class 8 Prep
currentMenu: classes
---

## Databases Part 2

Now you should have a good grasp on basic SQL syntax and commands, as well as an understanding of how relational databases work. In this lesson, we'll install *MAMP* and learn how to use a **real** database on your computer through *phpMyAdmin*. We'll also expand our knowledge of SQL by working through some additional exercises at w3schools.  


Task | Resource Type | Link | Instructions
|----|---------------|------|-------------|
Do | Exercises | [w3schools SQL Database][w3c-sql] | Do all the lessons under _SQL Database_ from "SQL Create DB" through "SQL Hosting". Note that you will have already covered the lessons on Drop Table, Create Table, and Foreign Keys in the Class 7 Prep.
Do | Interactive Course | [Khan Academy: Intro to SQL][sql-khan] | Complete all the lessons in: _Modifying databases with SQL_. Some of this content will overlap with what you learned in the **w3schools tutorial** above; that's okay - the added explanations and practice should help. Note that the UI is not wonderful, and the syntax checker can be finicky. Make sure you remember to use ";" to end **all** of your statements.

### Install MAMP

MAMP is a suite of tools useful for developers. The acronym MAMP stands for Mac / Apache / MySQL / PHP, and despite the first term, there is a version for Windows as well. While we won't use Apache and PHP directly, they'll provide us with an interface to work with our MySQL server, called *phpMyAdmin*.

The first step in this lesson is to install MAMP onto your computer by following the instructions below for [Windows](#install-mamp-for-windows) or [Mac](#install-mamp-for-mac).

If you use Linux, you should install, at a minimum, the MySQL 5.x package for your system. You might also install phpMyAdmin or another MySQL management application. For further help on **LAMP** installation (LAMP is the Linux equivalent of MAMP), check out [How To Ubuntu][ubuntu] or [Bitnami][bitnami].

#### Install MAMP for Windows

1. Go to [MAMP.info][mamp] and download the Windows version of MAMP. Double click to install and allow it to make changes on the hard drive.
2. Close all other applications.
3. Select English as the language.
4. Uncheck the *MAMP PRO* box (do NOT download it).
5. Accept the Terms/License.
6. Keep the default destination of ``C:\MAMP``.
7. Keep the default option to let it create a shortcut.
8. Keep the default option to let it create desktop icon.
9. Click the "Install" button. (Install takes around five minutes.)
10. Click "Finish".
11. Open MAMP and go to *Preferences...*, then click the *Ports* tab and click the "Set MAMP ports to default" button. Click OK and then click "Quit".
12. Reopen MAMP, ignore it if there is a message about the ports, and click *Open start page.*
13. In your browser you should now be at ``localhost:8888/MAMP/``. Select the dropdown menu under *Tools* and click on *phpMyAdmin*.
14. Enter the username: "root" and the password: "root" to login. Now you are on the main phpMyAdmin page that you will use for this lesson's studio.

<aside class="aside-note" markdown="1">
You may get a permissions error when you try to open MAMP the first time. If you do, find ``MAMP.exe`` in the MAMP folder, right-click it and select "Properties". Then select "Security", then "Edit", and highlight "Users". Then click "Add", and if the box next to "write" under the column "allow" is not already selected, then select it and OK your way back out of the menus.
</aside>

<aside class="aside-note" markdown="1">
If your Apache or MYSQL servers won't start (if neither, or only one, has a green box next to it), and make sure the options "Start Servers when starting MAMP" and "At startup open" are unchecked in *Preferences...*. Then click *Stop Servers*. Then Quit and reopen MAMP. Now press *Start Servers* and wait until both the boxes next to the servers turn green. Then you can *Open start page*.
</aside>

#### Install MAMP for Mac

1. Go to [MAMP.info][mamp] and download the Mac version of MAMP.
2. Drag and drop the downloaded file in Finder from Downloads to Applications. Then double click it.
3. Click "continue" on the Introduction, Read Me, and License prompt screens, and Agree to the terms.
4. Click "continue" on the Destination Select screen--it will install onto the hard drive.
5. Click "install" on the Installation Type screen.
6. Click "close" when the install has completed.
7. Note that it will install in the Applications folder. Go into Applications, double click on the MAMP folder, then double-click on the MAMP icon in that folder. Note that the installer will install both MAMP and MAMP PRO, but we'll only be using MAMP, not MAMP PRO.
8. You'll get a "Warning" message. Be sure to **uncheck** the box next to "Check for MAMP PRO when starting MAMP" and then click the "Launch MAMP" button *NOT* the "Launch MAMP PRO" button.
9. Go to *Preferences -> Ports* and click "Set MAMP ports to default" then click OK.
10. Then go to *Preferences -> PHP* and select the Standard Version ``7.0.15`` (you will need a php version older than `7.1.1` for phpMyAdmin to work properly). Then click OK.
11. Click *Start Servers* and it should automatically open a web page. If it does not, click *Open WebStart page*.
12. In your browser you should be on the MAMP localhost webpage. Select the dropdown menu under *Tools* and click on *phpMyAdmin*. You may or may not be prompted to enter a username and password. If you are prompted, use the word "root" for both.
13. Now you are on the phpMyAdmin page you will use for this lesson's studio.

[mamp]: https://www.mamp.info/en/downloads/
[w3c-sql]: https://www.w3schools.com/sql/sql_create_db.asp
[bitnami]: https://bitnami.com/stack/lamp/installer
[ubuntu]: http://howtoubuntu.org/how-to-install-lamp-on-ubuntu
[sql-khan]: https://www.khanacademy.org/computing/computer-programming/sql
