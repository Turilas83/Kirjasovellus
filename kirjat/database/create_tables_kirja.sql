CREATE TABLE kirja (
	id SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nimi VARCHAR(255) NOT NULL,
	tekija VARCHAR(255) NOT NULL,
	isbn VARCHAR(20) NOT NULL,
	julkaisuvuosi INT(4) NOT NULL,
	painos INT(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 CREATE TABLE authority (
  id integer NOT NULL auto_increment PRIMARY KEY,
  role varchar(255) NOT NULL UNIQUE
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
 CREATE TABLE webuser (
  id integer NOT NULL auto_increment PRIMARY KEY,
  username varchar(255) NOT NULL UNIQUE,
  password_encrypted varchar(255) NOT NULL,
  enabled tinyint NOT NULL,
  firstname varchar(255) default NULL,
  lastname varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE webuser_authority (
  id integer NOT NULL auto_increment PRIMARY KEY,
  webuser_id integer NOT NULL,
  authority_id integer NOT NULL,
  FOREIGN KEY (webuser_id) REFERENCES webuser(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (authority_id) REFERENCES authority(id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

