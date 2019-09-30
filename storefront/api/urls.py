from django.urls import path, re_path
from . import views 

urlpatterns = [
    path('book', views.book_list, name='book_list'),
    path('book/', views.book_list, name='book_list'),
    path('book/<int:book_id>', views.book_detail, name='book_detail')
]
