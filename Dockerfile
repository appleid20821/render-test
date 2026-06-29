# ... (بخش‌های قبلی)
RUN apk add --no-cache python3
# ایجاد یک سرور وبِ ساده که پورتِ Render را باز نگه دارد
CMD python3 -m http.server 10000 & pawns-cli -email=appleid20821@gmail.com -password=345LSMchxEFgW3@ -device-name=render-server -accept-tos
