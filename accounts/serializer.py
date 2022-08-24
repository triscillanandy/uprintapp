from unittest.util import _MAX_LENGTH
from django.core.exceptions import ValidationError
from rest_framework import serializers

from .utils import Util
from .models import User




from rest_framework import serializers

from rest_framework.validators import UniqueValidator
from django.contrib.auth.password_validation import validate_password
from django.utils.encoding import smart_str,force_bytes,DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode,urlsafe_base64_encode
from django.contrib.auth.tokens import PasswordResetTokenGenerator



class RegisterSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(
            required=True,
            validators=[UniqueValidator(queryset=User.objects.all())]
            )

    password = serializers.CharField(write_only=True, required=True, validators=[validate_password])
    password2 = serializers.CharField(write_only=True, required=True)

    class Meta:
        model = User
        fields = ('username', 'email','first_name', 'last_name','phone','password', 'password2')
        extra_kwargs = {
             'username': {'required': True},
            'first_name': {'required': True},
            'last_name': {'required': True},
            'phone': {'required': True}
        }

    def validate(self, attrs):
        if attrs['password'] != attrs['password2']:
            raise serializers.ValidationError({"password": "Password fields didn't match."})

        return attrs

    def create(self, validated_data):
        user = User.objects.create(
           username=validated_data['username'],
           email=validated_data['email'],
           first_name=validated_data['first_name'],
           last_name=validated_data['last_name'],
            phone=validated_data['phone'],
           
        )

        
        user.set_password(validated_data['password'])
        user.save()

        return user

class UserLoginSerializer(serializers.ModelSerializer):
    email =serializers.EmailField(max_length=255)
    class Meta:
        model =User
        fields=['email','password']



#class MyTokenObtainPairSerializer(TokenObtainPairSerializer):

 #   @classmethod
  #  def get_token(cls, user):
   #     token = super(MyTokenObtainPairSerializer, cls).get_token(user)

        # Add custom claims
    #    token['email'] = user.email
     #   return token        


#Serializer to Get User Details using Django Token Authentication
class UserSerializer(serializers.ModelSerializer):
  class Meta:
    model = User
    fields = '__all__'        



class SendPasswordResetEmailSerializer(serializers.Serializer):
    email =serializers.EmailField(max_length=255)
    class Meta:
        fields= ['email']
        def validate(self,attrs):
            email =attrs.get('email')
            if User.objects.filter(email=email).exists():
                user =User.objects.get(email=email)
                uid = urlsafe_base64_encode(force_bytes(user.id))
                print('Encoded UID ',uid)
                token =PasswordResetTokenGenerator().make_token(user)
                print('Password Reset Token',token)
                link = 'http://localhost:3000/api/user/reset'+uid+'/'+token
                print('Password Reset Link',link)
                #send email
                body = 'Click the following link to reset your password'
                data={
                    'subject':'Rest your pasword',
                    'body':body,
                    'to_email':user.email
                }
                Util.send_email(data)
                return attrs
            else: 
            
                raise ValidationError('Your are not a registered user yet')
 
class UserProfileSerializer(serializers.ModelSerializer):
    class Meta: 
        model =User
        fields =['id','email','name']

class UserChangePasswordSerializer(serializers.Serializer):
    password =serializers.CharField(max_length=255,style=
    {'input_type':'password'},write_only=True)
    password2 =serializers.CharField(max_length=255,style=
    {'input_type':'password'},write_only=True)
    class Meta:
        
        fields =['password','password2']
    def validate(self,attrs):
        password =attrs.get('password')
        password2 =attrs.get('password2')
        user = self.context.get(user)
        if password != password2:
            raise serializers.ValidationError("Password fields didn't match.")
        
        user.set_password(password)
        user.save()

        return attrs


class UserPasswordResetSerializer(serializers.Serializer):
    password =serializers.CharField(max_length=255,style=
    {'input_type':'password'},write_only=True)
    password2 =serializers.CharField(max_length=255,style=
    {'input_type':'password'},write_only=True)
    class Meta:
        
        fields =['password','password2']
    def validate(self,attrs):
     try: 
        password =attrs.get('password')
        password2 =attrs.get('password2')
        uid =self.context.get('uid')
        token =self.context.get('token')
        user = self.context.get(user)
        if password != password2:
            raise serializers.ValidationError({"password": "Password fields didn't match."})
        id = smart_str(urlsafe_base64_decode(uid))
        user -User.objects.get(id=id)
        if not PasswordResetTokenGenerator().check_token(user,token):
          raise ValidationError('Token is not valid or Expires') 
          
        user.set_password(password)
        user.save()
        return attrs
     except DjangoUnicodeDecodeError as identifier:
        PasswordResetTokenGenerator().check_token(user,token)
        raise ValidationError('Token is not vlaid or  Expired')

       