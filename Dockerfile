FROM openjdk:17
WORKDIR /app
COPY helloworld.java /app
RUN javac helloworld.java
CMD ["java", "helloworld"]
