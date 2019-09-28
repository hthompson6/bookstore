# Bookstore


## Installation (Docker)

## Installation (Bare Metal)

### Install MongoDB
Installation can be found [here](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/#install-mongodb-community-edition-using-deb-packages) 

### Install requirements
```bash
$ sudo pip3 install -r requirements.txt
```

### Run first migration
```bash
$ python3 manage.py makemigrations api
$ python3 manage.py migrate --fake-initial
```
