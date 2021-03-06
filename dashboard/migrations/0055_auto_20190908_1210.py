# Generated by Django 2.2.4 on 2019-09-08 17:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0054_problema_solucion_referencia'),
    ]

    operations = [
        migrations.AddField(
            model_name='estudiante',
            name='solo_apellido',
            field=models.CharField(default='', max_length=120),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='estudiante',
            name='solo_nombre',
            field=models.CharField(default='', max_length=120),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='usuario',
            name='alias',
            field=models.CharField(default='a', max_length=120),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='problema',
            name='nivel_reto',
            field=models.CharField(choices=[('N', 'Ninguno'), ('B', 'Basico'), ('M', 'Intermedio'), ('A', 'Avanzado')], default='N', max_length=1),
        ),
    ]
