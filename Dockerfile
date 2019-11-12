FROM maven:3.6.2-jdk-13 AS builder
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src/ /build/src/
RUN mvn package

FROM openjdk:13-jdk-alpine as Target
COPY --from=builder /build/target/gateway-0.0.1-SNAPSHOT.jar gateway.jar

CMD wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && dockerize -wait tcp://$EUREKA_URL:8761 -timeout 60m yarn start

ENTRYPOINT ["java","-jar","gateway.jar"]

EXPOSE 8080