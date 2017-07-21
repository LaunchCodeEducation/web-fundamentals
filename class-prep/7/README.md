---
title: Class 7 Prep
currentMenu: classes
---

## Databases Part 1

Up to now, you may have had the feeling that the apps we're building in the lessons, studios, and assignments don't seem that useful. If you thought harder about it, you may have determined that this is true because we don't have a way to store data over long periods of time. Actually, we haven't been able to store data for more than the duration of a single HTTP request, say, by adding an element to a list.

We're going to plug this functional hole across the next two lessons by learning how to store data in databases. In this lesson, we'll learn about **relational databases**, the most common way to store data, and **SQL**, the most common language used to access databases. We'll learn about tables, rows, and queries. We'll also learn about the similarities between Python objects and database tables.

In the next lesson, we'll learn how to manipulate databases locally using *MAMP* and *phpMyAdmin*, and we'll also learn more complex operations on databases.

<aside class="aside-note" markdown="1">
It is imperative that you code along with the resources below in order to be ready to tackle the next assignment. If you don't code along, you will be at an extreme disadvantage.
</aside>

Task | Resource Type | Link | Instructions
|----|---------------|------|-------------|
Do | Exercises | [w3schools SQL Tutorial][w3c-sql] | Do all the lessons under _SQL Tutorial_ from "SQL Home" through "SQL Comments". Stop when you get to the lessons under _SQL Databases_ as we will work through most of these in the next lesson (and a *select* few are featured below - pun intended).
Do | Interactive Course | [Khan Academy: Intro to SQL][sql-khan] | Complete all the lessons in: _SQL basics_, _More advanced SQL queries_, and _Relational queries in SQL_. This will give you an overview of how relational databases work as well as practice with common queries. Some of this content will overlap with what you learned in the **w3schools tutorial** above; that's okay - the added explanations and practice should help. Note that the UI is not wonderful, and the syntax checker can be finicky. Make sure you remember to use a semicolon **;** to end **all** of your statements.
Do | Exercise | [Create Table][w3c-create] | A brief explanation of how to create tables.
Do | Exercise | [Drop Table][w3c-drop] | A brief explanation of how to drop tables.
Do | Exercise | [Foreign Key][w3c-foreign-key] | A brief explanation of foreign keys.
Read | Article | [SQL: JOINS][tech-net] | This Tech on the Net article is a worthwhile read if you find the idea of joins confusing. Joins are essential to understand and this article has Venn diagrams for the different joins, which is helpful for visualizing them.
Read | Article | [One-to-Many Relationships][database-primer] | This article will help you get an overview of the one-to-many concept in relational databases. We will explore this further in the studio.
Read | Article | [Data Types in MySQL][data-types] | This article will help you understand the common data types in MySQL.


[w3c-drop]: https://www.w3schools.com/sql/sql_drop_table.asp 
[w3c-create]: https://www.w3schools.com/sql/sql_create_table.asp
[w3c-foreign-key]: https://www.w3schools.com/sql/sql_foreignkey.asp
[w3c-sql]: http://www.w3schools.com/sql/default.asp
[sql-khan]: https://www.khanacademy.org/computing/computer-programming/sql
[tech-net]: https://www.techonthenet.com/sql/joins.php
[database-primer]: http://www.databaseprimer.com/pages/relationship_1tox/
[data-types]: https://www.techonthenet.com/mysql/datatypes.php
