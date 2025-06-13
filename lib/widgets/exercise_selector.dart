import 'package:flutter/material.dart';
import '../data/available_exercises.dart' as exerciseData;

class ExerciseSelector extends StatelessWidget {
  final List<String> availableExercises;
  final Function(String) onExerciseSelected;
  final Color color;

  const ExerciseSelector({
    Key? key,
    required this.availableExercises,
    required this.onExerciseSelected,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.add_circle_outline, color: color),
                SizedBox(width: 8),
                Text(
                  'Agregar ejercicio',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3436),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: availableExercises.map((ejercicio) {
                return InkWell(
                  onTap: () => onExerciseSelected(ejercicio),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: color.withOpacity(0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          exerciseData.exerciseIcons[ejercicio] ??
                              Icons.fitness_center,
                          color: color,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          ejercicio,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
