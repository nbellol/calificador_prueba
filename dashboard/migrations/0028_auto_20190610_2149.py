# Generated by Django 2.2 on 2019-06-10 21:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0027_argumento_posicion'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='problema',
            name='tiempo',
        ),
        migrations.AddField(
            model_name='prueba',
            name='tiempo',
            field=models.IntegerField(default=5),
        ),
    ]
