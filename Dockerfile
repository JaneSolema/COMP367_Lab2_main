FROM openjdk:17
EXPOSE 8080
ADD target/COMP367_Lab2_main-0.0.1-SNAPSHOT.jar COMP367_Lab2_main-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar","COMP367_Lab2_main-0.0.1-SNAPSHOT.jar"]