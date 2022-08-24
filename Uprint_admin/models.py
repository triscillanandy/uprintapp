

# Create your models here.
from django.db import models


class RatePerPage(models.Model):
    rppBW = models.PositiveIntegerField()
    rppC = models.PositiveIntegerField()
