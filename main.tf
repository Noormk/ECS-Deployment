variable "aws_access_key" {
  description = "AWS access key"
  default     = "AKIA5LPECNT7BR67R54K"
}

variable "aws_secret_key" {
  description = "AWS secret key"
  default     = "Cr8bcR7hvoOGGBoa6+BcPuBVaHndwcYTU4cSviuL"
}

provider "aws" {
  region     = "us-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
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
    ],
    "memory": 512
  }
]
EOF
}
