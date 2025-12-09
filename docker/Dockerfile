# AI Generated Code by Deloitte + Cursor (BEGIN)
# SDLC-AI Backend Dockerfile

FROM eclipse-temurin:21-jdk-alpine AS builder
WORKDIR /app
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
RUN chmod +x mvnw && ./mvnw dependency:go-offline -B
COPY src src
RUN ./mvnw clean package -DskipTests -B && mv target/*.jar target/app.jar

FROM eclipse-temurin:21-jre-alpine AS runtime
LABEL maintainer="SDLC-AI Team"
RUN apk add --no-cache curl wget tzdata dumb-init && \
    addgroup -S appgroup && adduser -S appuser -G appgroup
ENV TZ=UTC
WORKDIR /app
COPY target/*.jar app.jar
RUN mkdir -p /app/logs /app/tmp && chown -R appuser:appgroup /app
USER appuser
HEALTHCHECK --interval=30s --timeout=5s --start-period=60s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:8080/actuator/health || exit 1
EXPOSE 8080
ENV JAVA_OPTS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0 -XX:InitialRAMPercentage=50.0 -XX:+UseG1GC"
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["sh", "-c", "exec java $JAVA_OPTS -jar app.jar"]
# AI Generated Code by Deloitte + Cursor (END)
