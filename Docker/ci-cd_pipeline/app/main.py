from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/vote', methods=['POST'])
def vote():
    data = request.get_json()
    
    # Check if age is provided
    if 'age' not in data:
        return jsonify({"error": "Age not provided"}), 400
    
    age = data['age']
    
    # Check if voter is 18 or older
    if age >= 18:
        return jsonify({"message": "You are eligible to vote!"}), 200
    else:
        return jsonify({"message": "You must be 18 or older to vote!"}), 403

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
