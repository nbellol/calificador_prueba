# Generated by Django 2.2 on 2019-06-23 04:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0048_remove_problema_numero'),
    ]

    operations = [
        migrations.AddField(
            model_name='prueba',
            name='peso',
            field=models.FloatField(default=1),
        ),
    ]
