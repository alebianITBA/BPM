--
-- CREATE ROLE AND DATABASE
--
DROP DATABASE IF EXISTS abezdjian_bpm;
DROP ROLE IF EXISTS ALEJANDROBEZDJIAN;
CREATE USER alejandrobezdjian CREATEDB LOGIN PASSWORD '12345678';

CREATE DATABASE abezdjian_bpm OWNER alejandrobezdjian;
\connect abezdjian_bpm

--
-- CREATE TABLES
--
CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX clients_id_index ON clients(id);

GRANT ALL PRIVILEGES ON TABLE clients TO alejandrobezdjian;

CREATE TABLE credit_cards (
    id SERIAL PRIMARY KEY,
    card_number VARCHAR(32) NOT NULL,
    card_provider VARCHAR(32) NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE UNIQUE INDEX credit_cards_id_index ON credit_cards(id);

GRANT ALL PRIVILEGES ON TABLE credit_cards TO alejandrobezdjian;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    price INT NOT NULL,
    description VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX products_id_index ON products(id);

GRANT ALL PRIVILEGES ON TABLE products TO alejandrobezdjian;

CREATE TABLE purchases (
    id SERIAL PRIMARY KEY,
    price INT NOT NULL,
    product_id INT NOT NULL,
    client_id INT NOT NULL,
    checkout_id INT,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE UNIQUE INDEX purchases_id_index ON purchases(id);

GRANT ALL PRIVILEGES ON TABLE purchases TO alejandrobezdjian;
GRANT ALL PRIVILEGES ON SEQUENCE purchases_id_seq TO alejandrobezdjian;

--
-- LOAD DATA
--
BEGIN;
-- INSERT CLIENTS DATA
INSERT INTO clients (email) VALUES ('teresa_hills@yahoo.com');
INSERT INTO clients (email) VALUES ('sylvester.littel@yahoo.com');
INSERT INTO clients (email) VALUES ('ferne.steuber@gmail.com');
INSERT INTO clients (email) VALUES ('mikel@hotmail.com');
INSERT INTO clients (email) VALUES ('malika@yahoo.com');
INSERT INTO clients (email) VALUES ('gilda@gmail.com');
INSERT INTO clients (email) VALUES ('harmony.oconnell@yahoo.com');
INSERT INTO clients (email) VALUES ('shana@yahoo.com');
INSERT INTO clients (email) VALUES ('judge.hickle@hotmail.com');
INSERT INTO clients (email) VALUES ('dayana_parisian@hotmail.com');
INSERT INTO clients (email) VALUES ('jazmyne@hotmail.com');
INSERT INTO clients (email) VALUES ('janis.stiedemann@gmail.com');
INSERT INTO clients (email) VALUES ('lavonne.boyer@yahoo.com');
INSERT INTO clients (email) VALUES ('beau.hane@gmail.com');
INSERT INTO clients (email) VALUES ('deshawn@hotmail.com');
INSERT INTO clients (email) VALUES ('lemuel@gmail.com');
INSERT INTO clients (email) VALUES ('will.rogahn@hotmail.com');
INSERT INTO clients (email) VALUES ('penelope@yahoo.com');
INSERT INTO clients (email) VALUES ('opal.strosin@yahoo.com');
INSERT INTO clients (email) VALUES ('augusta@gmail.com');
INSERT INTO clients (email) VALUES ('lane@gmail.com');
INSERT INTO clients (email) VALUES ('boyd@yahoo.com');
INSERT INTO clients (email) VALUES ('gudrun@yahoo.com');
INSERT INTO clients (email) VALUES ('philip.gutmann@yahoo.com');
INSERT INTO clients (email) VALUES ('rebekah_boehm@gmail.com');
INSERT INTO clients (email) VALUES ('gladys.howell@yahoo.com');
INSERT INTO clients (email) VALUES ('zachary_reinger@hotmail.com');
INSERT INTO clients (email) VALUES ('doyle@hotmail.com');
INSERT INTO clients (email) VALUES ('jared@hotmail.com');
INSERT INTO clients (email) VALUES ('viva.blanda@yahoo.com');
INSERT INTO clients (email) VALUES ('darby_okeefe@yahoo.com');
INSERT INTO clients (email) VALUES ('whitney_roberts@hotmail.com');
INSERT INTO clients (email) VALUES ('jaqueline.toy@yahoo.com');
INSERT INTO clients (email) VALUES ('herminio@gmail.com');
INSERT INTO clients (email) VALUES ('lera.homenick@yahoo.com');
INSERT INTO clients (email) VALUES ('isai.towne@gmail.com');
INSERT INTO clients (email) VALUES ('cordell_hirthe@yahoo.com');
INSERT INTO clients (email) VALUES ('maureen.oconnell@hotmail.com');
INSERT INTO clients (email) VALUES ('willow.leannon@gmail.com');
INSERT INTO clients (email) VALUES ('willis@hotmail.com');
INSERT INTO clients (email) VALUES ('emile.luettgen@hotmail.com');
INSERT INTO clients (email) VALUES ('iva.stoltenberg@gmail.com');
INSERT INTO clients (email) VALUES ('beverly_welch@hotmail.com');
INSERT INTO clients (email) VALUES ('buford@gmail.com');
INSERT INTO clients (email) VALUES ('evangeline_feeney@yahoo.com');
INSERT INTO clients (email) VALUES ('alf.fahey@hotmail.com');
INSERT INTO clients (email) VALUES ('reynold_tillman@yahoo.com');
INSERT INTO clients (email) VALUES ('christiana.stoltenberg@yahoo.com');
INSERT INTO clients (email) VALUES ('vincenza_jast@yahoo.com');
INSERT INTO clients (email) VALUES ('rosemary.leuschke@gmail.com');
-- INSERT CREDIT CARDS DATA
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '372349932840045', 1);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '340575811762608', 2);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '378947885602322', 3);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '349793675038103', 4);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '376342678812449', 5);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '373896013562756', 6);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '341971231603606', 7);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '347125631815021', 8);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '376912316923632', 9);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '347465049168484', 10);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '374462342113636', 11);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '378307788798554', 12);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '343284752833067', 13);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '376025202633478', 14);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '348133764470977', 15);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '375595867842649', 16);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '344938339170066', 17);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '342538982036507', 18);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '377775306016298', 19);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('AMEX', '377412467847986', 20);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4532013384943330', 21);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4916715326317086', 22);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4539692939843765', 23);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4916533196953645', 24);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4485310499123809', 25);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4075860584530397', 26);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4485198854171020', 27);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4539987814416376', 28);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4929470762467202', 29);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4850557718301858', 30);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4485785934160229', 31);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4024007136117388', 32);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4929436055744326', 33);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4485810798785745', 34);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4532049055937946', 35);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4556332024598671', 36);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4716885623664795', 37);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4716950379961934', 38);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4515667440757736', 39);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('VISA', '4024007101901428', 40);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5501683050821020', 41);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5449124747414593', 42);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5534161815646975', 43);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5531898987881954', 44);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5440497158372784', 45);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5509947258696183', 46);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5470530119111132', 47);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5201972812952808', 48);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5172477918317687', 49);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5562256051265020', 50);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5457926803750424', 1);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5236095851924188', 2);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5171582344503288', 3);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5482951970868972', 4);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5504106175807382', 5);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5256334230439088', 6);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5440982419705435', 7);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5482604175044507', 8);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5455269477597165', 9);
INSERT INTO credit_cards (card_provider, card_number, client_id) VALUES ('MASTERCARD', '5386977585329594', 10);

INSERT INTO products (price, description) VALUES (2000000, 'SAMSUNG GALAXY S7');
INSERT INTO products (price, description) VALUES (2000000, 'SAMSUNG GALAXY NOTE 5');
INSERT INTO products (price, description) VALUES (1500000, 'SAMSUNG GALAXY A7');
INSERT INTO products (price, description) VALUES (1000000, 'SAMSUNG GALAXY A5');
INSERT INTO products (price, description) VALUES (1500000, 'SAMSUNG GALAXY J7');
INSERT INTO products (price, description) VALUES (2100000, 'APPLE IPHONE 7');
INSERT INTO products (price, description) VALUES (1500000, 'APPLE IPHONE 6S');
INSERT INTO products (price, description) VALUES (1000000, 'APPLE IPHONE 6');
INSERT INTO products (price, description) VALUES (1400000, 'APPLE IPHONE SE');
COMMIT;
