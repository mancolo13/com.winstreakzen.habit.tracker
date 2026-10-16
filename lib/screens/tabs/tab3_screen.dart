import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';


class Tab3Screen extends StatelessWidget {
  const Tab3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'Health & Fitness', 'count': '4 Habits', 'icon': Icons.fitness_center},
      {'name': 'Mind & Clarity', 'count': '3 Habits', 'icon': Icons.spa},
      {'name': 'Career & Learning', 'count': '2 Habits', 'icon': Icons.work_outline},
      {'name': 'Evening Routine', 'count': '2 Habits', 'icon': Icons.nightlight_round},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Win • Routine Categories')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, i) {
          final c = categories[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.2),
                  child: Icon(c['icon'] as IconData, color: AppTheme.primaryColor),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(c['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(c['count'] as String, style: const TextStyle(color: Colors.white60, fontSize: 12)),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white38),
              ],
            ),
          );
        },
      ),
    );
  }
}

