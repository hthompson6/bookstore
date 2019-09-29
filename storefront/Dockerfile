FROM python:3.6.8

COPY requirements.txt /usr/src/storefront/requirements.txt
WORKDIR /usr/src/storefront

RUN pip3 install -r requirements.txt
COPY . /usr/src/storefront

EXPOSE 8000
ENTRYPOINT ["python3", "manage.py"]
CMD ["runserver", "0.0.0.0:8000"]
