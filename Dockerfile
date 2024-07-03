FROM ghcr.io/graalvm/native-image-community:22 AS build

WORKDIR /app

COPY . .

RUN chmod +x ./mvnw

RUN ./mvnw -Pnative native:compile

FROM alpine:latest

RUN apk add --no-cache libstdc++ libc6-compat

WORKDIR /app

COPY --from=build /app/target/spring-native-simple /app/application

EXPOSE 8080

ENTRYPOINT ["/app/application"]
