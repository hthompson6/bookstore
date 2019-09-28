from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import Book
from .serializers import BookSerializer

@apiview(['GET', 'POST'])
def book_list(request):
    '''
    Get a collection or Create a single resource
    '''
    if request.method == 'GET':
        books = Book.objects.all()
        serializer = BookSerializer(books, many=True)
        return Reponse(serializer.data)

    elif request.method == 'POST':
        serializer = BookSerializer(data=request.data)
        if serializer.is_valid():
            import pdb; pdb.set_trace()
        

@apiview(['GET', 'POST', 'DELETE'])
def book_detail(request):
    '''
    Get, Update, or Delete a single source
    '''
    pass
