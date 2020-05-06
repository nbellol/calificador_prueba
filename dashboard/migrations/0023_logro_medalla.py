# Generated by Django 2.2 on 2019-06-09 23:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0022_auto_20190608_2113'),
    ]

    operations = [
        migrations.CreateModel(
            name='Medalla',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100)),
                ('descripcion', models.CharField(default='TAG', max_length=300)),
                ('nivel', models.IntegerField(default=1)),
            ],
        ),
        migrations.CreateModel(
            name='Logro',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('medalla', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Medalla')),
                ('usuario', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='dashboard.Usuario')),
            ],
        ),
    ]
