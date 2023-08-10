from django.shortcuts import render, get_object_or_404
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import Idea
from .serializers import IdeaSerializer
from rest_framework import serializers
from rest_framework import status
from django.db.models import Q

# Create your views here.

@api_view(["GET"])
def IdeaApiOverview(request):
    """
    returns a list of APIs
    api: /
    method: GET
    """
    api_urls = {
        'all_ideas': '/',
        'Search by id': '/?id=idea_id',
        'Search by title': '/?title=title_text',
        'Add': '/create',
        'Update': '/update/pk',
        'Delete': '/ideas/pk/delete'
    }
  
    return Response(api_urls)

@api_view(["POST"])
def created_ideas(request):
    """
    CREATE a new idea post
    api: create/
    method: POST
    Example:

    {
        "title": "UPDATED",
        "author_token": "superuser",
        "destination": "GUANGZHOU",
        "description": "This is an idea",
        "tags": [
            "rest",
            "hey"
        ],
        "start_date": "2023-08-01",
        "end_date": "2023-08-03"
    }

    """
    idea = IdeaSerializer(data=request.data)

    #validation for existing data
    # if Idea.objects.filter(**request.data).exists():
    #     raise serializers.ValidationError('This data already exists')

    if idea.is_valid():
        idea.save()
        return Response(idea.data)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)




@api_view(['GET'])
def view_ideas(request):
    """
    READ a list of ideas
    api: all/?key=value
    method: GET
    """
    # checking for the parameters from the URL
    
    if request.query_params:
        params_dict = request.query_params.dict() # dictionary that contains query params, e.g. {id: 4, author_token: "superuser"}
        if "keyword" in params_dict:
            ideas = Idea.objects.filter(Q(destination__icontains=params_dict["keyword"])|Q(tags__name__in=[params_dict["keyword"]])).distinct()
        else:
            ideas = Idea.objects.filter(**request.query_params.dict())
    else:
        ideas = Idea.objects.all()
  
    # if there is something in ideas else raise error, ideas is a queryset thus many=True
    if ideas:
        serializer = IdeaSerializer(ideas, many=True)
        return Response(serializer.data)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)
    

@api_view(['POST'])
def update_ideas(request, pk):
    """
    UPDATE an idea
    api: update/pk
    method: POST
    Example: same as CREATE, id and userToken cannot be updated
    """
    idea = Idea.objects.get(pk=pk)
    data = IdeaSerializer(instance=idea, data=request.data)
 
    if data.is_valid():
        data.save()
        return Response(data.data)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)

@api_view(['DELETE'])
def delete_ideas(request, pk):
    """
    DELETE an idea
    api: pk/delete
    method: DELETE
    """
    idea = get_object_or_404(Idea, pk=pk)
    idea.delete()
    return Response(status=status.HTTP_202_ACCEPTED)


