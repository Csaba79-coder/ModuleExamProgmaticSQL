 -- 1. rész: adatbázis készítése (20 pont)

/*
Készíts adatbázist az alábbi leírás alapján!

Az általad létrehozott adatbázist egy üzenetküldő alkalmazáshoz szeretnénk használni.
Az alkalmazásban a felhasználók regisztrálás után tudnak üzenetet küldeni szintén regisztrált felhasználóknak, 
valamint a kapott üzenetekre válaszolhatnak. 
Nincs lehetőség több címzett megadására - azaz egy üzenetet csak egy felhasználó részére lehet küldeni.

Az adatbázisnak képesnek kell lennie a következő adatok tárolására:
    1. regisztrált felhasználók adatai
        - kötelező adatok: név, email-cím, jelszó, profilkép és regisztrálás időpontja
    2. a regisztrált felhasználók által egymásnak küldött üzenetek adatai
        - kötelező adatok: küldő, címzett, üzenet szövege, az üzenet küldésének időpontja, 
          továbbá ha az üzenet egy korábban kapottra válasz, akkor a megválaszolt üzenet

Kritériumok az adatbázissal kapcsolatban:
    - legalább kettő, legfeljebb négy táblát tartalmazzon
    - legyen legalább egy kapcsolat a létrehozott táblák között
      (egy tábla saját magával is kapcsolódhat)
    - a fent leírt adatokon kívül más adatokat is tárolhat, de egy táblán legfeljebb 8 mező lehet
    - az adatbázis, a táblák és a mezők elnevezése rajtad áll, azonban használj angol,
      az adatbázisoknál elfogadott konvencióknak megfelelő neveket

Amit meg kell írnod:
    - adatbázis létrehozásának (és használatának) MySQL utasítása
    - a táblák létrehozásának MySQL utasítása
    - a táblák mezőinek létrehozásához és beállításához szükséges MySQL utasítások

BÓNUSZ (nem kötelezően megírandó):
    - tesztadatok adatbázisba rögzítésének MySQL utasítása (tesztadatokkal együtt)
    
Az elvárt utasításokat ebbe a fájlba írd! Jelen leírás törölhető.
*/

DROP DATABASE IF EXISTS message_center_DB;

CREATE DATABASE IF NOT EXISTS message_center_DB;

USE message_center_DB;

CREATE TABLE IF NOT EXISTS registered_user(
	ID INT UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    profile_photo LONGBLOB,
    reg_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(ID));
    
INSERT INTO registered_user(name, email, password) VALUES
	('Csaba', 'csaba@csaba.hu', '1234'),
    ('Flora', 'flora@flora.hu', '7890'),
    ('Soma', 'soma@soma.hu', '2345'), 
    ('Zééé', 'zoltan@zoltan.hu', '3456');
    
CREATE TABLE IF NOT EXISTS message_info(
	ID INT UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    sender_ID INT NOT NULL,
    receiver_ID INT NOT NULL,
    last_message_text VARCHAR(1000) NOT NULL DEFAULT 'there was no previous message',
    text_of_message VARCHAR(1000),
    message_sending_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(ID));

INSERT INTO message_info(sender_ID, receiver_ID, text_of_message) VALUES 
	(1, 2, 'this is the first message');
    
CREATE TABLE IF NOT EXISTS message_center(
	ID INT UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    registered_user_ID INT UNSIGNED NOT NULL,
    message_info_ID INT UNSIGNED NOT NULL,
    primary key(ID),
    FOREIGN KEY(registered_user_ID) REFERENCES registered_user(ID),
    FOREIGN KEY(message_info_ID) REFERENCES message_info(ID));
    
