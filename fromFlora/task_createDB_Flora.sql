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

DROP DATABASE IF EXISTS messenger_app_db;

CREATE DATABASE IF NOT EXISTS messenger_app_db;

USE messenger_app_db;

CREATE TABLE IF NOT EXISTS registered_users (
	id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    name VARCHAR(50) NOT NULL,
    email_address VARCHAR(70) NOT NULL,
    password VARCHAR(50) NOT NULL,
    profile_picture LONGBLOB,
    date_of_registration TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS messages (
	id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    sender INT NOT NULL,
    FOREIGN KEY (sender) REFERENCES registered_users(id), /* Ide felhasználó nevet vagy emailt szerettem volna, de nem tudott rá referálni valamiért... */
    addressee INT NOT NULL,
    FOREIGN KEY (addressee) REFERENCES registered_users(id),
    message_text TEXT,
    sending_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    replied_message INT ,
    FOREIGN KEY (replied_message) REFERENCES messages(id)
);

INSERT INTO registered_users(id, name, email_address, password) VALUES
(1, 'Ria', 'master@mymail.com', MD5('ria')), /* MD5 elvileg titkosít/encryptel/encodol */
(2, 'Flóra', 'padavan@mymail.com', MD5('flóra'));

INSERT INTO messages(id, sender, addressee, message_text, replied_message) VALUES
(1, '2', '1', 'Szia Ria! Hogy sikerült az adatbázis modulzáróm?', null),
(2, '1', '2', 'Szia Flóra! Természetesen 100%-os lett. Nagyon ügyes voltál!', 1);




