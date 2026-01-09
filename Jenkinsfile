pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "ap-south-1"
        TF_IN_AUTOMATION   = "true"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/tanvi1904/terraform-ec2-pipeline.git', branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    sh '''
                    cd instance-pipeline
                    terraform init -input=false -no-color
                    '''
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                cd instance-pipeline
                terraform plan -no-color
                '''
            }
        }

        stage('Terraform Apply - Launch EC2') {
            steps {
                sh '''
                cd instance-pipeline
                terraform apply -auto-approve -no-color
                '''
            }
        }
    }
}

