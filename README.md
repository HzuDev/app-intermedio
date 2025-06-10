# 🏃‍♀️ Agenda Semanal de Actividad Física

Aplicación desarrollada en **Flutter** para que los estudiantes planifiquen sus rutinas semanales de actividad física. Funciona completamente **sin conexión a internet** y **sin bases de datos externas**, enfocándose en el diseño de interfaces, navegación entre pantallas y manejo de datos en memoria.

---

## 📱 Descripción

La app permite:

- Ver un **calendario semanal** (lunes a domingo)
- Seleccionar ejercicios por día
- Visualizar la **rutina completa de la semana**
- Gestionar los ejercicios (agregar, eliminar, cambiar)

---

## 🧰 Tecnologías Utilizadas

- 🧩 **Flutter**
- 🎨 **Dart**
- 🧠 Lógica en memoria (uso de estructuras `Map`, `List`, `setState`)
- 📱 Interfaz adaptada a móvil (diseño amigable y responsive)

> **Nota:** No se utiliza internet, base de datos ni almacenamiento persistente. Toda la información se gestiona en memoria.

---


## 📂 Estructura Sugerida del Proyecto (Sujeta a cambios)

```
/lib
├── screens/
│   ├── home_screen.dart
│   ├── day_detail_screen.dart
│   └── weekly_summary_screen.dart
├── widgets/
│   ├── day_card.dart
│   ├── exercise_selector.dart
│   └── exercise_list.dart
├── models/
│   └── exercise.dart
├── data/
│   └── available_exercises.dart
└── main.dart
```


## ✅ Funcionalidades

- [X] Ver calendario semanal
- [X] Seleccionar ejercicios por día
- [X] Mostrar resumen semanal
- [X] Manejo de datos en memoria (`Map<String, List<String>>`)
- [ ] Cambiar/eliminar ejercicios asignados
- [ ] Mejorar diseño visual con componentes personalizados

---

## 💾 Ejemplo de estructura de datos en memoria


👩‍💻 Organización del Trabajo en GitHub
Usamos Git y GitHub para trabajo colaborativo.

Map<String, List`<String>`> rutinaSemanal = {

"lunes": ["Sentadillas", "Plancha"],

"martes": [],

"miércoles": ["Caminata"],

"jueves": [],

"viernes": ["Yoga"],

"sábado": [],

"domingo": []

};


## 🔀 Flujo de trabajo

### 1. Crear una rama por funcionalidad

Cada funcionalidad o corrección debe desarrollarse en una rama independiente para mantener el código organizado. Usa el siguiente comando para crear y cambiarte a una nueva rama:

```bash
git checkout -b feature/nombre-de-la-funcionalidad
```

Ejemplo:

```bash
git checkout -b feature/calendario
```

### 2. Realizar cambios y commits frecuentes

Haz los cambios necesarios en tu código y realiza commits frecuentes con mensajes claros que describan lo que hiciste. Usa los siguientes comandos:

1. Agrega los archivos modificados al área de preparación:

   ```bash
   git add .
   ```

   O, si quieres agregar un archivo específico:

   ```bash
   git add ruta/del/archivo
   ```
2. Realiza el commit con un mensaje descriptivo:

   ```bash
   git commit -m "Descripción clara de los cambios realizados"
   ```

Ejemplo:

```bash
git commit -m "Agrega funcionalidad para mostrar el calendario semanal"
```

### 3. Subir los cambios al repositorio remoto

Sube tu rama al repositorio remoto para que otros colaboradores puedan verla:

```bash
git push -u origin feature/nombre-de-la-funcionalidad
```

Ejemplo:

```bash
git push -u origin feature/calendario
```

### 4. Crear un Pull Request (PR)

1. Ve a tu repositorio en GitHub.
2. Verás una notificación para crear un Pull Request desde tu rama. Haz clic en **Compare & pull request**.
3. Escribe una descripción clara de los cambios realizados y solicita revisiones de tus compañeros.
4. Envía el PR.

### 5. Revisar y fusionar Pull Requests

1. Revisa los PRs de tus compañeros y deja comentarios si es necesario.
2. Una vez aprobado, fusiona el PR a la rama principal (`main`).
3. Después de fusionar, elimina la rama remota para mantener el repositorio limpio:
   ```bash
   git push origin --delete feature/nombre-de-la-funcionalidad
   ```

### 6. Actualizar tu rama local

Antes de comenzar una nueva funcionalidad, asegúrate de que tu rama principal (`main`) esté actualizada:

1. Cambia a la rama principal:

   ```bash
   git checkout main
   ```
2. Descarga los últimos cambios:

   ```bash
   git pull origin main
   ```
3. Crea una nueva rama para la siguiente funcionalidad y repite el flujo.

```bash
git checkout -b feature/nueva-funcionalidad
```


📌 Tareas Pendientes
 Estructura inicial del proyecto Flutter

 Componente del calendario

 Pantalla de detalle del día y selector de ejercicios

 Lógica para guardar ejercicios por día (en memoria)

 Visualización del resumen semanal

 Funcionalidad para editar/eliminar ejercicios

 Mejoras en diseño (colores, íconos, feedback visual)
