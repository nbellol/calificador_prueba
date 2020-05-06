# Generated by Django 2.2.4 on 2019-08-12 02:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0051_resultadoprueba_mensaje'),
    ]

    operations = [
        migrations.AddField(
            model_name='problema',
            name='es_reto',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='problema',
            name='nivel_reto',
            field=models.CharField(choices=[('N', 'Ninguno'), ('B', 'Basico'), ('M', 'Medio'), ('A', 'Avanzado')], default='N', max_length=1),
        ),
    ]