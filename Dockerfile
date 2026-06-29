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
RUN echo "http_access allow all" > /etc/squid/squid.conf && \
    echo "http_port 8000" >> /etc/squid/squid.conf
    
# به‌جای تنظیمات فعلی، از این تنظیمات استفاده کنید
RUN echo "http_access allow all" > /etc/squid/squid.conf && \
    echo "http_port 8000" >> /etc/squid/squid.conf && \
    echo "pinger_enable off" >> /etc/squid/squid.conf && \
    echo "icp_port 0" >> /etc/squid/squid.conf

CMD ["squid", "-N", "-f", "/etc/squid/squid.conf"]
# تعیین پورت خروجی (بسیاری از سرویس‌ها به این متغیر نیاز دارند)
#ENV PORT=8080

# اجرای ترمینال تحت وب روی پورت 8080
#CMD ["ttyd", "-p", "8080", "bash"]
