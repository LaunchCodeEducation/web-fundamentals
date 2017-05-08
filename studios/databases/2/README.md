---
title: 'Studio: Database Part 2'
currentMenu: studios
---
# TO DO: add more to walkthrough, assignment (plus change 2nd picture--take new one of adding a user/db with name of movies?)

## Getting Ready: Setting Up the Database

Start up MAMP. From the launcher window, select *Start Servers*. Once that button has turned green, choose *Open Start Page*. From the page that opens up in your browser, select *Tools > phpMyAdmin*.

Select *User Accounts*.

![User Accounts](images/mamp-user-accounts.png)

Fill out the resulting form with info for your application. A good pattern to follow is that you should have a different user for each application, and the username should match the name of your application.

Set the *Host name* field to *Local* and set a password. For local development, it's acceptable to use a simple password. Just be sure that you don't use the same password on a production database if you deploy your application!

And be sure to check the first checkbox under *Database for user account*. If you don't do this, you'll have to create a database and set permissions manually.

![Add user](images/mamp-add-user.png)

## Walkthrough

