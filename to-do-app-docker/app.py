from flask import Flask, render_template_string, request, redirect, url_for

app = Flask(__name__)

# In-memory list to store tasks
todos = []

# Simple HTML template embedded directly for ease
HTML_TEMPLATE = """
<!DOCTYPE html>
<html>
<head>
    <title>Dockerized To-Do App</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f4f4f4; }
        .container { max-width: 500px; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h2 { color: #333; }
        ul { list-style-type: none; padding: 0; }
        li { padding: 10px; background: #eee; margin-bottom: 5px; border-radius: 4px; display: flex; justify-content: space-between; }
        input[type="text"] { width: 70%; padding: 8px; }
        button { padding: 8px 12px; background: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; }
        .delete-btn { background: #dc3545; }
    </style>
</head>
<body>
    <div class="container">
        <h2>My To-Do List (Running in Docker!)</h2>
        <form action="/add" method="POST">
            <input type="text" name="task" placeholder="Enter a new task..." required>
            <button type="submit">Add Task</button>
        </form>
        <ul>
            {% for todo in todos %}
                <li>
                    {{ todo }}
                    <a href="{{ url_for('delete_task', task_id=loop.index0) }}"><button class="delete-btn">Delete</button></a>
                </li>
            {% endfor %}
        </ul>
    </div>
</body>
</html>
"""

@app.route('/')
def index():
    return render_template_string(HTML_TEMPLATE, todos=todos)

@app.route('/add', methods=['POST'])
def add_task():
    task = request.form.get('task')
    if task:
        todos.append(task)
    return redirect(url_for('index'))

@app.route('/delete/<int:task_id>')
def delete_task(task_id):
    if 0 <= task_id < len(todos):
        todos.pop(task_id)
    return redirect(url_for('index'))

if __name__ == '__main__':
    # Flask ko 0.0.0.0 pe run karna zaroori hai taaki Docker ke bahar access ho sake
    app.run(host='0.0.0.0', port=5000, debug=True)