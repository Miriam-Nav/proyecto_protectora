# 🐾 Protectora App

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)](https://flutter.dev)  
[![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)](https://dart.dev)  
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

</div>

## 📋 Descripción

**Protectora App** es una aplicación móvil multiplataforma desarrollada en **Flutter** para la gestión integral de una protectora de animales.  
Permite administrar adopciones, fichas de animales, voluntarios y donaciones, ofreciendo una experiencia moderna y accesible tanto para el personal como para los usuarios interesados en colaborar o adoptar.

### Funcionalidades principales

🐶 **Gestión de animales** – Registro de fichas con fotos, estado de salud y disponibilidad  
📅 **Adopciones y citas** – Sistema de citas para adopciones y visitas  
👤 **Perfil de usuario** – Datos personales y favoritos  
🔔 **Notificaciones** – Recordatorios de citas y actualizaciones de estado  
🌍 **Multiidioma** – Español, Italiano e Inglés  
🎨 **UI moderna** – Diseño minimalista y consistente con Material Design  

---

## 🛠️ Tecnologías

- **Flutter** – Framework multiplataforma  
- **Dart** – Lenguaje optimizado para UI  
- **Riverpod** – Gestión de estado reactiva  
- **GoRouter** – Navegación declarativa  
- **Dio** – Cliente HTTP para comunicación con el backend  
- **Flutter Secure Storage** – Almacenamiento seguro de credenciales  
- **Shared Preferences** – Persistencia local de preferencias  
- **Cached Network Image** – Caché de imágenes de animales  

---

## 🏗️ Arquitectura

El proyecto sigue principios de **Clean Architecture** para garantizar mantenibilidad y escalabilidad:

lib/ 
├── main.dart # Entry point 
├── app/ # Configuración global (router, tema) 
├── core/ # Recursos compartidos (constantes, errores, utils) 
├── features/ 
│ ├── animals/ # Gestión de animales 
│ ├── adoptions/ # Flujo de adopciones 
│ ├── donations/ # Donaciones y pagos 
│ ├── notifications/ # Sistema de notificaciones 
│ └── profile/ # Perfil de usuario 
└── catalog/ # Catálogo de componentes UI reutilizables

---

## 🚀 Instalación y Arranque

### Prerrequisitos

- **Flutter SDK** 3.9.2 o superior  
- **Dart SDK** (incluido con Flutter)  
- Emulador Android/iOS o dispositivo físico  
- Backend de la protectora corriendo en `http://localhost:8000`

### Pasos

```bash
# 1. Clonar el repositorio
git clone https://github.com/Miriam-Nav/proyecto_protectora.git
cd proyecto_protectora

# 2. Instalar dependencias
flutter pub get

# 3. Ejecutar la aplicación
flutter run

```

### 📸 Capturas (opcional)


### 🤝 Contribución
Haz un fork del proyecto

Crea una rama (feature/nueva-funcionalidad)

Haz commit de tus cambios

Abre un Pull Request

### 📜 Licencia
Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.

<div align="center">

Desarrollado con Flutter para ayudar a proteger y dar hogar a los animales 🐾

</div>
