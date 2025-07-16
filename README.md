# SongApp

**Examen de Aplicaciones para Dispositivos Móviles - Ciclo 2025-01 (UPC)**

Aplicación móvil para melómanos que permite explorar canciones destacadas, ver detalles, marcar favoritas y compartir opiniones mediante comentarios.

## Características

- **Login** con credenciales UPC.
- **Listado de canciones** con imagen, título, artista y álbum.
- **Detalle de canción**: información completa, comentarios, agregar a favoritos y publicar reseñas con calificación.
- **Favoritos**: gestión y persistencia local.
- **Material Design 3**.

---

## Reglas de usuario UPC

Cada alumno cuenta con credenciales previamente creadas y cargadas:

- **Usuario (correo):** tu correo UPC (ejemplo: `u202300999@upc.edu.pe`)
- **Contraseña:** generada automáticamente:
  - Primera letra del primer nombre + primer apellido, todo en minúsculas, sin tildes ni ñ.

**Ejemplo:**

- Alumno: Valeria Sofía Mendoza Torres  
- Correo: `u202300999@upc.edu.pe`  
- Contraseña: `vmendoza`

---

## Guía de instalación y ejecución

### 1. Requisitos previos

- Tener instalado [Flutter](https://docs.flutter.dev/get-started/install) (SDK 3.8.1 o superior).
- Tener instalado Android Studio, VS Code o cualquier IDE compatible.
- Un emulador Android/iOS o dispositivo físico.

### 2. Clonar el repositorio

```sh
git clone https://github.com/JuanCali999/aplicaciones-moviles-eb-songapp.git
cd songapp
```

### 3. Instalar dependencias

```sh
flutter pub get
```

### 4. Ejecutar la aplicación

   En emulador o dispositivo físico:
```sh
flutter run
```

### 5. Acceso a la app

   Ingresa tu correo UPC y la contraseña generada según las reglas.
   Explora canciones, agrega favoritas y comenta.

### Notas

Si tienes problemas de compilación, ejecuta:

```sh
flutter clean
flutter pub get
```

- Los favoritos se guardan localmente y se mantienen tras cerrar la app.
- Para probar los endpoints, puedes usar Swagger.

### Estructura del proyecto

- lib/domain/: entidades y casos de uso.
- lib/data/: datasources y repositorios.
- lib/presentation/: pantallas, widgets y providers.

