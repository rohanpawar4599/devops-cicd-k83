from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "CI/CD with Helm is working with version 2!"

@app.route('/health')
def health():
    return "OK", 200

@app.route('/health-fail')
def health_fail():
    return "FAIL", 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
