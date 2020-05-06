# Generated by Django 2.2 on 2019-05-22 14:40

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Curso',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre_curso', models.CharField(max_length=120, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='CursoSemestre',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre_semestre', models.CharField(max_length=120, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Envio',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.IntegerField(default=1, unique=True)),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('puntaje', models.IntegerField(default=1)),
            ],
        ),
        migrations.CreateModel(
            name='Problema',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.IntegerField(default=1, unique=True)),
                ('titulo', models.CharField(max_length=120)),
                ('curso', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Curso')),
            ],
        ),
        migrations.CreateModel(
            name='Prueba',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.IntegerField(default=1)),
                ('descripcion', models.CharField(default='Prueba', max_length=120)),
                ('comentario_ok', models.CharField(max_length=120)),
                ('comentario_error', models.CharField(max_length=120)),
                ('problema', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Problema')),
            ],
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('login', models.CharField(max_length=120, unique=True)),
                ('nombre', models.CharField(max_length=120)),
                ('avatar', models.ImageField(blank=True, null=True, upload_to='image/')),
                ('tipo', models.CharField(choices=[('AD', 'Administrador'), ('PR', 'Profesor'), ('ES', 'Estudiante'), ('MO', 'Monitor')], default='ES', max_length=2)),
            ],
        ),
        migrations.CreateModel(
            name='Seccion',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.IntegerField(default=1)),
                ('nombre_semestre', models.CharField(max_length=16)),
                ('curso', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Curso')),
            ],
        ),
        migrations.CreateModel(
            name='ResultadoPrueba',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('numero', models.IntegerField(default=1, unique=True)),
                ('resultado', models.BooleanField(default=False)),
                ('envio', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Envio')),
                ('problema', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Problema')),
                ('prueba', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Prueba')),
            ],
        ),
        migrations.CreateModel(
            name='Pregunta',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('contenido', models.TextField(blank=True, null=True)),
                ('resuelta', models.BooleanField(default=False)),
                ('autor', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Usuario')),
                ('problema', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Problema')),
            ],
        ),
        migrations.CreateModel(
            name='ComentarioProblema',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('contenido', models.TextField(blank=True, null=True)),
                ('autor', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Usuario')),
                ('problema', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Problema')),
            ],
        ),
        migrations.CreateModel(
            name='ComentarioPregunta',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('contenido', models.TextField(blank=True, null=True)),
                ('autor', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Usuario')),
                ('pregunta', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Pregunta')),
            ],
        ),
        migrations.CreateModel(
            name='BlogPost',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(blank=True, null=True, upload_to='image/')),
                ('title', models.CharField(max_length=120)),
                ('slug', models.SlugField(unique=True)),
                ('content', models.TextField(blank=True, null=True)),
                ('publish_date', models.DateTimeField(blank=True, null=True)),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('user', models.ForeignKey(default=1, null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['-publish_date', '-updated', '-timestamp'],
            },
        ),
        migrations.CreateModel(
            name='Profesor',
            fields=[
                ('usuario_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='dashboard.Usuario')),
                ('seccion', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Seccion')),
            ],
            bases=('dashboard.usuario',),
        ),
        migrations.CreateModel(
            name='Monitor',
            fields=[
                ('usuario_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='dashboard.Usuario')),
                ('seccion', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Seccion')),
            ],
            bases=('dashboard.usuario',),
        ),
        migrations.CreateModel(
            name='Estudiante',
            fields=[
                ('usuario_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='dashboard.Usuario')),
                ('seccion', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Seccion')),
            ],
            bases=('dashboard.usuario',),
        ),
        migrations.AddField(
            model_name='envio',
            name='estudiante',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Estudiante'),
        ),
    ]
