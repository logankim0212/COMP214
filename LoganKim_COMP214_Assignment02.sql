-- /* QUESTION 01 */
-- CREATE TABLE supplier 
-- (supplier_id NUMBER(10),
-- supplier_name VARCHAR2(50) UNIQUE,
-- contact_name VARCHAR2(50),
-- phone_no VARCHAR2(10) UNIQUE,
-- city VARCHAR2(10),
-- region VARCHAR2(2),
-- CONSTRAINT supplier_supplierid_pk PRIMARY KEY(supplier_id),
-- CONSTRAINT supplier_region_ck
-- CHECK (region IN ('N', 'NW', 'NE', 'S', 'SE', 'SW', 'W', 'E')));

-- --#1
-- INSERT INTO supplier VALUES (500, 'Kyle Lowry', 'Ayahna Cornish-Lowry', '123-1234', 'Florida', 'S');
-- INSERT INTO supplier VALUES (501, 'Kawhi Leonard', 'Kishele Shipley', '234-2345', 'Vaughan', 'SW');
-- INSERT INTO supplier VALUES (502, 'Danny Green', 'Fred VanVleet', '345-3456', 'Maple', 'SW');
-- INSERT INTO supplier VALUES (503, 'Serge Ibaka', 'Pascal Siakam', '456-4567', 'Aurora', 'NE');
-- INSERT INTO supplier VALUES (504, 'Jonas Valanciunas', 'Egle Valanciuniene', '567-5678', 'Newmarket', 'N');

-- SELECT * FROM supplier;

-- --#2
-- SELECT * FROM supplier WHERE supplier_id = 500 AND city = 'Florida';

-- --#3
-- ALTER TABLE supplier ADD(phone#_test VARCHAR2(10));
-- DESC supplier;

-- --#4
-- ALTER TABLE supplier DROP COLUMN phone#_test;
-- DESC supplier;

-- --#5
-- DROP TABLE SUPPLIER;

-- --#6
-- CREATE VIEW supplier_contact AS
--   SELECT supplier_id, supplier_name, phone_no FROM supplier;
  
-- SELECT * FROM
-- supplier_contact;


/* QUESTION 02 b) */
-- DECLARE
--     order_quantity NUMBER(3) := 7;
--     is_member CHAR(1) := 'N';
    
--     quantity_up_to_three CONSTANT NUMBER(1) := 3;
--     quantity_up_to_six CONSTANT NUMBER(1) := 6;
--     quantity_up_to_ten CONSTANT NUMBER(2) := 10;
    
--     regular_ship_up_to_three CONSTANT NUMBER(1) := 8;
--     regular_ship_up_to_six CONSTANT NUMBER(1) := 7;
--     regular_ship_up_to_ten CONSTANT NUMBER(2) := 10;
--     regular_ship_more_than_ten CONSTANT NUMBER(2) := 15;

--     member_ship_up_to_three CONSTANT NUMBER(1) := 4;
--     member_ship_up_to_six CONSTANT NUMBER(2,1) := 3.5;
--     member_ship_up_to_ten CONSTANT NUMBER(1) := 5;
--     member_ship_more_than_ten CONSTANT NUMBER(2,1) := 7.5;
    
--     error_message VARCHAR2(100) := 'Membership status should be Y or N';
-- BEGIN
--     IF is_member = 'Y' THEN
--         IF order_quantity <= quantity_up_to_three THEN
--             DBMS_OUTPUT.PUT_LINE(member_ship_up_to_three);
--         ELSIF order_quantity <= quantity_up_to_six THEN
--             DBMS_OUTPUT.PUT_LINE(member_ship_up_to_six);
--         ELSIF order_quantity <= quantity_up_to_ten THEN
--             DBMS_OUTPUT.PUT_LINE(member_ship_up_to_ten);
--         ELSE
--             DBMS_OUTPUT.PUT_LINE(member_ship_more_than_ten);
--         END IF;
--     ELSIF is_member = 'N' THEN
--         IF order_quantity <= quantity_up_to_three THEN
--             DBMS_OUTPUT.PUT_LINE(regular_ship_up_to_three);
--         ELSIF order_quantity <= quantity_up_to_six THEN
--             DBMS_OUTPUT.PUT_LINE(regular_ship_up_to_six);
--         ELSIF order_quantity <= quantity_up_to_ten THEN
--             DBMS_OUTPUT.PUT_LINE(regular_ship_up_to_ten);
--         ELSE
--             DBMS_OUTPUT.PUT_LINE(regular_ship_more_than_ten);
--         END IF;
--     ELSE
--         DBMS_OUTPUT.PUT_LINE(error_message);
--     END IF;
-- END;
-- /

/* QUESTION 03 */
-- DROP TABLE messages;
-- CREATE TABLE messages(results NUMBER(3));

-- BEGIN
--     FOR i in 1..10 LOOP
--         IF i = 6 or i = 8 THEN
--             null;
--         ELSE
--             INSERT INTO messages(results)
--             VALUES (i);
--         END IF;
--     END LOOP;
--     COMMIT;
-- END;
-- /
-- SELECT results
-- FROM messages;