pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/tanvi1904/terraform-ec2-pipeline.git',
                    branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('instance-pipeline') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('instance-pipeline') {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply - Launch EC2') {
            steps {
                dir('instance-pipeline') {
                    withCredentials([
                        string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                        string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
                    ]) {
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}
