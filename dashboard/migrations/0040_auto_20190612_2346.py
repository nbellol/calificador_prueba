# Generated by Django 2.2 on 2019-06-12 23:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0039_auto_20190612_2331'),
    ]

    operations = [
        migrations.AlterField(
            model_name='resultadotarea',
            name='avance',
            field=models.FloatField(default=0),
        ),
    ]
