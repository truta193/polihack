# Generated by Django 3.1.8 on 2022-12-10 07:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pf', '0002_auto_20221210_0853'),
    ]

    operations = [
        migrations.AddField(
            model_name='person',
            name='tag',
            field=models.IntegerField(default=1, verbose_name='Verification'),
        ),
    ]
