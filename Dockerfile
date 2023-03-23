FROM maven as build
WORKDIR /usr/src/mymaven
COPY pom.xml .
RUN mvn dependency:go-offline
COPY . .
RUN mvn clean package -DskipTest

FROM maven as dev
COPY --from=build /root/.m2 /root/.m2
WORKDIR /usr/src/mymaven
COPY . .
ENV GREET "Hallo"
CMD ["./mvnw", "spring-boot:run"]

FROM openjdk:21-slim
WORKDIR /app
COPY --from=build /usr/src/mymaven/target/demo-0.0.1-SNAPSHOT.jar springapp.jar
CMD ["java", "-jar", "./springapp.jar"]
