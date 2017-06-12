---
title: 'Studio: Databases Part 1'
currentMenu: studios
---

This studio has two parts, corresponding to what you'll learn in classes 7 and 8, respectively. In the first part of this studio, we'll create and manipulate tables, as well as explore the parallels between Python objects and database tables. In the second part of this studio, we'll make a real database locally and use it to perform SQL queries through *phpMyAdmin*.

## Walkthrough

Let's relate what you've been learning about SQL and databases to your work on FlickList. We'll start with a database called "movie-buff" and create two tables in it, `movies` and `directors`. Let's think about what kind of columns we want in our tables. For the `movies` table, it makes sense to have columns for the `title` of the movie, the year it was `released`, and who the `director` is. We're also going to want to have a unique `movie_id` column as the primary key, since there can be more than one movie with the same title.

Take the time now to think about what data types you might use for these columns (`INTEGER`, `VARCHAR`, `DATE`, etc.), then go ahead and write (or type) the SQL statement to create this table.

As you were thinking about which data types to use for your table columns, you may have found yourself thinking, "if this were a property of a Python object, what data type would I use?" For instance, if I had a `movie` object in Python, and one of its properties was `title`, I would expect the data type for it to be a string, like "The Year of Living Dangerously". And I would expect the year it was released to be an integer, and the name of the director to be another string. This conceptual overlap between databases and Python objects is very useful, and we will explore it further in class 9 when you look at ORM (Object-relational mapping). Here's how such a table could be created:

```sql
CREATE TABLE movies (
    movie_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(120),
    year INTEGER,
    director VARCHAR(120)
);
```

Next, let's think about what kind of properties we'd expect a `director` object in Python to have. It would probably have a `first` name, a `last` name, and maybe the `country` where the director was born. Thinking about what kind of data types we'd expect those properties to be, let's go ahead and write the SQL to create a table, `directors`, with the corresponding columns and appropriate data types. Also, be sure to have an `director_id` column so that we have a valid primary key.

```sql
CREATE TABLE directors (
    director_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    first VARCHAR(120),
    last VARCHAR(120),
    country VARCHAR(120)
);
```

Before we go further, let's take a moment to think about how these two tables relate to each other, and whether we may want to modify the column `director` in the `movies` table. Understanding the one-to-many relationship that is common among database tables will help us to come up with the best design for these two tables. A director may direct multiple movies, but each movie may only have one director.

<aside class="aside-note" markdown="1">
Read [this article](http://www.databaseprimer.com/pages/relationship_1tox/) to get an overview of the one-to-many concept in relational databases.
</aside>

In order to reflect this relationship in the table definitions, let's modify the `director` column in `movies` to become `director_id` and therefore to be an `INTEGER` instead of a `VARCHAR` (as that is the type we used earlier when we thought the director column would hold the name of a director). We also will want to make the `director_id` column a foreign key, so that it links directly to the `director_id` column of the `directors` table. Go ahead and write the SQL to drop the `movies` table we had created, and then write the SQL to create a new table with these changes.

```sql
DROP TABLE movies;

CREATE TABLE movies (
    movie_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(120),
    released INTEGER,
    director_id INTEGER,
    FOREIGN KEY (director_id) REFERENCES directors(director_id)
);
```

<aside class="aside-note" markdown="1">
If you need tips on how to do this, check out the w3school's brief lessons on [SQL Drop Table](https://www.w3schools.com/sql/sql_drop_table.asp), [SQL Create Table](https://www.w3schools.com/sql/sql_create_table.asp), and [SQL Foreign Key](https://www.w3schools.com/sql/sql_foreignkey.asp). Follow the MySQL syntax instructions where there is syntax variation between the major databases.
</aside>

This kind of table structure keeps our database clean. It keeps data specific to directors in the `directors` table, and data specific to each movie in the `movies` table and provides a link between the two tables. This is a "clean" design, because data such as what country the director of a movie is from isn't really an attribute of the movie, it's an attribute of the director. After all, you wouldn't put `directors_country` as a property of a Python `movie` object, would you? Hopefully not. :-)

Still, we may want to know that information for a given movie, e.g., we may want to find all the movies since 2010 that have French directors. So we need to have a way of filtering movies based on attributes of directors, without cluttering up the `movies` table. Solving this challenge is what relational databases are all about, and Foreign Keys are the "key" (pun intended) to the solution.

## Studio

For this studio, you'll practice writing the SQL queries to perform various data retrieval and manipulation tasks.

### Your Task:

Even though our database does not have entries in it, we can imagine that it does, and query it accordingly! Referencing the table definitions above, write the SQL commands to do the following:

1. List all the titles of the movies in the database.

2. List all the titles of the movies in the database in descending order of the year they were released.

3. Insert a new record into the `directors` table for Jean-Pierre Jeunet whose country of origin is France. (*Note:* Assume the column for `director_id` is auto incremented, so you don't need to put in a value for that column.)

4. List the `director_id` for Jean-Pierre Jeunet.

5. Insert a new record into the `movies` table for Amelie which was released in 2001 and directed by Jean-Pierre Jeunet. (*Hint:* Assume the id you got from the last query was "2" and use that. And, like question 3, assume the `movie_id` column is auto incremented).

6. List all columns for all records of the `directors` table in ascending alphabetical order of the director's country of origin.

7. List the country of origin of the director of Amelie. (You could do this using either a join or a subquery. Use a join.)

8. List all the movies in the database along with each movie's director, ordered by the director's last name in ascending order. (*Hint:* you'll want to use a join and choose the columns `title`, `first`, and `last`).
