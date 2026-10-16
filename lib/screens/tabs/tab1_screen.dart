import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/routing_service.dart';


class Tab1Screen extends StatefulWidget {
  const Tab1Screen({super.key});
  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> {
  final List<Map<String, dynamic>> _habits = [
    {'title': 'Morning 10m Meditation', 'cat': 'Mind', 'done': true},
    {'title': 'Drink 2.5L Filtered Water', 'cat': 'Health', 'done': true},
    {'title': '30m Deep Book Reading', 'cat': 'Growth', 'done': true},
    {'title': 'HIIT Workout or 5km Run', 'cat': 'Fitness', 'done': false},
    {'title': 'Evening Journal & Review', 'cat': 'Discipline', 'done': false},
  ];

  @override
  Widget build(BuildContext context) {
    final completedCount = _habits.where((h) => h['done'] == true).length;
    final progress = completedCount / _habits.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Win • StreakZen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_task, color: AppTheme.primaryColor),
            onPressed: () => RoutingService.openRegistrationUrl(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primaryColor.withValues(alpha: 0.28), AppTheme.surfaceColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.35)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('TODAY\'S DISCIPLINE', style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                    Text('🔥 19 Day Streak', style: const TextStyle(color: AppTheme.secondaryColor, fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 14),
                Text('$completedCount / ${_habits.length} Habits Done', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900)),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white12,
                  color: AppTheme.primaryColor,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text('Today\'s Checklist', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ..._habits.map((h) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: (h['done'] as bool) ? AppTheme.primaryColor.withValues(alpha: 0.25) : Colors.white10),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() => h['done'] = !(h['done'] as bool)),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (h['done'] as bool) ? AppTheme.primaryColor : Colors.white10,
                    ),
                    child: (h['done'] as bool) ? const Icon(Icons.check, size: 20, color: Colors.white) : null,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        h['title'] as String,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          decoration: (h['done'] as bool) ? TextDecoration.lineThrough : null,
                          color: (h['done'] as bool) ? Colors.white54 : Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(h['cat'] as String, style: const TextStyle(color: AppTheme.secondaryColor, fontSize: 11)),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

