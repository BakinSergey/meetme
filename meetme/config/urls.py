from django.contrib import admin
from django.urls import path, include
from django.contrib.auth import views as auth_views
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.views.decorators.cache import never_cache
from django.contrib.staticfiles.views import serve

from core import views
from rest_framework_swagger.views import get_swagger_view

app_name = 'settings'

schema_view = get_swagger_view(title='MeetMe_API', )


urlpatterns = [
    path('', views.home, name='home'),
    path('admin/', admin.site.urls),
    path('login/', views.login, name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('social-auth/', include('social_django.urls', namespace='social')),

    path('api/', schema_view, name='schema_view'),
    path('api/', include('core.api', namespace='core')),

]


# if settings.DEBUG:

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += staticfiles_urlpatterns()
urlpatterns.append(path('static/<path:path>', never_cache(serve)))

