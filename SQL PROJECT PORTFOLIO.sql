CREATE SCHEMA ProjectPortfolio;
USE project;
CREATE TABLE badges (
    id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255),
    date DATE
);
INSERT INTO badges (id, user_id, name, date) VALUES
(1, 1001, 'Gold Contributor', '2024-01-01'),
(2, 1002, 'Silver Helper', '2024-01-05'),
(3, 1003, 'Bronze Reviewer', '2024-02-10'),
(4, 1001, 'Silver Helper', '2024-03-15'),
(5, 1004, 'Gold Contributor', '2024-04-20'),
(6, 1001, 'Gold Contributor', '2024-05-05'),
(7, 1002, 'Bronze Reviewer', '2024-06-10'),
(8, 1003, 'Silver Helper', '2024-07-10'),
(9, 1004, 'Gold Contributor', '2024-08-01'),
(10, 1001, 'Bronze Reviewer', '2024-09-01');
CREATE TABLE comments (
    id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    creation_date DATE,
    text TEXT
);
INSERT INTO comments (id, post_id, user_id, creation_date, text) VALUES
(1, 2001, 1001, '2024-01-01', 'Great explanation!'),
(2, 2002, 1002, '2024-01-05', 'This helped a lot.'),
(3, 2003, 1003, '2024-01-10', 'Can you clarify?'),
(4, 2004, 1001, '2024-01-15', 'Excellent resource.'),
(5, 2005, 1004, '2024-01-20', 'Thank you for sharing.'),
(6, 2001, 1002, '2024-01-25', 'I agree, very useful.'),
(7, 2003, 1003, '2024-02-01', 'This solved my issue.'),
(8, 2004, 1001, '2024-02-05', 'Thanks for the info.'),
(9, 2005, 1004, '2024-02-10', 'Could use more detail.'),
(10, 2006, 1002, '2024-02-15', 'Good job on this one!');


CREATE TABLE post_history (
    id INT PRIMARY KEY,
    post_history_type_id INT,
    post_id INT,
    user_id INT,
    text TEXT,
    creation_date DATE
);

INSERT INTO post_history (id, post_history_type_id, post_id, user_id, text, creation_date) VALUES
(1, 1, 2001, 1001, 'Initial post creation', '2024-01-01'),
(2, 2, 2002, 1002, 'Edited post for clarity', '2024-01-05'),
(3, 3, 2003, 1003, 'Comment added by moderator', '2024-01-10'),
(4, 1, 2004, 1001, 'First version of the post', '2024-01-15'),
(5, 2, 2005, 1004, 'Reworded answer', '2024-01-20'),
(6, 3, 2001, 1002, 'User updated answer with additional info', '2024-01-25'),
(7, 1, 2003, 1003, 'Post originally created', '2024-02-01'),
(8, 3, 2004, 1001, 'Moderators edited content', '2024-02-05'),
(9, 2, 2005, 1004, 'User revised explanation', '2024-02-10'),
(10, 3, 2006, 1002, 'Moderators flagged inappropriate content', '2024-02-15');


CREATE TABLE post_links (
    id INT PRIMARY KEY,
    post_id INT,
    related_post_id INT,
    link_type_id INT
);

INSERT INTO post_links (id, post_id, related_post_id, link_type_id) VALUES
(1, 2001, 2002, 1),
(2, 2002, 2003, 2),
(3, 2003, 2004, 1),
(4, 2004, 2005, 3),
(5, 2005, 2006, 2),
(6, 2001, 2004, 3),
(7, 2002, 2006, 1),
(8, 2003, 2005, 2),
(9, 2004, 2006, 3),
(10, 2005, 2001, 2);


