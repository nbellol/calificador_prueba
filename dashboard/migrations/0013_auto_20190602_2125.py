# Generated by Django 2.2 on 2019-06-02 21:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0012_envio_resultado_estudiante'),
    ]

    operations = [
        migrations.AddField(
            model_name='resultadoestudiante',
            name='estudiante',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Estudiante'),
        ),
        migrations.AddField(
            model_name='resultadoestudiante',
            name='problema',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Problema'),
        ),
    ]