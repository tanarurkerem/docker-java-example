FROM maven
WORKDIR /usr/src/mymaven
COPY . .
RUN mvn clean install
CMD ["./mvnw", "spring-boot:run"]