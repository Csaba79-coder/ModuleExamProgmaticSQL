-- 2. rész: lekérdezések, utasítások írása (összesen 20 pont - bónuszok nélkül)

-- a lekérdezések a progmatic_module_test_db nevű adatbázishoz tartoznak

USE progmatic_module_test_db;

-- a progmatic_module_test_db adatbázis script-je a progmatic_module_test_db.sql file-ban található


/* 1. (2 pont)
	Kik a nem-diákok az adatbázisban?
		Írj lekérdezést, amely visszaadja azoknak a tagoknak (members) az összes adatát, akik nem diákok!
*/

SELECT * FROM members WHERE state != 'student';
    
/* 2. (2 pont)
	Hány személy szerepel az adatbázisban beosztásonként, ahol a beosztás nem 'unknown'?
		Írj lekérdezést, amely visszaadja a beosztás megnevezését (state) és a személyek számát, 
		ahányan azzal a beosztással szerepelnek az adatbázisban, de csak akkor, ha a beosztás NEM 'unknown'!
*/

SELECT state, COUNT(state) FROM members WHERE state != 'unknown' GROUP BY state;		

/* 3. (2 pont)
	Mennyi a legtöbb szerezhető kredit?
		Írj lekérdezést, amely visszaadja azt a legmagasabb kreditszámot, amit egy tantárgyért kapni lehet!
*/

SELECT MAX(credit) FROM subjects;

/* 4. (2 pont)
	Milyen nappali képzések vannak?
		Írj lekérdezést, amely visszaadja a nappali kurzusok minden adatát az időtartamuk szerint csökkenő sorrendben!
*/

SELECT * FROM courses WHERE is_daytime = 1 ORDER BY length_week DESC;

/* 5. (2 pont)
	Melyek azok a tantárgyak, amelyek neve tartalmazza a “programozás” vagy a “Programozás” szavak valamelyikét?
		Írj lekérdezést, amely visszaadja a tantárgyak nevét, amelyek nevében a fenti szavak egyike szerepel!
*/

SELECT subject_name FROM subjects WHERE subject_name LIKE '%programozás%';

/* 6. (2 pont)
	Melyek azok a tantárgyak, amelyeket hétvégén tartanak?
		Írj lekérdezést, amely visszaadja azon tantárgyak minden adatát, amelyeket szombaton vagy vasárnap tartanak, 
		méghozzá rendezve növekvő sorrendben a következők szerint:
			- először a nap szerint (szombat, vasárnap),
			- másodszor a tantárgy (órákban mért) hosszúsága szerint.
*/

SELECT * FROM subjects2courses WHERE schedule_day = 'saturday' OR schedule_day = 'sunday' ORDER BY schedule_day, schedule_hour;

/* 7. (2 pont)
	Mi a TOP 3-as kurzuslista, amihez a legkevesebb kurzus tartozik?
		Írj lekérdezést, amely visszaadja a kurzus id-ját és a hozzá tartozó tantárgyak számát. 
		A találati lista a 3 legkevesebb tantárggyal rendelkező kurzusok id-ját és tantárgyaik számát tartalmazza!
        
        "Mi a TOP 3-as kurzuslista, amihez a legkevesebb TANTÁRGY tartozik?" 
*/

SELECT course_id, COUNT(subject_name) 
	FROM subjects2courses 
		JOIN subjects ON subjects2courses.subject_id = subjects.id 
			GROUP BY course_id 
				ORDER BY COUNT(subject_name)
					LIMIT 3;

/* 8. (2 pont)
	Írj utasítást, amely a members táblához hozzáad egy új mezőt, amelyben telefonszámot lehet tárolni.
*/

-- I wanted to store phone number as STRING!!! regarding the format: +36-90-...
ALTER TABLE members ADD  phone_number VARCHAR(50);

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

INSERT INTO members(name, state, emil) VALUES
	('Ró Kázmér', 'teacher', 'rokazmer@progmatic.ac'),
    ('Mor Zsolt', 'teacher', 'morzsolt@progmatic.ac'),
    ('Rázár Lázár', 'teacher', 'razarlazar@progmatic.ac');

-- --------------------------------------------------------------------------

/* BÓNUSZ (4 pont)
	Mennyi kredit szerezhető a különböző kurzusokon?
		Írj lekérdezést, amely visszaadja a kurzus azonosítóját, 
		nevét és az összkreditet (azaz a kurzus tantárgyaiért kapható kreditek összegét)!
*/

-- kurzus tárgyai subjects includes subject_name and credit! és ezt join a course-hoz (használva a kapcsolótáblát a subjects2coursest!)
-- SUM(credit) GROUP BY course_name

SELECT courses.course_name, courses.id, SUM(credit) 
	FROM subjects 
		JOIN subjects2courses 
			ON subjects.ID = subjects2courses.subject_id 
				JOIN courses 
					ON courses.id = subjects2courses.course_id
						GROUP BY course_id;

/*  BÓNUSZ (4 pont)
	Kik azok a diákok, akik jelenleg valamilyen esti kurzuson vesznek részt?
		Írj lekérdezést, amely visszaadja a diákok összes adatát, akik esti kurzusra járnak!
*/

-- leválogatni az esti kurzusokat (szükségem van a members összes sorára --> SELECT *)
-- ABC sorrendbe rendezve válogattam le, és csak a members táblán lévő adatait adtam vissza a diákok adataként ...

SELECT members.ID, members.name, members.emil, members.profil_picture, members.reg_time, members.phone_number
	FROM members
		JOIN member2courses 
			ON members.id = member2courses.member_id
				JOIN courses 
					ON courses.id = member2courses.course_id
						WHERE state = 'student' 
							AND courses.is_daytime = 0
								ORDER BY members.name;