import 'package:flutter/material.dart';
import '../data/table_data.dart';
import '../widgets/table_preview_card.dart';
import 'table_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Table Formats'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tableStyles.length,
        itemBuilder: (context, index) {
          final style = tableStyles[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TablePreviewCard(
              style: style,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TableDetailScreen(style: style),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
