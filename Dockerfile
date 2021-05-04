#FROM openjdk:16-jdk-alpine3.13 as build-stage

#WORKDIR /app

#COPY ./ /app

#RUN cd /app/ && ./mvnw package

#FROM tomcat:8.5.65-jdk16-openjdk-slim as production-stage

#RUN mv /demo.war /usr/local/tomcat/webapps

#EXPOSE 8080

#CMD ls /app



# build stage
FROM openjdk:16-jdk-alpine3.13 as build-stage
WORKDIR /app
COPY . .
RUN ./mvnw package


FROM tomcat:8.5.65-jdk16-openjdk-slim as production-stage
COPY --from=build-stage /app/target/demo.war  /usr/local/tomcat/webapps/api.war
EXPOSE 8080
