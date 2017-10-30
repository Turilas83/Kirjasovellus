-- MUISTA! console encoding latin1

INSERT INTO kirja
	(nimi, tekija, isbn, julkaisuvuosi, painos)
VALUES
	('Harry Potter ja salaisuuksien kammio', 'J.K. Rowling', '951-31-1472-4', '1998', '13'),
	('Terästuulen yllä', 'Alastair Reynolds', '978-952-01-1198-4', '2013', ''),
	('Neuromancer', 'William Gibson', '978-1-473-21738-6', '1984', ''),
	('The view from the cheap seats', 'Neil Gaiman', '978-1-4722-0802-6', '2016', '1');
	
INSERT INTO
	authority (id, role)
VALUES
	(2,'ROLE_ADMIN'),
	(1,'ROLE_USER');

-- esimerkkikäyttäjät

INSERT INTO
	webuser (id, username, password_encrypted, enabled, firstname, lastname)
VALUES
	(1, 'mikkokaasinen', '15109e291bb2956dea248681755260209899c2488c7354bc90f63f19e8a42c49a94caa1dd4d0ea7a', 1, 'Mikko', 'Kaasinen'),
	(2, 'admin', '8421c6df465857b41eee8979bc7f132340de0ece2fc1c5c25bb8f55e093d0509c93ebb439054f5c3', 1, 'Aatu', 'Admin');
	
INSERT INTO
	webuser_authority (id, webuser_id, authority_id)
VALUES
	(1,1,2),
	(2,2,1);