import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';


class Tab2Screen extends StatelessWidget {
  const Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Scaffold(
      appBar: AppBar(title: const Text('Win • Weekly Heatmap')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Current Week Consistency', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: days.map((d) => Column(
                    children: [
                      Text(d, style: const TextStyle(color: Colors.white60, fontSize: 12)),
                      const SizedBox(height: 8),
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: d == 'Sun' ? Colors.white10 : AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(d == 'Sun' ? Icons.hourglass_empty : Icons.check, size: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  )).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _streakStatCard('Current Streak', '19 Days 🔥'),
          const SizedBox(height: 10),
          _streakStatCard('All-time Record', '42 Days 🏆'),
        ],
      ),
    );
  }

  Widget _streakStatCard(String label, String val) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.surfaceColor, borderRadius: BorderRadius.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
          Text(val, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.secondaryColor)),
        ],
      ),
    );
  }
}

