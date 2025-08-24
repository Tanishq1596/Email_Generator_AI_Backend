FROM maven:3.9.6-eclipse-temurin-21 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jdk
COPY --from=build /target/email-writer-sb-0.0.1-SNAPSHOT.jar email-writer-sb.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "email-writer-sb.jar"]