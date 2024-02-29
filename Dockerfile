FROM openjdk:8-jdk-alpine
EXPOSE 8083
ENTRYPOINT ["java","-jar","/docker-spring-boot.war"]
