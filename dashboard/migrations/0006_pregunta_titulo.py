# Generated by Django 2.2 on 2019-05-31 19:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0005_auto_20190531_1931'),
    ]

    operations = [
        migrations.AddField(
            model_name='pregunta',
            name='titulo',
            field=models.CharField(default='Resumen pregunta', max_length=100),
        ),
    ]
