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


