-- Exercício 1
WITH tabel AS (SELECT users.id, users.name, cities.name AS city FROM users JOIN cities ON users."cityId" = cities.id)
SELECT * FROM tabel WHERE tabel.city = 'Rio de Janeiro';

-- Exercício 2
WITH newtestimonials AS (SELECT testimonials.id, testimonials."recipientId", testimonials.message, users.name AS writer FROM testimonials JOIN users ON users.id = testimonials."writerId") 
SELECT newtestimonials.id, newtestimonials.writer, users.name AS recipient, newtestimonials.message FROM newtestimonials JOIN users ON users.id = newtestimonials."recipientId";

--Exercício 3
SELECT educations."userId" AS id, users.name, schools.name AS school, courses.name AS course, educations."endDate" FROM educations JOIN users ON users.id = educations."userId" JOIN schools ON educations."schoolId" = schools.id JOIN courses ON educations."courseId" = courses.id WHERE educations."userId" = 30 AND educations.status = 'finished';

--Exercício 4
SELECT experiences."userId" AS id, users.name, roles.name AS role, companies.name AS company, experiences."startDate" FROM experiences JOIN users ON users.id = experiences."userId" JOIN roles ON roles.id = experiences."roleId" JOIN companies ON companies.id = experiences."companyId" WHERE experiences."userId" = 50 AND experiences."endDate" ISNULL;
