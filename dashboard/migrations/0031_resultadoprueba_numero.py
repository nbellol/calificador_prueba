# Generated by Django 2.2 on 2019-06-11 03:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0030_auto_20190611_0257'),
    ]

    operations = [
        migrations.AddField(
            model_name='resultadoprueba',
            name='numero',
            field=models.IntegerField(default=1),
        ),
    ]
