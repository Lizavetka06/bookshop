FROM maven:3.6.3-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY src/main/resources/application.properties /app/application.properties
COPY --from=build /app/target/*.jar app.jar
ENV SPRING_PROFILES_ACTIVE=production
EXPOSE 8080
# Health check
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:8080/actuator/health || exit 1

CMD ["java", "-jar", "app.jar"]