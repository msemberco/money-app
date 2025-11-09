import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    required this.title,
    required this.amount,
    required this.trendDescription,
    required this.icon,
    required this.color,
    super.key,
  });

  final String title;
  final String amount;
  final String trendDescription;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black54,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    icon,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              amount,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              trendDescription,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
