FROM maven:3.8.2-openjdk-16-slim as builder
ARG VERSION=${VERSION}
LABEL name="sausage-back-report" \
      version=${VERSION}
WORKDIR /usr/src/app
COPY ./src ./src
COPY *.xml ./
RUN mvn package -DskipTests -Dversion.application=${VERSION}

FROM openjdk:16-jdk-alpine
ARG VERSION=${VERSION}
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/target/sausage-store-report-${VERSION}.jar sausage-store-report.jar
RUN adduser -s /bin/sh -D jaruser
COPY --chown=jaruser:jaruser . .
EXPOSE 8081
USER jaruser
ENTRYPOINT ["java", "-jar", "./sausage-store-report.jar", "--service.port=8081"]


