# Generated by Django 2.2 on 2019-06-15 15:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0042_registro'),
    ]

    operations = [
        migrations.AddField(
            model_name='notificacion',
            name='link',
            field=models.CharField(max_length=300, null=True),
        ),
    ]
