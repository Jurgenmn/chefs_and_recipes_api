## DESCRIPTION
 This is an API application for creating and maintaining recepies


   ----- Recipes PROJECT ----
## DATABASE (PostgreSQL)
- Need 4 tables (Chefs, Dishes, Ingridients, Dishes_Ingridients)
- Chefs table will have 4 columns (Id, Name, E-mail, Restaurant)
- Dishes table will have 3 columns (Id, Category, Name, Chef_Id)
- Ingridients table will have 3 columns (Id, Name, Type, quantity)
- Dishes_Ingridients will have 2 columns (Dishes_Id, Ingridients_Id)
- Table Chefs will have one to many relationship with table Dishes
- Table Dishes will have many to many relationship with Ingridients

## API


#### CHEFS
- GET REQUEST `/chefs` : returns a list of all chefs
- GET REQUEST `/chefs/id` :returns a specific chef
- POST REQUEST `/chefs` , request body `{"name": "Jack", "Email": "jack@gmail.com", "restaurant": "Taco-Bell"}`
- PUT REQUEST `/chefs/id` request body `{"Email": "jack@yahoo.com", "restaurant": "MCDonald"}`
- DELETE REQUEST `/chefs/id` : delete chef


#### DISHES
- GET REQUEST `/dishes` : returns a list of all dishes
- GET REQUEST `/dishes/id` :returns a specific dish
- GET REQUEST `/dishes/id/ingridients` : returns ingridients for the dish with that specific id
- POST REQUEST `/dishes` , request body `{"category": "desert", "name": "cup-cake", "chef_id": 2}`
- DELETE REQUEST `/dishes/id` : delete dish

#### INGIDIENTS
- GET REQUEST `/ingridients` : returns all the ingridients
- POST REQUEST `/ingridiens` request body `{"name": "tomato", "type": "vegie", "quantity": 1}`


Writing tha sql code an example code
How many endpoint its gonna be needed ang what arguments in the endpoint the url for each endpoint
