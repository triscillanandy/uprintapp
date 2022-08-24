from django.db import models
from django.contrib.auth import get_user_model


# Create your models here.
User =get_user_model()

class Order(models.model):

    COLOR=(
        ('BLACK','black'),
        ('COLOURED','coloured'),
    )
    SIDES=(
        ('DOUBLE_SIDED','double_sided'),
        ('SINGLE_SIDED','single_sided')
    )
    customer =models.ForeignKey(User,on_delete=models.CASCADE)
    color=models.CharField(max_length=20,)

