FROM python:3.6.8

COPY requirements.txt /usr/src/storefront/requirements.txt
WORKDIR /usr/src/storefront

RUN pip3 install -r requirements.txt

COPY ./entrypoint.sh /usr/src/storefront/entrypoint.sh

COPY . /usr/src/storefront
RUN pip3 install -e .

ENTRYPOINT ["/usr/src/storefront/entrypoint.sh"]
