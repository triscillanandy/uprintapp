

# Create your views here.

from django.contrib import messages

from django.shortcuts import render, redirect
from Uprint_admin.models import RatePerPage

from .forms import  ChangeRate



def update_prices(request):

    if request.method == 'POST':
        form = ChangeRate(request.POST, instance=RatePerPage.objects.first())
        if form.is_valid():
            form.save()
            messages.success(request, 'Successfully updated prices')
            return redirect('update')
    else:
        form = ChangeRate(instance=RatePerPage.objects.first())
        return render(request, 'update.html', {'update_form': form})
