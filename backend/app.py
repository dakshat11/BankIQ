from flask import Flask, send_from_directory

app = Flask(__name__, static_folder='public')

# Serve frontend files
@app.route('/')
def serve_index():
    return send_from_directory(app.static_folder, 'index.html')

@app.route('/<path:filename>')
def serve_static(filename):
    return send_from_directory(app.static_folder, filename)

# API Endpoints
@app.route('/api/login', methods=['POST'])
def login():
    # Your login logic here
    pass

if __name__ == '__main__':
    app.run(port=5000)