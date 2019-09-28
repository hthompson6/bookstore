from djongo import models

class Book(models.Model):
    book_id = models.IntegerField(primary_key=True, default=1)
    title = models.CharField(max_length=255)
    author = models.CharField(max_length=255)
    pub_date = models.DateField()

    objects = models.DjongoManager()

    # Credit to stackoverflow.com/questions/41228034/django-non-primary-key-autofield
    # Modifications made as it was in refrence to an older django version
    def save(self, *args, **kwargs):
        if self._state.adding:
            if len(Book.objects.all()) > 0:
                last_id = Book.objects.all().aggregate(largest=models.Max('book_id'))['largest']
                if last_id is not None:
                    self.book_id = last_id + 1
        super(Book, self).save(*args, **kwargs)
