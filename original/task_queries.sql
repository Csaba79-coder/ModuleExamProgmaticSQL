-- 2. rész: lekérdezések, utasítások írása (összesen 20 pont - bónuszok nélkül)

-- a lekérdezések a progmatic_module_test_db nevű adatbázishoz tartoznak
-- a progmatic_module_test_db adatbázis script-je a progmatic_module_test_db.sql file-ban található


/* 1. (2 pont)
	Kik a nem-diákok az adatbázisban?
		Írj lekérdezést, amely visszaadja azoknak a tagoknak (members) az összes adatát, akik nem diákok!
*/


    
/* 2. (2 pont)
	Hány személy szerepel az adatbázisban beosztásonként, ahol a beosztás nem 'unknown'?
		Írj lekérdezést, amely visszaadja a beosztás megnevezését (state) és a személyek számát, 
		ahányan azzal a beosztással szerepelnek az adatbázisban, de csak akkor, ha a beosztás NEM 'unknown'!
*/

		

/* 3. (2 pont)
	Mennyi a legtöbb szerezhető kredit?
		Írj lekérdezést, amely visszaadja azt a legmagasabb kreditszámot, amit egy tantárgyért kapni lehet!
*/



/* 4. (2 pont)
	Milyen nappali képzések vannak?
		Írj lekérdezést, amely visszaadja a nappali kurzusok minden adatát az időtartamuk szerint csökkenő sorrendben!
*/



/* 5. (2 pont)
	Melyek azok a tantárgyak, amelyek neve tartalmazza a “programozás” vagy a “Programozás” szavak valamelyikét?
		Írj lekérdezést, amely visszaadja a tantárgyak nevét, amelyek nevében a fenti szavak egyike szerepel!
*/



/* 6. (2 pont)
	Melyek azok a tantárgyak, amelyeket hétvégén tartanak?
		Írj lekérdezést, amely visszaadja azon tantárgyak minden adatát, amelyeket szombaton vagy vasárnap tartanak, 
		méghozzá rendezve növekvő sorrendben a következők szerint:
			- először a nap szerint (szombat, vasárnap),
			- másodszor a tantárgy (órákban mért) hosszúsága szerint.
*/



/* 7. (2 pont)
	Mi a TOP 3-as kurzuslista, amihez a legkevesebb kurzus tartozik?
		Írj lekérdezést, amely visszaadja a kurzus id-ját és a hozzá tartozó tantárgyak számát. 
		A találati lista a 3 legkevesebb tantárggyal rendelkező kurzusok id-ját és tantárgyaik számát tartalmazza!
*/


/* 8. (2 pont)
	Írj utasítást, amely a members táblához hozzáad egy új mezőt, amelyben telefonszámot lehet tárolni.
*/



/* 9. (2 pont)
	Írj utasítást, amely módosítja a subjects táblán a 42 id-val rendelkező rekord kreditértékét 2-re.
*/



/* 10. (2 pont)
	Írj utasítást, amely hozzáad három új tanárt a members táblához!
	A tanárok adatai a következők legyenek:
		1. neve: Ró Kázmér; email-címe: rokazmer@progmatic.ac
		2. neve: Mor Zsolt; email-címe: morzsolt@progmatic.ac
		3. neve: Rázár Lázár; email-címe: razarlazar@progmatic.ac
*/



-- --------------------------------------------------------------------------

/* BÓNUSZ (4 pont)
	Mennyi kredit szerezhető a különböző kurzusokon?
		Írj lekérdezést, amely visszaadja a kurzus azonosítóját, 
		nevét és az összkreditet (azaz a kurzus tantárgyaiért kapható kreditek összegét)!
*/



/*  BÓNUSZ (4 pont)
	Kik azok a diákok, akik jelenleg valamilyen esti kurzuson vesznek részt?
		Írj lekérdezést, amely visszaadja a diákok összes adatát, akik esti kurzusra járnak!
*/


