from django.db import models
GENDER = (
('male', 'male'),
('female', 'female'),
)

TYPE = (
    ('adeverinta','Adeverinta'),
    ('reteta','Reteta'),
    ('trimitere', 'Trimitere'),
    ('altceva','Altceva')
)

class Person(models.Model):
    CNP = models.CharField(max_length=13, verbose_name="Cod numeric personal", primary_key=True)
    name = models.CharField(max_length=100, blank=False, verbose_name="Nume")
    gender = models.CharField(max_length=10, choices=GENDER, verbose_name="Gen", blank=False)
    age = models.IntegerField(verbose_name="Varsta", blank=False)
    contact = models.EmailField(max_length=100, verbose_name="Email", default="introdu email")
    created_at = models.DateTimeField(auto_now_add=True)
    tag = models.IntegerField(verbose_name="Verification", default=1)
    detaliiMedicale = models.CharField(max_length=100, blank=True, null=True)  

    def __str__(self):
        return self.name 

    class Meta:
        ordering = ['-name']
        verbose_name_plural = "People"


class Request(models.Model):
    type = models.CharField(max_length=20, choices=TYPE, verbose_name="Tip", blank=False)
    details = models.CharField(max_length=1000, blank=False, verbose_name="Detalii")
    person = models.ForeignKey(Person, on_delete=models.CASCADE)
    
    def __str__(self):
        return f'{self.type} numarul {self.id}' 
        
    class Meta:
        ordering = ['-type']
        verbose_name_plural = "Requests"


class Document(models.Model):
    request = models.ForeignKey(Request, on_delete=models.CASCADE)
    details = models.TextField(max_length=1000, blank=False, verbose_name="Detalii")

    def __str__(self):
        return f'Document pentru {self.request}' 
        
    class Meta:
        ordering = ['-request']
        verbose_name_plural = "Documents"
