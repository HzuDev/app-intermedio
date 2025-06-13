import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DailySummaryScreen extends StatefulWidget {
  final Map<String, List<String>> rutinaSemanal;

  const DailySummaryScreen({Key? key, required this.rutinaSemanal})
    : super(key: key);

  @override
  _DailySummaryScreenState createState() => _DailySummaryScreenState();
}

class _DailySummaryScreenState extends State<DailySummaryScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Mappea el día de la semana al nombre en español
  String _weekdayToString(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Lunes';
      case DateTime.tuesday:
        return 'Martes';
      case DateTime.wednesday:
        return 'Miércoles';
      case DateTime.thursday:
        return 'Jueves';
      case DateTime.friday:
        return 'Viernes';
      case DateTime.saturday:
        return 'Sábado';
      case DateTime.sunday:
        return 'Domingo';
      default:
        return '';
    }
  }

  List<String> _getExercisesForDay(DateTime day) {
    String dayName = _weekdayToString(day.weekday);
    return widget.rutinaSemanal[dayName] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final exercises = _selectedDay != null
        ? _getExercisesForDay(_selectedDay!)
        : [];
    return Scaffold(
      appBar: AppBar(title: Text('Resumen Diario')),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.orangeAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: exercises.isNotEmpty
                  ? ListView.builder(
                      itemCount: exercises.length,
                      itemBuilder: (context, index) {
                        final exercise = exercises[index];
                        return ListTile(
                          leading: Icon(Icons.fitness_center),
                          title: Text(exercise),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No hay ejercicios programados para este día',
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
