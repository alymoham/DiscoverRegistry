FROM maven:3.6-jdk-8-alpine as build
ADD ./ app/
WORKDIR /app
RUN mvn clean install
 

FROM openjdk:8-jdk-alpine
COPY --from=build /app/target/SMM-orderService.jar SMM-orderService.jar
EXPOSE 9005
ENTRYPOINT ["java","-jar","-Dserver.port=9000","SMM-orderService.jar"]
