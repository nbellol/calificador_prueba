# Generated by Django 2.2 on 2019-05-22 14:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='curso',
            name='codigo_curso',
            field=models.CharField(default='DEPT-1234', max_length=20, unique=True),
        ),
    ]