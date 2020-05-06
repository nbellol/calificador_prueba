from django import forms
from django.forms import ModelChoiceField

from martor.fields import MartorFormField

from dashboard.models.secciones import Curso, CursoSemestre, Seccion
from dashboard.models.usuarios import Profesor
from dashboard.constantes import TIPOS_PREGUNTAS, NIVELES, DIFICULTADES, NIVEL_RETO


class AuthForm(forms.Form):
    usuario = forms.CharField(label='Nombre de usuario', required=True, initial="usuario", help_text='Usuario uniandes')
    password = forms.CharField(label='Password', required=True, initial='password', help_text='Password de la plataforma')


class EnvioForm(forms.Form):
    codigo_envio = forms.CharField(widget=forms.Textarea, required=True, label='Código de la Solución', help_text='C&oacute;digo de su soluci&oacute;n')
    slug_problema = forms.CharField(widget=forms.HiddenInput)
    tipo_forma = forms.CharField(widget=forms.HiddenInput)
    numero_envio = forms.CharField(widget=forms.HiddenInput)


from django.forms import ModelChoiceField

class MyModelChoiceField(ModelChoiceField):
    def label_from_instance(self, obj):
        return str(obj.nombre_semestre) + " - " + str(obj.numero)
    
    
class NuevaTareaForma(forms.Form):
    # numero_tarea = forms.CharField(widget=forms.HiddenInput)
    titulo = forms.CharField(label='Título', required=True, initial="N1 - Tarea 1", help_text='Descripción de la tarea')    
    fecha_limite = forms.CharField(
            required=True, label='Fecha de entrega', 
            help_text='Hasta cuándo debe estar disponible')
    numero_seccion = MyModelChoiceField(
        label='Número de sección',
        required=True,
        widget=forms.Select,
        queryset=None,
        empty_label=None
    )
    problemas = forms.CharField( label='Problemas seleccionados',
                               required=False,
                               initial="",
                               widget=forms.RadioSelect
    )    
    
    def __init__(self, secciones, *args, **kwargs):
        self.secciones = secciones
        super(NuevaTareaForma,self).__init__(*args, **kwargs)
        self.fields['numero_seccion'].queryset = self.secciones




class PreguntaForm(forms.Form):
    titulo = forms.CharField(label='Resumen', required=True, initial="Resumen de la pregunta", help_text='Máximo 100 caracteres')
    contenido = forms.CharField(widget=forms.Textarea, required=True, label='Contenido pregunta', help_text='Contenido de la pregunta')
    tipo = forms.ChoiceField(
        label='Tipo de pregunta',
        required=True,
        widget=forms.Select,
        choices=TIPOS_PREGUNTAS,
    )


class ComentarioForm(forms.Form):
    titulo = forms.CharField(label='Resumen', required=True, initial="Resumen de la respuesta", help_text='Máximo 100 caracteres')
    contenido = forms.CharField(widget=forms.Textarea, required=True, label='Contenido respuesta')
    id_pregunta = forms.CharField(widget=forms.HiddenInput)


class SeccionForm(forms.Form):
    curso = forms.ModelChoiceField(queryset=Curso.objects.all(), label="Curso", empty_label=None)
    semestre = forms.ModelChoiceField(queryset=CursoSemestre.objects.all().order_by('-nombre_semestre'), label="Semestre", empty_label=None, help_text='Código del semestre')
    numero_seccion = forms.CharField(label='Número de seccion', required=True, initial="1", help_text='Número de la sección')
    archivo_json = forms.FileField(label="Archivo estudiantes", help_text="Archivo de brightspace con los miembros de la sección")

class MonitoresForm(forms.Form):
    curso = forms.ModelChoiceField(queryset=Curso.objects.all(), label="Curso", empty_label=None)
    semestre = forms.ModelChoiceField(queryset=CursoSemestre.objects.all().order_by('-nombre_semestre'), label="Semestre", empty_label=None, help_text='Código del semestre')
    archivo_csv = forms.FileField(label="Archivo monitores", help_text="Archivo con la información de monitores")

