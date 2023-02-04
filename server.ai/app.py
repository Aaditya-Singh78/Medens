from flask import Flask, render_template
# import src.Script as sc

app = Flask(__name__)

@app.route("/")
def main():
    return render_template('index.html')

@app.route("/login")
def login():
    return render_template('login.html')

@app.route("/signup")
def signup():
    return render_template('signup.html')

@app.route("/docs")
def api():
    return render_template('docs.html')

@app.route("/globalCases")
def cases():
    return render_template('cases.html')

@app.route("/guidelines")
def guide():
    return render_template('guide.html')
