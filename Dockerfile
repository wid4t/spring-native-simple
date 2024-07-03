# Stage 1: Build the native executable
FROM ghcr.io/graalvm/graalvm-ce:latest AS build

WORKDIR /app

COPY . .

RUN gu install native-image

RUN ./mvnw -Pnative native:compile

# Stage 2: Create the final image
FROM alpine:latest

RUN apk add --no-cache libstdc++ libc6-compat

WORKDIR /app

COPY --from=build /app/target/*-runner /app/application

EXPOSE 8080

ENTRYPOINT ["/app/application"]
