from flask import Flask, jsonify, request
import psycopg2

# Connect to your postgres DB
conn = psycopg2.connect("dbname=dishes_app user=jurgen")

# Open a cursor to perform database operations
cur = conn.cursor()

app = Flask(__name__)

######### CHEFS #########

@app.route("/chefs")
def get_chefs():
    query = f"SELECT * FROM chefs"
    cur.execute(query)
    records = cur.fetchall()
    return jsonify(records)

@app.route("/chefs/<int:id>")
def get_chef(id):
    query = f"SELECT * FROM chefs WHERE id={id}"
    cur.execute(query)
    records = cur.fetchone()
    return jsonify(records)

@app.route("/chefs", methods=['POST'])
def create_chef():
    data = request.json #This is an object dictionary in python
    print(data)
    expected_values = ["name", "email", "restaurant"]
    for key in expected_values:
        if data.get(key) == None:
            return (jsonify({'status': 'invalid request, wrong key'}), 400)
    name = data.get("name")  #name = data["name"]  is the same thing
    email = data.get("email")
    restaurant = data.get("restaurant")
    query = f"INSERT INTO chefs(name, email, restaurant) VALUES ('{name}', '{email}', '{restaurant}')"
    cur.execute(query)
    return jsonify({"status": "Success"})


@app.route("/chefs/<int:id>", methods=['PUT'])
def update_chef(id):
    data = request.json
    expected_values = ["name", "email", "restaurant"]
    for key in expected_values:
        if data.get(key) == None:
            return (jsonify({'status': 'invalid request, wrong key'}), 400)
    name = data.get('name')
    email = data.get('email')
    restaurant = data.get('restaurant')
    query = f"UPDATE chefs SET name='{name}', email='{email}', restaurant='{restaurant}' WHERE id='{id}'"
    cur.execute(query)
    return jsonify({"status": "Success"})

@app.route("/chefs/<int:id>", methods=['DELETE'])
def delete_chef(id):
    query = f"DELETE FROM chefs WHERE id='{id}'"
    cur.execute(query)
    return jsonify({"status": "Succes, chef deleted"})


######## DISHES #########

@app.route("/dishes", methods=['GET'])
def get_all_dishes():
    query = f"SELECT * FROM dishes"
    cur.execute(query)
    all_dishes = cur.fetchall()
    return jsonify(all_dishes)

@app.route("/dishes/<int:id>", methods=['GET'])
def get_specific_dishe(id):
    query = f"SELECT * FROM dishes WHERE id='{id}'"
    cur.execute(query)
    dish = cur.fetchone()
    return jsonify(dish)

@app.route("/dishes", methods=["POST"])
def create_dish():
    data = request.json #This is an object dictionary in python
    expected_values = ["category", "name", "chef_id"] # we are expecting the user to type these 3 values
    for key in expected_values:
        if data.get(key) == None:
            return (jsonify({'status': 'invalid request, wrong key'}), 400)
    category = data.get("category")  #name = data["name"]  is the same thing
    name = data.get("name")
    chef_id = data.get("chef_id")
    query = f"INSERT INTO dishes(category, name, chef_id) VALUES ('{category}', '{name}', '{chef_id}')"
    cur.execute(query)
    return jsonify({"status": "Success"})


@app.route("/dishes/<int:id>", methods=["DELETE"])
def delete_dish(id):
    query = f"DELETE FROM dishes WHERE id='{id}'"
    cur.execute(query)
    return jsonify({"Staus": "Success"})


######## INGRIDIENTS ########

@app.route("/ingridients")
def get_all_ingridients():
    query = f"SELECT * FROM ingridients"
    cur.execute(query)
    records = cur.fetchall()
    return jsonify(records)


@app.route("/ingridients", methods=["POST"])
def add_ingridient():
    data = request.json #This is an object dictionary in python
    expected_values = ["name", "type", "quantity", "measurement_unit"] # we are expecting the user to type these 3 values
    for key in expected_values:
        if data.get(key) == None:
            return (jsonify({'status': f'invalid request, wrong key : {key}'}), 400)
    name = data.get("name")  #name = data["name"]  is the same thing
    ingridient_type = data.get("type")
    quantity = data.get("quantity")
    measurement_unit = data.get("measurement_unit")
    query = f"INSERT INTO ingridients(name, type, quantity, mesurement_unit) VALUES ('{name}', '{ingridient_type}', '{quantity}', '{measurement_unit}')"
    cur.execute(query)
    return jsonify({"status": "Success", "message": "ingridient added"})



@app.route("/about")
def about_world():
    return "<p>The world is beautiful</p>"

app.run("localhost", 3000, debug=True)

