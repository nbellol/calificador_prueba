# Generated by Django 2.2 on 2019-06-05 13:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0018_auto_20190603_1510'),
    ]

    operations = [
        migrations.AddField(
            model_name='envio',
            name='estado',
            field=models.CharField(choices=[('NU', 'Nuevo'), ('ER', 'Incorrecto'), ('OK', 'Correcto')], default='NU', max_length=2),
        ),
    ]
