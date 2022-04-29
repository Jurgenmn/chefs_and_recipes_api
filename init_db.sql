DROP DATABASE IF EXISTS dishes_app;   -- if the dataase exists it's gonna delete 
CREATE DATABASE dishes_app;    -- and this line it's gonna create the database
\c dishes_app;


CREATE TABLE chefs(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    restaurant TEXT NOT NULL
);

CREATE TABLE dishes(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL,
    name TEXT NOT NULL,
    chef_id INT NOT NULL,
    CONSTRAINT fk_chef FOREIGN KEY(chef_id) REFERENCES chefs(id) ON DELETE CASCADE
);

CREATE TABLE ingridients(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    type TEXT NOT NULL,
    quantity INT NOT NULL,
    mesurement_unit TEXT NOT NULL
);

CREATE TABLE dishes_ingridients(
    dish_id INT NOT NULL,
    ingridient_id INT NOT NULL,
    CONSTRAINT fk_dishes_ingridients FOREIGN KEY (dish_id) REFERENCES dishes(id) ON DELETE CASCADE,
    CONSTRAINT fk_ingridients_dishes FOREIGN KEY (ingridient_id) REFERENCES ingridients(id)
);

INSERT INTO chefs(name, email, restaurant) VALUES ('Pietro', 'pietro@gmail.com', '4 seasons');
INSERT INTO chefs(name, email, restaurant) VALUES ('Carlo', 'carlo@gmail.com', '3 seasons');
INSERT INTO chefs(name, email, restaurant) VALUES ('Giovani', 'giovani@gmail.com', '2 seasons');
INSERT INTO chefs(name, email, restaurant) VALUES ('Francesco', 'francesco@gmail.com', '1 season');

INSERT INTO ingridients(name, type, quantity, mesurement_unit) VALUES ('tomates', 'vegetable', 5, 'pound');
INSERT INTO ingridients(name, type, quantity, mesurement_unit) VALUES ('patatoes', 'vegetable', 3, 'pound');
INSERT INTO ingridients(name, type, quantity, mesurement_unit) VALUES ('onions', 'vegetable', 2, 'piece');
INSERT INTO ingridients(name, type, quantity, mesurement_unit) VALUES ('salt', 'seasoning', 2, 'pound');
INSERT INTO ingridients(name, type, quantity, mesurement_unit) VALUES ('sugar', 'seasoning', 3, 'pound');
INSERT INTO ingridients(name, type, quantity, mesurement_unit) VALUES ('milk', 'liquid', 2, 'pound');
INSERT INTO ingridients(name, type, quantity, mesurement_unit) VALUES ('eggs', 'dairy', 3, 'packs');
INSERT INTO ingridients(name, type, quantity, mesurement_unit) VALUES ('flour', 'dairy', 4, 'pound');
INSERT INTO ingridients(name, type, quantity, mesurement_unit) VALUES ('mashrom', 'vegitable', 2, 'pound');


INSERT INTO dishes(category, name, chef_id) VALUES ('soop', 'vegitable soop', 3);
INSERT INTO dishes(category, name, chef_id) VALUES ('soop', 'patatoe soop', 1);
INSERT INTO dishes(category, name, chef_id) VALUES ('dessert', 'cupa-cake', 4);
INSERT INTO dishes(category, name, chef_id) VALUES ('dessert', 'trilece', 2);
INSERT INTO dishes(category, name, chef_id) VALUES ('soop', 'mashrom soop', 2);


INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (1, 1);
INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (1, 4);
INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (1, 3);

INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (2, 2);
INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (2, 3);
INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (2, 4);

INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (3, 5);
INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (3, 6);
INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (3, 8);

INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (4, 5);
INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (4, 6);
INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (4, 7);

INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (5, 4);
INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (5, 9);
INSERT INTO dishes_ingridients (dish_id, ingridient_id) VALUES (5, 6);
