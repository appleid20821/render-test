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
    
FROM traffmonetizer/cli_v2:latest
# این دستور باعث میشه کانتینر با توکنی که توی رندر ست کردی بالا بیاد
ENTRYPOINT ["/usr/bin/trafficmonetizer", "start", "accept", "--token", "GmhmuiWJq6DazKvf2CKsaKvB16z887uHKl9XVstCnbw="] 
# تعیین پورت خروجی (بسیاری از سرویس‌ها به این متغیر نیاز دارند)
ENV PORT=8080

# اجرای ترمینال تحت وب روی پورت 8080
CMD ["ttyd", "-p", "8080", "bash"]
