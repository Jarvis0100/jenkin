FROM python:3
WORKDIR . .
COPY requirements.txt .
 
RUN pip install -r requirements.txt
COPY . .
RUN python manage.py migrate

# Add the environment variable
ENV RUN_MAIN=true

EXPOSE 5000
CMD ["python", "manage.py", "runserver", "0.0.0.0:5000"]
