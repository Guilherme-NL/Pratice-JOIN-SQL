--Exercício 1
SELECT COUNT("endDate") AS "currentExperiences" FROM experiences;

--Exercício 2
SELECT "userId" AS id, COUNT("courseId") AS educations 
FROM educations 
GROUP BY "userId";

--Exercício 3
SELECT users.name AS writer, COUNT(testimonials.message) AS testimonailCount 
FROM testimonials 
JOIN users ON users.id = testimonials."writerId" 
GROUP BY users.name;

--Exercício 4
SELECT MAX(jobs.salary) AS "maximumSalary", roles.name AS role 
FROM jobs 
JOIN roles ON roles.id = jobs."roleId" 
WHERE jobs.active = true 
GROUP BY roles.name 
ORDER BY "maximumSalary" ASC;