CREATE TABLE posts_answers (
    id INT PRIMARY KEY,
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

INSERT INTO posts_answers (id, post_type_id, creation_date, score, view_count, owner_user_id) VALUES
(1, 1, '2024-01-01', 10, 100, 1001),
(2, 2, '2024-01-05', 20, 150, 1002),
(3, 1, '2024-01-10', 5, 50, 1003),
(4, 2, '2024-01-15', 15, 120, 1001),
(5, 1, '2024-01-20', 30, 200, 1004),
(6, 2, '2024-01-25', 25, 180, 1002),
(7, 1, '2024-02-01', 40, 300, 1003),
(8, 2, '2024-02-05', 10, 80, 1001),
(9, 1, '2024-02-10', 8, 90, 1004),
(10, 2, '2024-02-15', 50, 400, 1002);

CREATE TABLE tags (
    id INT PRIMARY KEY,
    tag_name VARCHAR(255)
);

INSERT INTO tags (id, tag_name) VALUES
(1, 'SQL'),
(2, 'JavaScript'),
(3, 'React'),
(4, 'Python'),
(5, 'AI'),
(6, 'Machine Learning'),
(7, 'Node.js'),
(8, 'CSS'),
(9, 'HTML'),
(10, 'Database');


CREATE TABLE users (
    id INT PRIMARY KEY,
    display_name VARCHAR(255),
    reputation INT,
    creation_date DATE
);

INSERT INTO users (id, display_name, reputation, creation_date) VALUES
(1001, 'Alice', 1500, '2024-01-01'),
(1002, 'Bob', 1200, '2024-01-05'),
(1003, 'Charlie', 800, '2024-01-10'),
(1004, 'Dave', 1800, '2024-01-15'),
(1005, 'Eve', 1000, '2024-01-20'),
(1006, 'Frank', 2000, '2024-01-25'),
(1007, 'Grace', 1300, '2024-02-01'),
(1008, 'Hank', 1100, '2024-02-05'),
(1009, 'Ivy', 900, '2024-02-10'),
(1010, 'Jack', 1600, '2024-02-15');


CREATE TABLE votes (
    id INT PRIMARY KEY,
    post_id INT,
    vote_type_id INT,
    creation_date DATE
);

INSERT INTO votes (id, post_id, vote_type_id, creation_date) VALUES
(1, 2001, 1, '2024-01-01'),
(2, 2002, 2, '2024-01-05'),
(3, 2003, 1, '2024-01-10'),
(4, 2004, 2, '2024-01-15'),
(5, 2005, 1, '2024-01-20'),
(6, 2001, 2, '2024-01-25'),
(7, 2003, 1, '2024-02-01'),
(8, 2004, 2, '2024-02-05'),
(9, 2005, 1, '2024-02-10'),
(10, 2006, 2, '2024-02-15');


CREATE TABLE posts (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

INSERT INTO posts (id, title, post_type_id, creation_date, score, view_count, owner_user_id)
VALUES
(2001, 'How to solve SQL JOIN issues?', 1, '2023-01-01', 10, 100, 1),
(2002, 'Best practices for writing SQL queries', 2, '2023-01-02', 15, 150, 2),
(2003, 'Understanding INNER JOIN in SQL', 1, '2023-01-03', 20, 200, 3),
(2004, 'What is a LEFT JOIN?', 2, '2023-01-04', 25, 250, 4),
(2005, 'Database indexing techniques', 1, '2023-01-05', 30, 300, 5),
(2006, 'Explaining SQL subqueries', 2, '2023-01-06', 35, 350, 6),
(2007, 'How to optimize SQL queries?', 1, '2023-01-07', 40, 400, 7),
(2008, 'Database normalization concepts', 2, '2023-01-08', 45, 450, 8),
(2009, 'SQL Aggregate Functions explained', 1, '2023-01-09', 50, 500, 9),
(2010, 'Introduction to SQL Window Functions', 2, '2023-01-10', 55, 550, 10);

-- Part 1: Basics
  --- --1. Loading and Exploring Data
----- Explore the structure and first 10 rows of each table.
DESCRIBE badges;
SELECT * FROM badges LIMIT 10;
DESCRIBE comments;
SELECT * FROM comments LIMIT 10;
DESCRIBE post_history;
SELECT * FROM post_history LIMIT 10;
DESCRIBE post_links;
SELECT * FROM post_links LIMIT  10;
DESCRIBE posts;
SELECT * FROM posts LIMIT  10;
DESCRIBE posts_answers;
SELECT * FROM posts_answers LIMIT  10;
DESCRIBE tags;
SELECT * FROM tags LIMIT  10;
DESCRIBE users;
SELECT * FROM users LIMIT  10;
DESCRIBE votes;
SELECT * FROM votes LIMIT  10;
--- --Identify the total number of records in each table.
SELECT COUNT(*) AS total_records FROM comments;
SELECT COUNT(*) AS total_records FROM post_history;
SELECT COUNT(*) AS total_records FROM posts_links;
SELECT COUNT(*) AS total_records FROM posts;
SELECT COUNT(*) AS total_records FROM  posts_answers;
SELECT COUNT(*) AS total_records FROM tags;
SELECT COUNT(*) AS total_records FROM users;
SELECT COUNT(*) AS total_records FROM votes;
-- --2. Filtering and Sorting
------ Find all posts with a view_count greater than 100
SELECT *
FROM posts
WHERE view_count > 100;
-- Display comments made in 2005, sorted by creation_date (comments table).comments
SELECT *
FROM comments
WHERE YEAR(creation_date) = 2005
ORDER BY creation_date;
select * 
from comments 
-- 3. Simple Aggregations
-- Count the total number of badges (badges table).
SELECT COUNT(*) AS total_badges
FROM badges;
------ Calculate the average score of posts grouped by post_type_id (posts_answer table).
SELECT 
    post_type_id, 
    AVG(score) AS average_score
FROM 
    posts_answers
GROUP BY 
    post_type_id;
-----PART II JOINS 
---Combine the post_history and posts tables to display the title of posts and the corresponding changes made in the post history.commentspost_historypost_history
SELECT 
    p.id AS post_id,
    p.title AS post_title,
    ph.text AS change_details,
    ph.creation_date AS change_date
FROM 
    post_history ph
JOIN 
    posts p ON ph.post_id = p.id
ORDER BY 
    ph.creation_date;

---Join the users table with badges to find the total badges earned by each user.
SELECT 
    users.id AS user_id,
    users.display_name,
    COUNT(badges.id) AS total_badges
FROM 
    users
LEFT JOIN 
    badges ON users.id = badges.user_id
GROUP BY 
    users.id, users.display_name
ORDER BY 
    total_badges DESC;
    
    ---2. Multi-Table Joins
    ---Fetch the titles of posts (posts), their comments (comments), and the users who made those comments (users).
    SELECT 
    posts.title AS post_title,
    comments.text AS comment_text,
    users.display_name AS commenter_name
FROM 
    comments
JOIN 
    posts ON comments.post_id = posts.id
JOIN 
    users ON comments.user_id = users.id
ORDER BY 
    posts.title, comments.creation_date;
    ---Combine post_links with posts to list related questions.
    SELECT 
    p1.title AS original_question,
    p2.title AS related_question
FROM 
    post_links
JOIN 
    posts p1 ON post_links.post_id = p1.id
JOIN 
    posts p2 ON post_links.related_post_id = p2.id
WHERE 
    p1.post_type_id = 1 AND p2.post_type_id = 1
ORDER BY 
    p1.title, p2.title;
    ---Join the users, badges, and comments tables to find the users who have earned badges and made comments.
    SELECT 
    users.id AS user_id,
    users.display_name AS user_name,
    COUNT(DISTINCT badges.id) AS total_badges,
    COUNT(DISTINCT comments.id) AS total_comments
FROM 
    users
JOIN 
    badges ON users.id = badges.user_id
JOIN 
    comments ON users.id = comments.user_id
GROUP BY 
    users.id, users.display_name
HAVING 
    total_badges > 0 AND total_comments > 0
ORDER BY 
    user_name;
----Part 3: Subqueries
---1. Single-Row Subqueries
--○ Find the user with the highest reputation (users table).
SELECT 
    id AS user_id,
    display_name AS user_name,
    reputation
FROM 
    users
WHERE 
    reputation = (SELECT MAX(reputation) FROM users);
    ---Retrieve posts with the highest score in each post_type_id (posts table).
    SELECT 
    id AS post_id,
    title,
    post_type_id,
    score
FROM 
    posts p1
WHERE 
    score = (SELECT MAX(score) 
             FROM posts p2 
             WHERE p1.post_type_id = p2.post_type_id)
---Part 4: Common Table Expressions (CTEs)
--Non-Recursive CTE
Create a CTE to calculate the average score of posts by each user and use it to:
■ List users with an average score above 50.
WITH user_avg_scores AS (
    SELECT 
        owner_user_id,
        AVG(score) AS avg_score
    FROM 
        posts
    GROUP BY 
        owner_user_id
)
SELECT 
    owner_user_id,
    avg_score
FROM 
    user_avg_scores
WHERE 
    avg_score > 50;

---■ Rank users based on their average post score.
SELECT 
    owner_user_id,
    avg_score,
    RANK() OVER (ORDER BY avg_score DESC) AS ranking
FROM (
    -- Subquery to calculate the average score per user
    SELECT 
        owner_user_id,
        AVG(score) AS avg_score
    FROM 
        posts
    GROUP BY 
        owner_user_id
) AS user_avg_scores;
---2. Recursive CTE
---Simulate a hierarchy of linked posts using the post_links table.
SELECT pl.post_id AS parent_post_id, 
       pl.related_post_id AS child_post_id,
       p1.title AS parent_post_title, 
       p2.title AS child_post_title
FROM post_links pl
JOIN posts p1 ON pl.post_id = p1.id
JOIN posts p2 ON pl.related_post_id = p2.id
ORDER BY pl.post_id;
----Part 5: Advanced Queries
---1. Window Functions
○ Rank posts based on their score within each year (posts table).
SELECT 
    p.id AS post_id,
    p.title AS post_title,
    p.creation_date,
    p.score,
    EXTRACT(YEAR FROM p.creation_date) AS post_year,
    RANK() OVER (PARTITION BY EXTRACT(YEAR FROM p.creation_date) ORDER BY p.score DESC) AS post_rank
FROM posts p
ORDER BY post_year, post_rank;
---○ Calculate the running total of badges earned by users (badges table).
SELECT 
    b.user_id,
    u.display_name,
    b.name AS badge_name,
    b.date AS badge_date,
    SUM(CASE WHEN b.date <= CURRENT_DATE THEN 1 ELSE 0 END) OVER (PARTITION BY b.user_id ORDER BY b.date) AS running_total_badges
FROM badges b
JOIN users u ON b.user_id = u.id
ORDER BY b.user_id, b.date;
--DATA INSIGHTS 
---Which users have contributed the most in terms of comments, edits, and votes?
SELECT u.id, u.display_name, COUNT(b.id) AS badge_count
FROM Users u
JOIN Badges b ON u.id = b.user_id
GROUP BY u.id, u.display_name
ORDER BY badge_count DESC
LIMIT 1
SELECT u.id, u.display_name, COUNT(c.id) AS comment_count
FROM Users u
JOIN Comments c ON u.id = c.user_id
GROUP BY u.id, u.display_name
ORDER BY comment_count DESC
LIMIT 1;
SELECT u.id, u.display_name, COUNT(ph.id) AS edit_count
FROM Users u
JOIN Post_History ph ON u.id = ph.user_id
WHERE ph.post_history_type_id = 2  -- Assuming '2' corresponds to edits
GROUP BY u.id, u.display_name
ORDER BY edit_count DESC
LIMIT 1;
SELECT u.id, u.display_name, COUNT(v.id) AS vote_count
FROM Users u
JOIN Posts p ON u.id = p.owner_user_id
JOIN Votes v ON p.id = v.post_id
GROUP BY u.id, u.display_name
ORDER BY vote_count DESC
LIMIT 1;


SELECT 
    (SELECT display_name FROM Users u JOIN Badges b ON u.id = b.user_id 
     GROUP BY u.id ORDER BY COUNT(b.id) DESC LIMIT 1) AS Top_Badge_User,
     
    (SELECT display_name FROM Users u JOIN Comments c ON u.id = c.user_id 
     GROUP BY u.id ORDER BY COUNT(c.id) DESC LIMIT 1) AS Top_Comment_User,
    
    (SELECT display_name FROM Users u JOIN Post_History ph ON u.id = ph.user_id 
     WHERE ph.post_history_type_id = 2 GROUP BY u.id ORDER BY COUNT(ph.id) DESC LIMIT 1) AS Top_Editor_User,

    (SELECT display_name FROM Users u JOIN Posts p ON u.id = p.owner_user_id 
     JOIN Votes v ON p.id = v.post_id 
     GROUP BY u.id ORDER BY COUNT(v.id) DESC LIMIT 1) AS Top_Voted_User;
 SELECT COALESCE(u.display_name, 'Anonymous') AS top_user, COUNT(v.id) AS vote_count
FROM Votes v
JOIN Posts p ON v.post_id = p.id
LEFT JOIN Users u ON p.owner_user_id = u.id
GROUP BY u.display_name
ORDER BY vote_count DESC
LIMIT 1;
---What types of badges are most commonly earned, and which users are the top earners?
SELECT name AS badge_name, COUNT(*) AS badge_count
FROM Badges
GROUP BY name
ORDER BY badge_count DESC
LIMIT 10;
SELECT u.display_name, COUNT(b.id) AS total_badges
FROM Users u
JOIN Badges b ON u.id = b.user_id
GROUP BY u.id, u.display_name
ORDER BY total_badges DESC
LIMIT 10; 

SELECT b.user_id, u.display_name, b.name AS badge_name, COUNT(*) AS badge_count
FROM Badges b
JOIN Users u ON b.user_id = u.id
GROUP BY b.user_id, u.display_name, b.name
ORDER BY badge_count DESC, user_id
LIMIT 10;
---Which tags are associated with the highest-scoring posts?
SELECT id AS post_id, score
FROM Posts
ORDER BY score DESC
LIMIT 1;
SELECT * FROM Tags LIMIT 10;
SELECT p.id AS post_id, p.score, t.tag_name
FROM posts_answers p
JOIN tags t ON p.id = t.id  -- Replace `post_id` with the actual column if it's different
WHERE p.score = (SELECT MAX(score) FROM posts_answers);
--alternative way 
SELECT p.id AS post_id, p.score, t.tag_name
FROM posts_answers p
JOIN tags t ON p.id = t.id
WHERE p.score = (SELECT MAX(score) FROM posts_answers);
---How often are related questions linked, and what does this say about knowledge sharing?
SELECT link_type_id, COUNT(*) AS link_count
FROM post_links
GROUP BY link_type_id
ORDER BY link_count DESC;