# Generated by Django 2.2 on 2019-06-09 23:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0023_logro_medalla'),
    ]

    operations = [
        migrations.RenameField(
            model_name='seccion',
            old_name='curso',
            new_name='curso_seccion',
        ),
    ]