class RetoForm(forms.Form):
    curso = forms.ModelChoiceField(queryset=Curso.objects.all(), label="Curso", empty_label="(Nothing)")
    autor = forms.ModelChoiceField(queryset=Profesor.objects.all(), label="Autor", empty_label="(Nothing)")
    nivel = forms.ChoiceField(
        label='Nivel de dificultad del reto',
        required=True,
        widget=forms.Select,
        choices=NIVEL_RETO,
    )
    archivo_csv = forms.FileField(label="Archivo del reto", help_text="Archivo CSV con la información del reto")


class SolucionReferenciaForm(forms.Form):
    codigo_solucion = forms.CharField(widget=forms.Textarea, required=True, label='Código solución de referencia', help_text='C&oacute;digo de su soluci&oacute;n')    
    slug_problema = forms.CharField(widget=forms.HiddenInput)
    tipo_forma = forms.CharField(widget=forms.HiddenInput)
    

class AvatarForm(forms.Form):
    avatar = forms.FileField(label="Nueva imagen de perfil", help_text="Use una imagen pequeña y cuadrada (90 x 90), máx 150kb.")

class PasswordForm(forms.Form):
    actual = forms.CharField(widget=forms.PasswordInput,
                             label='Password actual',
                             required=True, initial='',
                             help_text='Password actual')
    nuevo = forms.CharField(widget=forms.PasswordInput,
                            label='Nuevo password',
                            required=True,
                            initial='',
                            help_text='Nuevo password')
    confirmacion = forms.CharField(widget=forms.PasswordInput,
                                   label='Confirmación',
                                   required=True,
                                   initial='',
                                   help_text='Confirmación del password')

class AliasForm(forms.Form):
    alias = forms.CharField(widget=forms.TextInput,
                             label='Nuevo alias',
                             required=True,
                             help_text='Nuevo alias que verán los otros usuarios')


class BusquedaSimpleForm(forms.Form):
    terminos = forms.CharField(widget=forms.TextInput(attrs={'class': "form-control"}), 
                               label='Pálabras clave', 
                               required=False,
                               initial="", 
                               help_text='Términos para la búsqueda')


class BusquedaAvanzadaForm(forms.Form):
    terminos = forms.CharField(widget=forms.TextInput(attrs={'class': "form-control"}), 
                               label='Pálabras clave', 
                               required=False,
                               initial="", 
                               help_text='Términos para la búsqueda')
    nivel = forms.ChoiceField( label='Nivel',
                               required=True,
                               initial="0",
                               widget=forms.RadioSelect,
                               choices=NIVELES,
    )
    rango_dificultad = forms.ChoiceField( label='Dificultad',
                               required=True,
                               initial="50",
                               widget=forms.RadioSelect(attrs={'class': "radio"}),
                               choices=DIFICULTADES,
    )
    tags = forms.CharField( label='Tags',
                               required=False,
                               initial="",
                               widget=forms.RadioSelect
    )    
    


class MartorForm(forms.Form):
    description = MartorFormField()

#class BlogPostForm(forms.Form):
#    title = forms.CharField()
#    slug = forms.SlugField()
#    content = forms.CharField(widget=forms.Textarea)
#
#
#class BlogPostModelForm(forms.ModelForm):
#    class Meta:
#        model = BlogPost
#        fields = ['title', 'image', 'slug', 'content', 'publish_date']
#
#    def clean_title(self, *args, **kwargs):
#        instance = self.instance
#        print(instance)
#        title = self.cleaned_data.get('title')
#        print(title)
#        qs = BlogPost.objects.filter(title__iexact=title)
#        if instance is not None:
#            qs = qs.exclude(pk=instance.pk)
#
#        if qs.exists():
#            raise forms.ValidationError("Titulo repetido")
#        return title
