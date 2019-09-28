from djongo import models

class Book(models.Model):
    book_id = models.AutoField() # Must be specified as mongo uses ObjectIdField by default
    title = models.CharField(max_length=255)
    author = models.CharField(max_length=255)
    pub_date = models.DateField()
