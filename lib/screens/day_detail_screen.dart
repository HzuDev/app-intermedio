import 'package:flutter/material.dart';
import '../widgets/exercise_list.dart';
import '../widgets/exercise_selector.dart';
import '../data/available_exercises.dart' as data;

class DayDetailScreen extends StatefulWidget {
  final String dia;
  final List<String> ejercicios;
  final Color color;

  DayDetailScreen({
    required this.dia,
    required this.ejercicios,
    required this.color,
  });

  @override
  _DayDetailScreenState createState() => _DayDetailScreenState();
}

class _DayDetailScreenState extends State<DayDetailScreen>
    with TickerProviderStateMixin {
  late List<String> ejerciciosSeleccionados;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    ejerciciosSeleccionados = widget.ejercicios;
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _agregarEjercicio(String ejercicio) {
    setState(() {
      if (!ejerciciosSeleccionados.contains(ejercicio)) {
        ejerciciosSeleccionados.add(ejercicio);
      }
    });
    _showSnackBar('Ejercicio agregado: $ejercicio', Icons.add_circle);
  }

  void _eliminarEjercicio(String ejercicio) {
    setState(() {
      ejerciciosSeleccionados.remove(ejercicio);
    });
    _showSnackBar('Ejercicio eliminado: $ejercicio', Icons.remove_circle);
  }

  void _showSnackBar(String message, IconData icon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 8),
            Text(message),
          ],
        ),
        backgroundColor: widget.color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              children: [
                // Header: se limita su altura para evitar overflow
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 220),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [widget.color, widget.color.withOpacity(0.8)],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Ejercicios del ${widget.dia}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                    ejerciciosSeleccionados,
                                  );
                                },
                                icon: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(Icons.save, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(24),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        ejerciciosSeleccionados.length
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Ejercicios',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 1,
                                    height: 40,
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '~${(ejerciciosSeleccionados.length * 15).toString()}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Minutos',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Zona inferior: se usa Expanded con un SingleChildScrollView
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ExerciseSelector(
                            availableExercises: data.exerciseIcons.keys
                                .toList(),
                            onExerciseSelected: _agregarEjercicio,
                            color: widget.color,
                          ),
                          SizedBox(height: 16),
                          // Aquí no usamos Expanded ya que SingleChildScrollView permite que el contenido se mida
                          ExerciseList(
                            ejercicios: ejerciciosSeleccionados,
                            onRemove: _eliminarEjercicio,
                            color: widget.color,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
