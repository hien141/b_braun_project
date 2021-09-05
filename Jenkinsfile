@Library('converter-lib@main') _

pipeline {
    agent any
    
    stages {
        stage('destroy previous converter_container'){
            steps{
                sh """ docker stop converter_container """
                sh """ docker rm converter_container """
            }
        }
        
        stage('build'){
            steps{
                sh """ docker build -t hoangtranq/b_braun_project:1.0 . """
            }
        }
        
        stage('run'){
            steps{
                sh """ docker run --name converter_container -itd hoangtranq/b_braun_project:1.0"""
            }
        }
        
        stage('converting the file'){
            steps {
                sh """ docker exec converter_container mogrify -format jpg /tmp/Pictures/picture.bmp """
            }
        }
        
        stage('copy the converted image to the host') {
            steps{
                sh """ docker cp converter_container:/tmp/Pictures/picture.jpg . """
            }
        }
        /*stage('stop, remove containers and remove images images') {
            steps {
                docker ps -a
                sh """
                  docker rm "docker ps -aq"
                """
                
            }   
        }
            
     /*   stage('build docker') {
            steps {
                sh """
                  docker build -t hoangtranq/b_braun_project:1.0 .
                """
                sh 'echo "hoangtranq/b_braun_project:1.0 instance is created"'
            }
        }
        
        stage('run docker') {
            steps {
                    sh '''docker run -itd hoangtranq/b_braun_project:1.0'''
                }
        }
        
        stage('run converting') {
            steps {
                    sh '''docker exec -it serene_swartz mogrify -format jpg /tmp/Pictures/picture.bmp'''
            }
        }*/
    }
}
