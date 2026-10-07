FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests


FROM tomcat:9.0-jdk17

# Disable Tomcat shutdown port
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

# Create persistent database directory
RUN mkdir -p /data

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy ManishaMart WAR
COPY --from=build /app/target/ManishaMart.war \
    /usr/local/tomcat/webapps/ROOT.war

# H2 server port
EXPOSE 9092

# Tomcat port
EXPOSE 8080

# Start H2 server first, then Tomcat
CMD ["sh", "-c", "java -cp /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/h2-*.jar org.h2.tools.Server -tcp -tcpPort 9092 -tcpAllowOthers -baseDir /data & catalina.sh run"]
