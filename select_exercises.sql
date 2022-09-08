USE albums_db;
SHOW Tables;
DESCRIBE albums;
SELECT * FROM albums;
SELECT min(release_date) FROM albums;
SELECT max(release_date) FROM albums;
SELECT DISTINCT artist FROM albums;
/* 3.
a. How many rows are in the albums table?
31
b. How many unique artist names are in the albums table?
23
c. What is the primary key for the albums table?
id
d. What is the oldest release date for any album in the albums table? What is the most recent release date? 
1967, 2011
*/

/* 4. 
a. The name of all albums by Pink Floyd */
SELECT name FROM albums WHERE artist = 'Pink Floyd';

/* b. The year Sgt. Pepper's Lonely Hearts Club Band was released */
SELECT release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

/* c. The genre for the album Nevermind */
SELECT genre FROM albums WHERE name = 'Nevermind';

/* d. Which albums were released in the 1990s */
SELECT name, release_date FROM albums WHERE release_date BETWEEN 1990 AND 1999;

/* e. Which albums had less than 20 million certified sales */
SELECT name, sales FROM albums WHERE sales < 20;

SELECT name, genre FROM albums WHERE genre = 'Rock';
/* f. Hard rock and Progressive rock are not shown because the WHERE clause for genre uses the specific string 'Rock' and does not include 'Hard rock' or 'Soft rock' */