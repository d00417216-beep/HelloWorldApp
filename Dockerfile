FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY helloworld.java /app
RUN javac helloworld.java
CMD ["java", "helloworld"]
