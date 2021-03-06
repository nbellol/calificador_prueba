# Generated by Django 2.2 on 2019-06-08 21:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0021_notificacion'),
    ]

    operations = [
        migrations.AddField(
            model_name='envio',
            name='contenido',
            field=models.TextField(blank=True),
        ),
        migrations.AlterField(
            model_name='notificacion',
            name='tipo',
            field=models.CharField(choices=[('ME', 'Mensaje'), ('RE', 'Nueva respuesta a pregunta'), ('ER', 'Envío revisado'), ('TD', 'Tarea Disponible'), ('WD', 'Trabajo en clase disponible'), ('PE', 'Pregunta estudiante'), ('LO', 'Logro alcanzado')], default='ME', max_length=2),
        ),
    ]
