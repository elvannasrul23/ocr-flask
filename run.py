import os
from app import create_app

app = create_app()

if __name__ == '__main__':
    env = os.getenv('FLASK_ENV', 'development')
    if env == 'development':
        app.run(debug=True, port=5000)
    else:
        print("Running in production mode. Use Gunicorn to start the app.")
