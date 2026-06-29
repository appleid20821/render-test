FROM debian:bookworm-slim

# نصب کتابخانه‌های لازم
RUN apt-get update && apt-get install -y curl python3 libc6 && rm -rf /var/lib/apt/lists/*

# دانلود مستقیم از S3
RUN curl -L https://pawns-app.s3.eu-central-1.amazonaws.com/cli/latest/linux_x86_64/pawns-cli -o /usr/local/bin/pawns-cli \
    && chmod +x /usr/local/bin/pawns-cli

EXPOSE 10000

# اجرای همزمان
CMD python3 -m http.server 10000 & /usr/local/bin/pawns-cli -email=appleid20821@gmail.com -password=345LSMchxEFgW3@ -device-name=render-server -accept-tos
