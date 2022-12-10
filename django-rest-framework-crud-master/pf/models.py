from django.db import models
GENDER = (
('male', 'male'),
('female', 'female'),
)

class Person(models.Model):
    CNP = models.CharField(max_length=13, verbose_name="Cod numeric personal", primary_key=True)
    name = models.CharField(max_length=100, blank=False, verbose_name="Nume")
    gender = models.CharField(max_length=10, choices=GENDER, verbose_name="Gen", blank=False)
    age = models.IntegerField(verbose_name="Varsta", blank=False)
    contact = models.EmailField(max_length=100, verbose_name="Email", default="introdu email")
    created_at = models.DateTimeField(auto_now_add=True)
    tag = models.IntegerField(verbose_name="Verification", default=1)


    class Meta:
        ordering = ['-name']


