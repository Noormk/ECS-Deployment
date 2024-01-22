provider "aws" {
    region     = secrets.AWS_REGION
    access_key =  secrets.AWS_ACCESS_KEY_ID
    secret_key = secrets.AWS_SECRET_ACCESS_KEY
}

resource "aws_ecs_cluster" "my_cluster" {
    name = "my-cluster"
}

resource "aws_ecs_task_definition" "my_task_definition" {
    family                   = "my-task"
    container_definitions    = <<EOF
[
    {
        "name": "my-container",
        "image": "nginx:latest",
        "portMappings": [
            {
                "containerPort": 80,
                "hostPort": 80,
                "protocol": "tcp"
            }
        ]
    }
]
EOF
}
