# 🐾 Protectora App

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)](https://flutter.dev)  
[![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)](https://dart.dev)  
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

</div>

<img width="1436" height="803" alt="image" src="https://github.com/user-attachments/assets/84598a74-09a9-4e67-bc8c-a7037e1d32ce" />


## 📋 Descripción

**Protectora App** es una aplicación de Flutter para la gestión de animales en una protectora, incluyendo registro, edición, adopciones y validaciones con feedback claro. Utiliza Riverpod para el manejo de estado y una arquitectura modular por feature.

### Funcionalidades principales

- Registro, edición y eliminación de animales (CRUD).
- Solicitudes de adopción con validación de datos.
- Persistencia de preferencias y sesión en local.
- Navegación entre pantallas con feedback claro al usuario.
- Internacionalización y theming coherente.

---

## 🛠️ Tecnologías

- **Flutter** – Framework multiplataforma  
- **Dart** – Lenguaje optimizado para UI  
- **Riverpod** – Gestión de estado global  
- **Shared Preferences** – Persistencia local de preferencias  
- **Intl / flutter_localizations** → internacionalización (ES/EN/IT).
- **FocusNode** → Control de foco en validación.

---

## 🏗️ Arquitectura

El proyecto sigue una arquitectura modular por features, donde cada feature encapsula su propia lógica, datos y presentación.

lib/
├── app/                  # Tema, variantes, rutas
├── core/                 # Widgets base, l10n, helpers
├── features/
│   ├── protectora/
│   │   ├── data/         # Modelos y repositorios
│   │   ├── presentation/
│   │   │   ├── pages/    # Pantallas (crear_editar_animal.dart, formulario_adopcion.dart)
│   │   │   ├── widgets/  # Componentes visuales (appbar.dart, drawer_page.dart)
│   │   └── controllers/  # Controllers y Providers

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

### 📸 Capturas




### 📜 Licencia
Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.

<div align="center">

Desarrollado con Flutter para ayudar a proteger y dar hogar a los animales 🐾

</div>
