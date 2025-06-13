import 'package:flutter/material.dart';
import '../widgets/day_card.dart';
import '../screens/day_detail_screen.dart';
import '../screens/weekly_summary_screen.dart';
import '../screens/daily_summary_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  Map<String, List<String>> rutinaSemanal = {
    "Lunes": ["Sentadillas", "Plancha"],
    "Martes": [],
    "Miércoles": ["Caminata"],
    "Jueves": [],
    "Viernes": ["Yoga"],
    "Sábado": [],
    "Domingo": [],
  };

  final List<IconData> dayIcons = [
    Icons.fitness_center,
    Icons.sports_gymnastics,
    Icons.directions_walk,
    Icons.sports_martial_arts,
    Icons.self_improvement,
    Icons.weekend,
    Icons.home,
  ];

  final List<Color> dayColors = [
    Color(0xFF6C63FF),
    Color(0xFF74B9FF),
    Color(0xFF00B894),
    Color(0xFFFDCB6E),
    Color(0xFFE17055),
    Color(0xFFA29BFE),
    Color(0xFFFF7675),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
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

  int get totalEjercicios {
    return rutinaSemanal.values.fold(
      0,
      (total, ejercicios) => total + ejercicios.length,
    );
  }

  int get diasConEjercicios {
    return rutinaSemanal.values
        .where((ejercicios) => ejercicios.isNotEmpty)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 220,
                floating: false,
                pinned: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF6C63FF), Color(0xFF74B9FF)],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'FitWeek',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Tu agenda semanal de actividad física',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              _buildStatCard(
                                'Ejercicios',
                                totalEjercicios.toString(),
                              ),
                              SizedBox(width: 12),
                              _buildStatCard(
                                'Días activos',
                                diasConEjercicios.toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                actions: [
                  // Se ha sustituido el FloatingActionButton por un IconButton con decoración
                  Padding(
                    padding: EdgeInsets.only(right: 16, top: 8),
                    child: IconButton(
                      tooltip: 'Resumen semanal',
                      iconSize: 28,
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.3),
                              Colors.white.withOpacity(0.1),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.analytics_outlined,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeeklySummaryScreen(
                              rutinaSemanal: rutinaSemanal,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SliverPadding(
                padding: EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final dias = rutinaSemanal.keys.toList();
                    final dia = dias[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: DayCard(
                              dia: dia,
                              ejercicios: rutinaSemanal[dia]!,
                              icon: dayIcons[index],
                              color: dayColors[index],
                              onTap: () async {
                                final updatedList = await Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                        ) => DayDetailScreen(
                                          dia: dia,
                                          ejercicios: List.from(
                                            rutinaSemanal[dia]!,
                                          ),
                                          color: dayColors[index],
                                        ),
                                    transitionsBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                          child,
                                        ) {
                                          return SlideTransition(
                                            position: Tween<Offset>(
                                              begin: Offset(1.0, 0.0),
                                              end: Offset.zero,
                                            ).animate(animation),
                                            child: child,
                                          );
                                        },
                                  ),
                                );
                                if (updatedList != null) {
                                  setState(() {
                                    rutinaSemanal[dia] = updatedList;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }, childCount: rutinaSemanal.length),
                ),
              ),
              // Botón para ir al resumen diario, envuelto en un SliverToBoxAdapter
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.blueAccent,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DailySummaryScreen(rutinaSemanal: rutinaSemanal),
                        ),
                      );
                    },
                    icon: Icon(Icons.calendar_today, color: Colors.white),
                    label: Text(
                      'Resumen diario',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Clases de animación (simuladas)
class AnimationConfiguration {
  static Widget staggeredList({
    required int position,
    required Duration duration,
    required Widget child,
  }) {
    return child;
  }
}

class SlideAnimation extends StatelessWidget {
  final double verticalOffset;
  final Widget child;

  const SlideAnimation({
    Key? key,
    required this.verticalOffset,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class FadeInAnimation extends StatelessWidget {
  final Widget child;

  const FadeInAnimation({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
