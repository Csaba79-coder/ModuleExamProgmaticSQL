-- 2. rész: lekérdezések, utasítások írása (összesen 20 pont - bónuszok nélkül)

-- a lekérdezések a progmatic_module_test_db nevű adatbázishoz tartoznak
-- a progmatic_module_test_db adatbázis script-je a progmatic_module_test_db.sql file-ban található

USE progmatic_module_test_db;


/* 1. (2 pont)
	Kik a nem-diákok az adatbázisban?
		Írj lekérdezést, amely visszaadja azoknak a tagoknak (members) az összes adatát, akik nem diákok!
*/
SELECT *FROM members WHERE state != 'student';

    
/* 2. (2 pont)
	Hány személy szerepel az adatbázisban beosztásonként, ahol a beosztás nem 'unknown'?
		Írj lekérdezést, amely visszaadja a beosztás megnevezését (state) és a személyek számát, 
		ahányan azzal a beosztással szerepelnek az adatbázisban, de csak akkor, ha a beosztás NEM 'unknown'!
*/
SELECT state, COUNT(state) FROM members GROUP BY state HAVING state != 'unknown';
		

/* 3. (2 pont)
	Mennyi a legtöbb szerezhető kredit?
		Írj lekérdezést, amely visszaadja azt a legmagasabb kreditszámot, amit egy tantárgyért kapni lehet!
*/
SELECT MAX(credit) AS 'The most credits are available for one subject' FROM subjects;  /* Adatbázis létrehozása... micsida véletlen :D */


/* 4. (2 pont)
	Milyen nappali képzések vannak?
		Írj lekérdezést, amely visszaadja a nappali kurzusok minden adatát az időtartamuk szerint csökkenő sorrendben!
*/
SELECT *FROM courses WHERE is_daytime = TRUE ORDER BY length_week DESC;


/* 5. (2 pont)
	Melyek azok a tantárgyak, amelyek neve tartalmazza a “programozás” vagy a “Programozás” szavak valamelyikét?
		Írj lekérdezést, amely visszaadja a tantárgyak nevét, amelyek nevében a fenti szavak egyike szerepel!
*/
SELECT subject_name FROM subjects WHERE subject_name LIKE '%programozás%' OR subject_name LIKE '%Programozás%'; /* ha az OR után nem írom a "subject_name LIKE"-ot szerintem akkor is jól működik. */


/* 6. (2 pont)
	Melyek azok a tantárgyak, amelyeket hétvégén tartanak?
		Írj lekérdezést, amely visszaadja azon tantárgyak minden adatát, amelyeket szombaton vagy vasárnap tartanak, 
		méghozzá rendezve növekvő sorrendben a következők szerint:
			- először a nap szerint (szombat, vasárnap),
			- másodszor a tantárgy (órákban mért) hosszúsága szerint.
*/
SELECT *FROM subjects INNER JOIN subjects2courses ON subjects.id = subjects2courses.subject_id 
WHERE subjects2courses.schedule_day = 'saturday' or subjects2courses.schedule_day = 'sunday'
ORDER BY subjects2courses.schedule_day,  subjects2courses.schedule_hour ASC;


/* 7. (2 pont) - NINCS KÉSZ!!!!!!!!
	Mi a TOP 3-as kurzuslista, amihez a legkevesebb TANTÁRGY tartozik?
		Írj lekérdezést, amely visszaadja a kurzus id-ját és a hozzá tartozó tantárgyak számát. 
		A találati lista a 3 legkevesebb tantárggyal rendelkező kurzusok id-ját és tantárgyaik számát tartalmazza!
*/
SELECT courses.id AS 'course id', COUNT(subjects2courses.course_id) AS 'subjects in total' FROM subjects2courses 
INNER JOIN courses ON subjects2courses.course_id = courses.id 
GROUP BY subjects2courses.course_id;


/* 8. (2 pont)
	Írj utasítást, amely a members táblához hozzáad egy új mezőt, amelyben telefonszámot lehet tárolni.
*/
ALTER TABLE members ADD phone_number VARCHAR(20); /* Mivel a telefonszám tartalmazhat '+', '/', '(', ')' karaktereket, szerintem a VARCHAR a legjobb adattípus az eltárolására. */


/* 9. (2 pont)
	Írj utasítást, amely módosítja a subjects táblán a 42 id-val rendelkező rekord kreditértékét 2-re.
*/
UPDATE subjects SET credit = 2 WHERE id = 42;


/* 10. (2 pont)
	Írj utasítást, amely hozzáad három új tanárt a members táblához!
	A tanárok adatai a következők legyenek:
		1. neve: Ró Kázmér; email-címe: rokazmer@progmatic.ac
		2. neve: Mor Zsolt; email-címe: morzsolt@progmatic.ac
		3. neve: Rázár Lázár; email-címe: razarlazar@progmatic.ac
*/
INSERT INTO members (name, state, emil) VALUES
('Ró Kázmér', 'teacher', 'rokazmer@progmatic.ac'),
('Mor Zsolt', 'teacher', 'morzsolt@progmatic.ac'),
('Rázár Lázár', 'teacher', 'razarlazar@progmatic.ac');


-- --------------------------------------------------------------------------

/* BÓNUSZ (4 pont)
	Mennyi kredit szerezhető a különböző kurzusokon?
		Írj lekérdezést, amely visszaadja a kurzus azonosítóját, 
		nevét és az összkreditet (azaz a kurzus tantárgyaiért kapható kreditek összegét)!
*/
SELECT courses.course_name, courses.id, SUM(credit)FROM subjects
JOIN subjects2courses ON subjects.id = subjects2courses.subject_id
JOIN courses ON courses.id = subjects2courses.course_id
GROUP BY course_id;


/*  BÓNUSZ (4 pont)
	Kik azok a diákok, akik jelenleg valamilyen esti kurzuson vesznek részt?
		Írj lekérdezést, amely visszaadja a diákok összes adatát, akik esti kurzusra járnak!
*/
SELECT *FROM members
JOIN member2courses ON members.id = member2courses.member_id
JOIN courses ON courses.id = member2courses.course_id
WHERE state = 'student' AND courses.is_daytime = FALSE;
