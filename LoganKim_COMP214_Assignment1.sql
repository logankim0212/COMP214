/* Logan Kim */
/* COMP214-008 */
/* Assignment 1 */

/* Question 1 */
/* List the name of each officer who has reported more than the average number of crimes officers have reported */
SELECT co.officer_id, o.last, o.first
FROM crime_officers co
JOIN officers o
ON co.officer_id = o.officer_id
GROUP BY co.officer_id, o.last, o.first
HAVING COUNT(*) > (SELECT COUNT(*) / COUNT(DISTINCT officer_id) 
                   FROM crime_officers);

/* Question 2 */
/* List the criminal names for all criminals who have a less than average number of crimes and aren't listed as violent offenders */
SELECT cls.criminal_id, cls.first, cls.last
FROM criminals cls
JOIN crimes cr
ON cls.criminal_id = cr.criminal_id
WHERE cls.v_status = 'N'
GROUP BY cls.criminal_id, cls.first, cls.last
HAVING COUNT(*) < (SELECT COUNT(*) / COUNT(DISTINCT criminal_id)
                   FROM crimes)
ORDER BY criminal_id;

/* Question 3 */
/* List appeal information for each appeal that has less than average number of days between filing and hearing dates */
SELECT *
FROM appeals
WHERE hearing_date - filing_date < (SELECT AVG(hearing_date - filing_date)
                                    FROM appeals);

/* Question 4 */
/* List the names of probation officers who have had a less than average number of criminals assigned */
SELECT p.prob_id, p.last, p.first 
FROM prob_officers p
JOIN sentences s
ON p.prob_id = s.prob_id
GROUP BY p.prob_id, p.last, p.first 
HAVING COUNT(*) < (SELECT COUNT(sentence_id) / COUNT(DISTINCT prob_id)
                   FROM sentences)
ORDER BY prob_id;

/* Question 5 */
/* List each crime that has had the highest number of appeals recorded */
SELECT crime_id
FROM Appeals
GROUP BY crime_id
HAVING COUNT(*) =ANY (SELECT COUNT(*)
                      FROM Appeals
                      GROUP BY crime_id)
ORDER BY crime_id;