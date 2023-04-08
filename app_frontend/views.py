from django.views.generic import TemplateView
from django.shortcuts import render
from django.conf import settings

class HomeView(TemplateView):
    template_name = "frontend/home.html"

    def get(self, request, *args, **kwargs):
        context = {
            'DEBUG': settings.DEBUG,
            'STATIC_URL': settings.STATIC_URL,
        }
        return render(request, self.template_name, context)
