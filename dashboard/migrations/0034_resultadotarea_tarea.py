# Generated by Django 2.2 on 2019-06-12 00:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0033_resultadotarea_tarea'),
    ]

    operations = [
        migrations.AddField(
            model_name='resultadotarea',
            name='tarea',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Tarea'),
        ),
    ]
