# Generated by Django 2.2 on 2019-06-02 21:28

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0013_auto_20190602_2125'),
    ]

    operations = [
        migrations.AddField(
            model_name='resultadoestudiante',
            name='ultimo_intento',
            field=models.DateTimeField(default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
