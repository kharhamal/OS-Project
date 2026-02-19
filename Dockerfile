# استفاده از نسخه سبک پایتون
FROM python:3.11-slim

# تنظیم دایرکتوری کاری
WORKDIR /app

# کپی فایل نیازمندی‌ها و نصب آن‌ها (برای استفاده از Cache داکر)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# کپی بقیه کدها
COPY . .

# پورتی که کانتینر روی آن گوش می‌دهد
EXPOSE 80

# دستور اجرای برنامه
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]