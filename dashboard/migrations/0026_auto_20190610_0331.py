# Generated by Django 2.2 on 2019-06-10 03:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0025_medalla_cantidad'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuario',
            name='medallas',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='usuario',
            name='puntos',
            field=models.IntegerField(default=0),
        ),
    ]
