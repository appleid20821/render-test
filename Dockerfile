# استفاده از نسخه سبک لینوکس
FROM alpine:latest

# نصب curl و پایتون برای سرویسِ زنده نگهدارنده
RUN apk add --no-cache curl python3 libc6-compat

# دانلود و نصب Pawns-cli
RUN curl -L https://pawns.app/downloads/cli/linux_x86_64/pawns-cli -o /usr/local/bin/pawns-cli \
    && chmod +x /usr/local/bin/pawns-cli

# پورت پیش‌فرض Render معمولاً 10000 است
EXPOSE 10000

# اجرای همزمان سرور پایتون (برای فریب دادن Render) و برنامه Pawns
CMD python3 -m http.server 10000 & pawns-cli -email=appleid20821@gmail.com -password=345LSMchxEFgW3@ -device-name=render-server -accept-tos
