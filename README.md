# JasperReport Dashboard POC
This is a POC for creating dashboard using jasperreport.

## Installation
### Prerequisites
1. Tomcat
2. Mysql
3. Maven

### Steps
1. Create database by running db/flightstats_myisam.sql
2. Create context file in tomcat using tomcat-context/ROOT.xml. Please note that the application works with root context only as of now. Copy this context file at [tomcat dir]/conf/Catalina/localhost
3. Run command `mvn -DskipTests=true clean install`
4. Start tomcat server
5. Access [http://localhost:8080/](http://localhost:8080/)
