# Sử dụng Tomcat 10 (Jakarta EE) chạy trên Java 21
FROM tomcat:10.1-jdk21-openjdk-slim

# Xóa các ứng dụng mặc định của Tomcat để nhẹ máy
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file war đã build từ Maven vào (tên là ROOT.war để chạy ngay tại domain gốc)
COPY target/ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Render sẽ cung cấp port ngẫu nhiên qua biến $PORT, hoặc mặc định 8080
EXPOSE 8080

CMD ["catalina.sh", "run"]