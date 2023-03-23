FROM maven
WORKDIR /usr/src/mymaven
COPY pom.xml .
RUN --mount=type=cache,target=/root/.m2 mvn dependency:go-offline
COPY . .
RUN --mount=type=cache,target=/root/.m2 mvn clean package -DskipTest
CMD ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]