1. List all the titles of the movies in the database.

```sql
select title from movies;
```

2. List all the titles of the movies in the database in descending order of the year they were released.

```sql
select title from movies order by released desc;
```

3. Insert a new record into the `directors` table for Jean-Pierre Jeunet whose country of origin is France. (*Note:* Assume the column for `director_id` is auto incremented, so you don't need to put in a value for that column.)

```sql
insert into directors (first, last, country)
    values ('Jean-Pierre', 'Jeunet', 'France');
```

4. List the `director_id` for Jean-Pierre Jeunet.

```sql
select director_id from directors
    where first='Jean-Pierre' and last='Jeunet';
```

5. Insert a new record into the `movies` table for Amelie which was released in 2001 and directed by Jean-Pierre Jeunet. (*Hint:* Assume the id you got from the last query was "2" and use that. And, like question 3, assume the `movie_id` column is auto incremented).

```sql
insert into movies (title, released, director_id)
    values ('Amelie', 2001, 2);
```

6. List all columns for all records of the `directors` table in ascending alphabetical order of the director's country of origin.

```sql
select * from directors
    order by country asc;
```

7. List the country of origin of the director of Amelie. (You could do this using either a join or a subquery. Use a join.)

```sql
select country from directors
    inner join movies on directors.director_id=movies.director_id
    where movies.title='Amelie';
```

8. List all the movies in the database along with each movie's director, ordered by the director's last name in ascending order. (*Hint:* you'll want to use a join and choose the columns `title`, `first`, and `last`).

```sql
select title, first, last from movies
    inner join directors on directors.director_id=movies.director_id
    order by directors.last asc;
```
