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

- [x] Ver calendario semanal
- [x] Seleccionar ejercicios por día
- [x] Mostrar resumen semanal
- [x] Manejo de datos en memoria (`Map<String, List<String>>`)
- [ ] Cambiar/eliminar ejercicios asignados
- [ ] Mejorar diseño visual con componentes personalizados

---

## 💾 Ejemplo de estructura de datos en memoria

Map<String, List `<String>`> rutinaSemanal = {
"lunes": ["Sentadillas", "Plancha"],
"martes": [],
"miércoles": ["Caminata"],
"jueves": [],
"viernes": ["Yoga"],
"sábado": [],
"domingo": []
};
👩‍💻 Organización del Trabajo en GitHub
Usamos Git y GitHub para trabajo colaborativo.

🔀 Flujo de trabajo
Crear ramas por funcionalidad (feature/calendario, feature/selector-ejercicios, etc.)

Realizar commits frecuentes con mensajes claros

Subir los cambios y crear Pull Requests

Revisar PRs y fusionarlos a main

📌 Tareas Pendientes
Estructura inicial del proyecto Flutter

Componente del calendario

Pantalla de detalle del día y selector de ejercicios

Lógica para guardar ejercicios por día (en memoria)

Visualización del resumen semanal

Funcionalidad para editar/eliminar ejercicios

Mejoras en diseño (colores, íconos, feedback visual)
