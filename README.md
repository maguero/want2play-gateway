[![Build Status](https://travis-ci.org/maguero/want2play-gateway.svg?branch=master)](https://travis-ci.org/maguero/want2play-gateway)
# Want2Play Gateway

This is a gateway service, a Spring Boot application based on [Spring Cloud Gateway](https://spring.io/guides/gs/gateway/). 

# Build & Run

This service is dockerized and is built and run from [want2play-orchestration](https://github.com/maguero/want2play-orchestration) service, which loads all services with a `docker-compose` configuration. If you want to build and run this image separately you should follow these steps, but ensure [want2play-discovery](https://github.com/maguero/want2play-discovery) is running since gateway depends on discovery service.

```
:$ docker image build -t want2play-gateway:0.01 .
:$ docker container run --publish 8080:8080 --detach --name bb want2play-gateway:0.01
```

## API endpoints
* Eureka dashboard: [http://localhost:8080/](http://localhost:8080/)
* Health check: [http://localhost:8080/actuator/health](http://localhost:8080/actuator/health)

## Settings

The service will on [localhost:8080](http://localhost:8080/), but if you want to modify the port please go to `application.properties` file.

```
spring.application.name=gateway
server.port:8080
server.url=discovery
eureka.client.serviceUrl.defaultZone: http://${server.url}:8761/eureka
```

If the port is changed, it is also needed to update `Dockerfile` at the line `EXPOSE 8080`.