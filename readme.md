

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

Writing tha sql code an example code
How many endpoint its gonna be needed ang what arguments in the endpoint the url for each endpoint
