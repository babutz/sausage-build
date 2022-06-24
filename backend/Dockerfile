FROM maven:3.8.2-openjdk-16-slim as builder
ARG VERSION=${VERSION}
LABEL name="sausage-back" \
      version=${VERSION}
WORKDIR /usr/src/app
COPY ./src ./src
COPY *.xml ./
RUN curl https://storage.yandexcloud.net/cloud-certs/CA.pem -o YandexInternalRootCA.crt
RUN mvn package -Dversion.application=${VERSION}


FROM openjdk:16-jdk-alpine
ARG VERSION=${VERSION}
WORKDIR /app
COPY --from=builder /usr/src/app/YandexInternalRootCA.crt .
RUN keytool -importcert -trustcacerts -file YandexInternalRootCA.crt \
    -cacerts -storepass changeit -noprompt \
    && rm -rf YandexInternalRootCA.crt \
    && addgroup --system jaruser \
    && adduser -S -s /bin/false -G jaruser jaruser \
    && chown -R jaruser:jaruser /app \
    && apk --no-cache add curl \
    && apk add --no-cache dumb-init
COPY --chown=jaruser:jaruser . .
COPY --from=builder /usr/src/app/target/sausage-store-${VERSION}.jar sausage-store.jar
EXPOSE 8080
USER jaruser
ENTRYPOINT dumb-init java -jar ./sausage-store.jar
