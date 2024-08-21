[
  {
    "essential": true,
    "memory": 512,
    "name": "myapp",
    "cpu": 256,
    "image": "${REPOSITORY_URL}:latest",
    "workingDirectory": "/app",
    "command": ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"],
    "portMappings": [
        {
            "containerPort": 8000,
            "hostPort": 8000
        }
    ]
  }
]
