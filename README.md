# 🐾 Protectora App

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)](https://flutter.dev)  [![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)](https://dart.dev)  [![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)



<img width="742" height="400" alt="Img1" src="https://github.com/user-attachments/assets/494a364f-548f-4dc6-83d8-a7ec5581907f" />
</div>



## 📋 Descripción

**Protectora App** es una aplicación de Flutter para la gestión de animales en una protectora, incluyendo registro, edición, adopciones y validaciones con feedback claro. Utiliza Riverpod para el manejo de estado y una arquitectura modular por feature.


### Funcionalidades principales

- Registro, edición y eliminación de animales (CRUD).
- Solicitudes de adopción con validación de datos.
- Persistencia de preferencias y sesión en local.
- Navegación entre pantallas con feedback.
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

```text
lib/
├── app/                  - Tema y variantes
├── core/                 - Widgets base y l10n
├── features/
│   ├── protectora/
│   │   ├── data/         - Modelos y repositorios
│   │   ├── presentation/
│   │   │   ├── pages/    - Pantallas
│   │   │   ├── widgets/  # Componentes visuales
│   │   └── controllers/  # Controllers y Providers

```




## 🚀 Instalación y Arranque

### Prerrequisitos

- **Flutter SDK** 3.9.2 o superior  
- **Dart SDK** (incluido con Flutter)  
- Emulador Android/iOS o dispositivo físico  



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
<div align="center">
<img width="394" height="449" alt="image" src="https://github.com/user-attachments/assets/15d719b0-d9b0-40da-853d-b19975b0423a" />    <img width="394" height="449" alt="image" src="https://github.com/user-attachments/assets/afb417f4-225c-4835-980e-653a6ac6e84a" />
</div>



### 📜 Licencia
Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.

