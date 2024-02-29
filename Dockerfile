FROM openjdk:8-jdk-alpine
EXPOSE 8083
ADD .
ENTRYPOINT ["java","-jar","/docker-spring-boot.war"]
