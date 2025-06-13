import 'package:flutter/material.dart';
import 'package:app_intermedio/data/available_exercises.dart';

class ExerciseList extends StatelessWidget {
  final List<String> ejercicios;
  final Function(String) onRemove;
  final Color color;

  ExerciseList({
    required this.ejercicios,
    required this.onRemove,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (ejercicios.isEmpty) {
      return Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.fitness_center_outlined,
                size: 64,
                color: Colors.grey[400],
              ),
              SizedBox(height: 16),
              Text(
                'No hay ejercicios programados',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Agrega ejercicios para este día',
                style: TextStyle(color: Colors.grey[500]),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.list_alt, color: color),
                SizedBox(width: 8),
                Text(
                  'Ejercicios programados',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3436),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: ejercicios.length,
              itemBuilder: (context, index) {
                final ejercicio = ejercicios[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: color.withOpacity(0.2)),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        exerciseIcons[ejercicio] ?? Icons.fitness_center,
                        color: color,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      ejercicio,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2D3436),
                      ),
                    ),
                    subtitle: Text(
                      '~15 minutos',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    trailing: IconButton(
                      onPressed: () => onRemove(ejercicio),
                      icon: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
