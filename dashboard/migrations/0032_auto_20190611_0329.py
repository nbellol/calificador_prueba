# Generated by Django 2.2 on 2019-06-11 03:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0031_resultadoprueba_numero'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notificacion',
            name='tipo',
            field=models.CharField(choices=[('ME', 'Mensaje recibido'), ('RE', 'Nueva respuesta a pregunta'), ('ER', 'Envío revisado'), ('TD', 'Tarea Disponible'), ('WD', 'Trabajo en clase disponible'), ('PE', 'Un estudiante de su sección dejó una pregunta'), ('LO', 'Medalla otorgada')], default='ME', max_length=2),
        ),
        migrations.AlterField(
            model_name='revision',
            name='worker',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Worker'),
        ),
    ]
