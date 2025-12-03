import 'package:flutter/material.dart';
import '../models/table_style.dart';
import '../widgets/word_table_renderer.dart';

class TableDetailScreen extends StatelessWidget {
  final TableStyle style;

  const TableDetailScreen({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(style.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Visual Representation
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Preview",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  WordTableRenderer(type: style.type),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Description Section
            _buildSectionTitle(context, 'Description'),
            Text(style.description, style: Theme.of(context).textTheme.bodyLarge),
            
            const SizedBox(height: 24),
            
            // Usage Section
            _buildSectionTitle(context, 'Best Used For'),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.lightbulb_outline, 
                    color: Theme.of(context).colorScheme.secondary
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      style.usage,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Instructions
            _buildSectionTitle(context, 'How to Create in Word'),
            _buildInstructionStep(1, 'Insert a table with your desired dimensions.'),
            _buildInstructionStep(2, _getSpecificInstruction(style.type)),
            _buildInstructionStep(3, 'Adjust column widths to fit content.'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildInstructionStep(int step, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.grey.shade300,
            child: Text(
              step.toString(),
              style: const TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  String _getSpecificInstruction(TableType type) {
    switch (type) {
      case TableType.simpleGrid:
        return 'Select the table, go to Table Design > Borders, and select "All Borders".';
      case TableType.apaAcademic:
        return 'Remove all vertical borders. Add a top border and bottom border to the header row, and a bottom border to the very last row of the table.';
      case TableType.bandedRows:
        return 'In Table Design options, check "Banded Rows". Choose a table style that supports alternating colors.';
      case TableType.listTable:
        return 'Remove vertical borders. Keep only horizontal borders between rows for a clean list look.';
      case TableType.colorfulHeader:
        return 'Select the top row, go to Shading, and pick a dark color. Change font color to white for contrast.';
      default:
        return 'Apply standard formatting.';
    }
  }
}
