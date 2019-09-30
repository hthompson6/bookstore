# Bookstore

## Installation (Docker)
```bash
$ git clone git@github.com:hthompson6/bookstore.git && cd bookstore/scripts
$ ./install.sh
```

### Starting Containers
```bash
$ cd /path/to/bookstore/docker
$ sudo docker-compose up -d --build
```

![Docker Containers](/doc/containers.png)

### Tearing Down Containers
```bash
$ cd /path/to/bookstore/docker
$ sudo docker-compose down -v
```

## Usage
* Please note that it can take some time for the Nginx service to start fully. A 502 bad gateway response may be returned at first.
* Book IDs are created server side are read-only

### WebUI
The REST API can be interacted with via a WebUI found at the `http://<ip_host>/api/book`

![Rest API](/doc/rest.png)

### Create Resource
```bash
$ curl -d '{"author":"test_author", "title":"test_title", "pub_date": "2019-01-01"}' -H "Content-Type: applicatin/json" -X POST http:<host_ip>/api/book
{"book_id":1,"author":"test_author","title":"test_title","pub_date":"2019-01-01"}
```

* Note the end point hit is `http://<host_ip>/api/book`

### Update Resource
```bash
$ curl -d '{"author":"new_author", "title":"new_title", "pub_date": "2019-02-01"}' -H "Content-Type: application/json" -X POST http://<host_ip>/api/book/1
{"book_id":1,"author":"new_author","title":"new_title","pub_date":"2019-02-01"}
```

* Note the end point hit is `http://<host_ip>/api/book/<book_id>`

### Get Collection
```bash
$ curl http://<host_ip>/api/book
```

### Get Single Resource
```bash
$ curl http://<host_ip>/api/book/<book_id>
```

### Delete Resource
```bash
$ curl -X DELETE http://<host_ip>/api/book/<book_id>
```

## Uninstall
```
$ cd /path/to/bookstore/scripts/
$ ./uninstall.sh
```

## Road To Production
1. Add unit tests
2. Utilize ssl certs to enforce https
3. Shift to Kubernetes:
   - Utilize docker hub or local registery (depending on resource)
   - Leverage the nginx ingress controller instead of nginx docker image
   - Prometheus monitoring
   - etc.
4. Jenkins/CI tooling
