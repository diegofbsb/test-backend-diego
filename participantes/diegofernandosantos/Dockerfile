FROM eclipse-temurin:21-jdk AS build

RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean

WORKDIR /app
COPY . .

RUN mvn -q -e -DskipTests package

FROM eclipse-temurin:21-jre

WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
