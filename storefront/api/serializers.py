from rest_framework import serializers
from .models import Book

class BookSerializer(serializers.ModelSerializer):
    class Meta:
        model = Book
        fields = ['book_id', 'author', 'title', 'pub_date']
        read_only_fields = ['book_id']
