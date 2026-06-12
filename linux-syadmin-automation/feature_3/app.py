from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    arr = [1, 2, 3, 4, 5]

    for i in range(len(arr)):
        arr[i] = arr[i] * 10

    return str(arr)

if __name__ == '__main__':
    app.run(debug=True)