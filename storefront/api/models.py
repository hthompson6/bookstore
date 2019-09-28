from djongo import models

class Book(models.Model):
    title = models.CharField(max_length=255)
    author = models.CharField(max_length=255)
    pub_date = models.DateField()

    class Meta:
        abstract = True

class Entry(models.Model):
    book = models.EmbeddedModelField(model_container=Book,)
