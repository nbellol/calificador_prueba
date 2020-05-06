# Generated by Django 2.2 on 2019-06-12 15:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0034_resultadotarea_tarea'),
    ]

    operations = [
        migrations.AddField(
            model_name='envio',
            name='slug',
            field=models.SlugField(default='slug'),
        ),
        migrations.AddField(
            model_name='problema',
            name='slug',
            field=models.SlugField(default='slug'),
        ),
        migrations.AlterField(
            model_name='tarea',
            name='fecha_limite',
            field=models.DateTimeField(),
        ),
        migrations.CreateModel(
            name='Recurso',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('descripcion', models.CharField(default='descripcion', max_length=300)),
                ('url', models.URLField(max_length=2000)),
                ('problema', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Problema')),
            ],
        ),
        migrations.CreateModel(
            name='ConsultaRecurso',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('problema', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Recurso')),
                ('usuario', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Usuario')),
            ],
        ),
    ]