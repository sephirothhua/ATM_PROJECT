from rest_framework.pagination import PageNumberPagination


class CPageNumberPagination(PageNumberPagination):
    page_size = 10
    page_size_query_param = "page_size"


class CPageNumberPagination2(PageNumberPagination):
  page_size = 8
  page_size_query_param = "page_size"
