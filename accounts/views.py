
import datetime
from django.contrib.auth import get_user_model
from django.http import HttpResponse
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode 
from django.contrib.sites.shortcuts import get_current_site
from .tokens import account_activation_token
from django.core.mail import send_mail
from django.conf import settings
from django.contrib import messages
from django.template.loader import render_to_string
from django.utils.encoding import force_bytes, force_str
from django.shortcuts import redirect, render
from django.contrib.auth import authenticate ,login


from .forms import RegisterForm,LoginForm

from django.contrib.auth import get_user_model
User = get_user_model()
# Create your views here.
def home(request):
	return render(request, 'acc/index.html', {'title':'index'})
def dash(request):
	return render(request, 'index.html', {'title':'dashb'})
def dashboard(request):
	return render(request, 'dashboard.html', {'title':'dashboard'})

def logout(request):
	return render(request, 'acc/index.html', {'title':'index'})



    
def signin(request):
    if request.method == 'POST': 
        form=LoginForm(request.POST)   
    
    
        email =request.POST["email"]

        
        password= request.POST['password']

        user = authenticate(email=email ,password=password)

        if user is not None:
            login(request,user)
            
            return render( request,"dashboard.html")
        else:
            messages.error(request ,"Wrong credentials") 
            return redirect('signin')   
    else:
              form = LoginForm()
     
    return render(request, 'acc/signin.html', {'form': form}) 
   

    
     
   
def signup(request):
   

		
	

    

    if request.method == 'POST':
        form=RegisterForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.email =form.cleaned_data['email']
           
            
            user.set_password(form.cleaned_data['password'])
            user.active = False
        
            user.save()
            messages.success(request,'Your account has been successfully created')
            current_site = get_current_site(request)
            mail_subject = 'Activate your account.'
            message = render_to_string('acc/email.html', {
                             'user': user,
                             'domain': current_site.domain,
                             'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                             'token': account_activation_token.make_token(user),
                         })
            to_email = form.cleaned_data.get('email')
            send_mail(mail_subject, message, settings.EMAIL_HOST_USER, [to_email])
            #return HttpResponse('Please confirm your email address to complete the registration')
            return render(request, 'acc/check_ack.html', {'activate': True})
              #setting up email
           
           
            
    else:
              form = RegisterForm()
     
    return render(request, 'acc/signup.html', {'form': form})  

def activate(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.active = True
        user.save()
        login(request,user)
        return HttpResponse('Thank you for your email confirmation. Now you can login your account.')
    else:
         return HttpResponse('Activation link is invalid!')
 

from django.shortcuts import render

# Create your views here.
from django.shortcuts import render, redirect

from Uprint_admin.models import RatePerPage

from .forms import PrintForm
from django.contrib.auth.decorators import login_required
from PyPDF2 import PdfFileReader
from Uprint_admin.models import RatePerPage

@login_required(login_url=home)
def upload(request):
    if request.user.is_authenticated:
        rate_per_page_bw =RatePerPage.objects.first().rppBW
        rate_per_page_c =RatePerPage.objects.first().rppC
        if request.method == 'POST':

         form = PrintForm(request.POST,request.FILES)
         if form.is_valid():
            pdf_file = request.FILES['document'].open()
            num_pages = PdfFileReader(pdf_file,strict=False).getNumPages()
            #totalpages=pdf_file.num_pages
            form = PrintForm(request.POST, request.FILES)
            my_form = form.save(False)
            my_form.file_name = request.FILES['document'].name
            # ground_file_name = my_form.document.name.split('/')[-1]
           # my_form.copies = request.FILES['copies']
           #
           # `` my_form.colour = colour
          #  my_form.sides = request.FILES['sides']
            # Count Number Of Pages and calc Price
            my_form.num_pages = num_pages
            my_form.customer = User.objects.get(email=request.user)
            
            # Generate order id
            my_form.order_id = datetime.datetime.now().strftime('%S%M%I%d%m%Y') + str(request.user.pk)
            rate_per_page = rate_per_page_bw
            if request.POST.get('colour'):
                rate_per_page = rate_per_page_c
                my_form.price =float(request.POST.get('copies',False))*num_pages*rate_per_page   

               

            my_form.save()
           # print(totalpages)
            form.save()
            messages.success(request,'Your document has been successfully uploaded')
         
        else:
           form =PrintForm()
        return render(request,'upload.html' ,{'form':form},)
    else:
        return redirect('upload')

