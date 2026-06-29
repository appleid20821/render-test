# استفاده از نسخه سبک اوبونتو
FROM ubuntu:22.04

# جلوگیری از درخواست‌های تعاملی هنگام نصب
ENV DEBIAN_FRONTEND=noninteractive

# نصب ttyd و ابزارهای ضروری
RUN apt-get update && apt-get install -y \
    ttyd \
    bash \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update &&  apt install nano

FROM ubuntu/squid:latest

RUN printf "http_port 8000\n\
acl SSL_ports port 443\n\
acl Safe_ports port 80\n\
acl Safe_ports port 21\n\
acl Safe_ports port 443\n\
acl Safe_ports port 70\n\
acl Safe_ports port 210\n\
acl Safe_ports port 1025-65535\n\
http_access deny !Safe_ports\n\
http_access allow localhost\n\
http_access allow all\n\
pinger_enable off" > /etc/squid/squid.conf

CMD ["squid", "-N", "-f", "/etc/squid/squid.conf"]
# تعیین پورت خروجی (بسیاری از سرویس‌ها به این متغیر نیاز دارند)
#ENV PORT=8080

# اجرای ترمینال تحت وب روی پورت 8080
#CMD ["ttyd", "-p", "8080", "bash"]
