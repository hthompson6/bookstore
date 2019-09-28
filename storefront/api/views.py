from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import Book
from .serializers import BookSerializer

@api_view(['GET', 'POST'])
def book_list(request):
    '''
    Get a collection or Create a single resource
    '''
    if request.method == 'GET':
        books = Book.objects.all()
        serializer = BookSerializer(books, many=True)
        return Response(serializer.data)

    elif request.method == 'POST':
        serializer = BookSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATE)

    return Response(status=status.HTTP_400_BAD_REQUEST)
        

@api_view(['GET', 'POST', 'DELETE'])
def book_detail(request, book_id):
    '''
    Get, Update, or Delete a single source
    '''
    serializer = BookSerializer(data=request.data)
    return Response(status=status.HTTP_400_BAD_REQUEST)
