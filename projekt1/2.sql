Select id_pracownika, nazwisko FROM pracownicy;

SELECT w.id_pracownika FROM wynagrodzenie w
JOIN pensja p ON w.id_pensji = p.id_pensji
JOIN premia pr ON w.id_premii = pr.id_premii
WHERE (p.kwota + pr.kwota) > 1000;

SELECT w.id_pracownika FROM wynagrodzenie w
JOIN pensja p ON w.id_pensji = p.id_pensji
JOIN premia pr ON w.id_premii = pr.id_premii
WHERE pr.kwota=0 AND p.kwota>2000;

SELECT imie, nazwisko FROM pracownicy
WHERE imie like 'J%';

SELECT imie, nazwisko FROM pracownicy
WHERE nazwisko ilike 'n%a';

SELECT p.imie, p.nazwisko, liczba_godzin-160 AS nadgodziny FROM godziny g
JOIN pracownicy p on g.id_pracownika = p.id_pracownika
where (liczba_godzin-160)>0;

SELECT p.imie,p.nazwisko FROM pracownicy p
JOIN wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN pensja pe ON w.id_pensji = pe.id_pensji
JOIN premia pr ON w.id_premii = pr.id_premii
WHERE pe.kwota BETWEEN 1500 AND 3000;

SELECT  p.imie, p.nazwisko FROM pracownicy p
JOIN wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN godziny g ON w.id_godziny = g.id_godziny
JOIN premia pr ON w.id_premii = pr.id_premii
WHERE g.liczba_godzin > 160 AND pr.kwota = 0;

SELECT p.imie, p.nazwisko, (pe.kwota + pr.kwota) AS laczne_wynagrodzenie FROM pracownicy p
JOIN wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN pensja pe ON w.id_pensji = pe.id_pensji
LEFT JOIN premia pr ON w.id_premii = pr.id_premii
ORDER BY laczne_wynagrodzenie;

SELECT p.imie, p.nazwisko, (pe.kwota + pr.kwota) AS laczne_wynagrodzenie FROM pracownicy p
JOIN wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN pensja pe ON w.id_pensji = pe.id_pensji
LEFT JOIN premia pr ON w.id_premii = pr.id_premii
ORDER BY laczne_wynagrodzenie DESC ;

SELECT pe.stanowisko, COUNT(p.id_pracownika) AS liczba_pracownikow FROM pracownicy p
JOIN wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN pensja pe ON w.id_pensji = pe.id_pensji
GROUP BY pe.stanowisko;

SELECT pe.stanowisko,AVG(pe.kwota),MIN(pe.kwota),MAX(pe.kwota) FROM pracownicy p
JOIN wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN pensja pe ON w.id_pensji = pe.id_pensji
WHERE pe.stanowisko = 'Kierownik'
GROUP BY pe.stanowisko;

SELECT SUM(pe.kwota + pr.kwota) FROM wynagrodzenie w
JOIN pensja pe ON w.id_pensji = pe.id_pensji
LEFT JOIN premia pr ON w.id_premii = pr.id_premii;

SELECT pe.stanowisko,SUM(pe.kwota + pr.kwota) FROM wynagrodzenie w
JOIN pensja pe ON w.id_pensji = pe.id_pensji
LEFT JOIN premia pr ON w.id_premii = pr.id_premii
GROUP BY pe.stanowisko;

SELECT pe.stanowisko,COUNT(pr.id_premii) AS liczba_premii FROM wynagrodzenie w
JOIN pensja pe ON w.id_pensji = pe.id_pensji
LEFT JOIN premia pr ON w.id_premii = pr.id_premii
GROUP BY pe.stanowisko

DELETE FROM pracownicy
WHERE id_pracownika IN (
    SELECT w.id_pracownika
    FROM wynagrodzenie w
    JOIN pensja p ON w.id_pensji = p.id_pensji
    WHERE p.kwota < 1200
);