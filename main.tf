provider "aws" {
    region     = "us-west-2"
    access_key = "AKIA5LPECNT7BR67R54K"
    secret_key = "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"
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
