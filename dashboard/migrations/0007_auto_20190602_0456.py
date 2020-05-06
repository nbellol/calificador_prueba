# Generated by Django 2.2 on 2019-06-02 04:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0006_pregunta_titulo'),
    ]

    operations = [
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('texto', models.CharField(default='TAG', max_length=100)),
                ('descripcion', models.CharField(default='TAG', max_length=300)),
            ],
        ),
        migrations.AddField(
            model_name='pregunta',
            name='tags',
            field=models.ManyToManyField(to='dashboard.Tag'),
        ),
    ]