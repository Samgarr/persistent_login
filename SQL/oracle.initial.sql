/*
 * Roundcube Persistent Login Schema
 *
 * @author Gene Hawkins <texxasrulez@yahoo.com>
 *
 * @licence GNU AGPL
 */

CREATE TABLE auth_tokens (
    token varchar2(128) NOT NULL,
    expires timestamp(0) NOT NULL,
    user_id number(10) check (user_id > 0) NOT NULL,
    user_name varchar2(128) NOT NULL,
    user_pass varchar2(128) NOT NULL,
	host varchar2(255) NOT NULL
   ,
	PRIMARY KEY (token),
	CONSTRAINT auth_tokens_ibfk_1 FOREIGN KEY (user_id)
	REFERENCES users(user_id) ON DELETE CASCADE
) /*!40000 ENGINE=INNODB */ /*!40101 CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

CREATE INDEX user_id_fk_auth_tokens ON auth_tokens (user_id);

REPLACE INTO `system` (name, value) SELECT  'tx-persistent-login-version', '2020080200'  FROM dual;
