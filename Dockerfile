FROM debian:bookworm-slim

# نصب کتابخانه‌های مورد نیاز برای اجرا در دبیان (پایدارتر از آلپاین برای pawns-cli)
RUN apt-get update && apt-get install -y curl python3 && rm -rf /var/lib/apt/lists/*

# دانلود برنامه
RUN curl -L https://pawns.app/downloads/cli/linux_x86_64/pawns-cli -o /usr/local/bin/pawns-cli \
    && chmod +x /usr/local/bin/pawns-cli

EXPOSE 10000

# اجرای پایتون برای زنده نگهداشتن سرویس و pawns
CMD python3 -m http.server 10000 & /usr/local/bin/pawns-cli -email=appleid20821@gmail.com -password=345LSMchxEFgW3@ -device-name=render-server -accept-tos
