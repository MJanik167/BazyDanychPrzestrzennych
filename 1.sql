CREATE SCHEMA Księgowość;

SET search_path TO Księgowość;

create table pracownicy(
                                            id_pracownika integer generated always as identity
                                                constraint pracownicy_pk
                                                    primary key,
                                            imie          varchar(255),
                                            nazwisko      varchar(255),
                                            adres         varchar(255),
                                            telefon       varchar(255)
                                        )
create table  godziny
                                        (
                                            id_godziny    integer not null
                                                constraint godziny_pk
                                                    primary key,
                                            id_pracownika integer
                                                constraint id_pracownika
                                                    references pracownicy,
                                            liczba_godzin integer,
                                            data          date
                                        )
create table  pensja
                                        (
                                            id_pensji  integer not null
                                                constraint id_pensji
                                                    primary key,
                                            stanowisko varchar,
                                            kwota      double precision
                                        )
create table  premia
                                        (
                                            id_premii integer not null
                                                constraint premia_pk
                                                    primary key,
                                            rodzaj    varchar,
                                            kwota     double precision
                                        )
                                        create table  wynagrodzenie
                                        (
                                            id_wynagrodzenia integer not null
                                                constraint wynagrodzenie_pk
                                                    primary key,
                                            " data"          date,
                                            id_pracownika    integer
                                                constraint " id_pracownika"
                                                    references pracownicy,
                                            id_godziny       integer
                                                constraint id_godziny
                                                    references godziny,
                                            id_pensji        integer
                                                constraint id_pensji
                                                    references pensja,
                                            id_premii        integer
                                                constraint id_premii
                                                    references premia
                                        )
INSERT INTO pracownicy (imie, nazwisko, adres, telefon) VALUES
                                        ('Jan', 'Kowalski', 'ul. Lipowa 5, Kraków', '600123456'),
                                        ('Anna', 'Nowak', 'ul. Długa 10, Warszawa', '601234567'),
                                        ('Piotr', 'Wiśniewski', 'ul. Krótka 2, Gdańsk', '602345678'),
                                        ('Katarzyna', 'Wójcik', 'ul. Mickiewicza 15, Poznań', '603456789'),
                                        ('Michał', 'Kamiński', 'ul. Polna 8, Lublin', '604567890'),
                                        ('Agnieszka', 'Lewandowska', 'ul. Kwiatowa 3, Wrocław', '605678901'),
                                        ('Tomasz', 'Zieliński', 'ul. Ogrodowa 22, Łódź', '606789012'),
                                        ('Ewa', 'Szymańska', 'ul. Szkolna 9, Katowice', '607890123'),
                                        ('Robert', 'Dąbrowski', 'ul. Parkowa 1, Białystok', '608901234'),
                                        ('Magdalena', 'Pawlak', 'ul. Spacerowa 4, Toruń', '609012345')

INSERT INTO godziny (id_godziny, id_pracownika, liczba_godzin, data) VALUES
                                        (1, 1, 160, '2025-01-31'),
                                        (2, 2, 168, '2025-01-31'),
                                        (3, 3, 150, '2025-01-31'),
                                        (4, 4, 172, '2025-01-31'),
                                        (5, 5, 160, '2025-01-31'),
                                        (6, 6, 158, '2025-01-31'),
                                        (7, 7, 165, '2025-01-31'),
                                        (8, 8, 162, '2025-01-31'),
                                        (9, 9, 170, '2025-01-31'),
                                        (10, 10, 155, '2025-01-31')

INSERT INTO pensja (id_pensji, stanowisko, kwota) VALUES
                                        (1, 'Księgowy', 5200),
                                        (2, 'Specjalista IT', 7800),
                                        (3, 'Kierownik', 9500),
                                        (4, 'Asystent', 4200),
                                        (5, 'Magazynier', 4000),
                                        (6, 'Sprzedawca', 4300),
                                        (7, 'HR Manager', 8800),
                                        (8, 'Marketing Specialist', 6400),
                                        (9, 'Technik', 5000),
                                        (10, 'Operator', 4500)

 INSERT INTO premia (id_premii, rodzaj, kwota) VALUES
                                        (1, 'Roczna', 1500),
                                        (2, 'Świąteczna', 1000),
                                        (3, 'Uznaniowa', 800),
                                        (4, 'Za frekwencję', 600),
                                        (5, 'Za wydajność', 1200),
                                        (6, 'Roczna', 1500),
                                        (7, 'Specjalna', 2000),
                                        (8, 'Projektowa', 1800),
                                        (9, 'Za oszczędności', 700),
                                        (10, 'Okazjonalna', 500)

    INSERT INTO wynagrodzenie (id_wynagrodzenia, " data", id_pracownika, id_godziny, id_pensji, id_premii) VALUES
                                        (1, '2025-01-31', 1, 1, 1, 1),
                                        (2, '2025-01-31', 2, 2, 2, 2),
                                        (3, '2025-01-31', 3, 3, 3, 3),
                                        (4, '2025-01-31', 4, 4, 4, 4),
                                        (5, '2025-01-31', 5, 5, 5, 5),
                                        (6, '2025-01-31', 6, 6, 6, 6),
                                        (7, '2025-01-31', 7, 7, 7, 7),
                                        (8, '2025-01-31', 8, 8, 8, 8),
                                        (9, '2025-01-31', 9, 9, 9, 9),
                                        (10, '2025-01-31', 10, 10, 10, 10)