# Generated by Django 2.2 on 2019-05-30 02:57

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0003_auto_20190528_0530'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuario',
            name='ultimo_acceso',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.CreateModel(
            name='ResultadoEstudiante',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('resuelto', models.BooleanField(default=False)),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('puntos', models.IntegerField(default=0)),
                ('estudiante', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Estudiante')),
                ('problema', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Problema')),
            ],
        ),
    ]
