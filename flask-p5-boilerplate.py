#!/usr/bin/env python3

import sys
import os
from urllib.request import urlretrieve

if len(sys.argv) > 1:
    cwd = os.path.join(os.getcwd(), sys.argv[1])
    if not os.path.exists(cwd):
        os.makedirs(cwd)
        base_dirs = ["templates", "static"]
        for d in base_dirs:
            os.makedirs(os.path.join(cwd, d))
        with open(os.path.join(cwd, "app.py"), "w") as f:
            f.write(
                """
from flask import Flask, render_template
from flask_socketio import SocketIO, emit

app = Flask(__name__)
socketio = SocketIO(app)

@app.route("/")
def index():
    return render_template("index.html")


if __name__=="__main__":
    socketio.run(app, debug=True)"""
            )
        with open(os.path.join(cwd, "templates", "index.html"), "w") as f:
            f.write(
                """
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Spiral Control</title>
    <script src="{{ url_for('static', filename='p5.js') }}"></script>
    <script src="https://cdn.socket.io/4.5.4/socket.io.min.js"></script>
  </head>
  <body>
    <div class="container">
        <div id="p5-canvas"></div>
        <div id="ui-container"></div>
    </div>
    <script src="{{ url_for('static', filename='sketch.js') }}"></script>
  </body>
</html>


                    """
            )
        with open(os.path.join(cwd, "static", "sketch.js"), "w") as f:
            f.write(
                """
                const socket = io.connect("http://localhost:5000"); // Adjust to your server address
                    function setup() {
    let canvas = createCanvas(800, 600);
    canvas.parent("p5-canvas");
}

function draw() {
    background(30);
    circle (width/2, height/2, 50);
}
                    """
            )
        with open(os.path.join(cwd, 'requirements.txt'), 'w') as f:
            f.writelines(['flask', 'flask-socketio'])

        try:
            urlretrieve("https://github.com/processing/p5.js/releases/download/v1.9.0/p5.js", os.path.join(cwd, 'static', 'p5.js'))
        except Exception as e:
            raise(e)

    else:
        print("Path Already Exists!")

else:
    print("Please provide a directory name to create flask boilerplate on as:\n./flaskboilerplate.py <dir_name>")
