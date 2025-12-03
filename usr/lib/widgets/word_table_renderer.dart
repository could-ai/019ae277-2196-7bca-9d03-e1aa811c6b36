import 'package:flutter/material.dart';
import '../models/table_style.dart';

class WordTableRenderer extends StatelessWidget {
  final TableType type;

  const WordTableRenderer({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TableType.simpleGrid:
        return _buildSimpleGrid();
      case TableType.apaAcademic:
        return _buildApaTable();
      case TableType.bandedRows:
        return _buildBandedTable(context);
      case TableType.listTable:
        return _buildListTable();
      case TableType.colorfulHeader:
        return _buildColorfulHeaderTable(context);
      case TableType.modernMinimalist:
        return _buildModernMinimalist(context);
      default:
        return _buildSimpleGrid();
    }
  }

  // 1. Simple Grid
  Widget _buildSimpleGrid() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      children: [
        _buildRow(['Header 1', 'Header 2', 'Header 3'], isHeader: true),
        _buildRow(['Data A1', 'Data A2', 'Data A3']),
        _buildRow(['Data B1', 'Data B2', 'Data B3']),
        _buildRow(['Data C1', 'Data C2', 'Data C3']),
      ],
    );
  }

  // 2. APA Style (Academic)
  Widget _buildApaTable() {
    return Table(
      border: const TableBorder(
        top: BorderSide(width: 2.0, color: Colors.black),
        bottom: BorderSide(width: 2.0, color: Colors.black),
        horizontalInside: BorderSide.none,
        verticalInside: BorderSide.none,
      ),
      children: [
        TableRow(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.black)),
          ),
          children: _buildCells(['Variable', 'Mean (M)', 'SD'], isHeader: true),
        ),
        _buildRow(['Condition A', '4.52', '1.2']),
        _buildRow(['Condition B', '3.89', '0.9']),
        _buildRow(['Condition C', '5.12', '1.5']),
      ],
    );
  }

  // 3. Banded Rows
  Widget _buildBandedTable(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary.withOpacity(0.1);
    return Table(
      border: TableBorder.all(color: Colors.grey.shade300),
      children: [
        _buildRow(['Item', 'Qty', 'Price'], isHeader: true, color: Colors.grey.shade200),
        _buildRow(['Widget A', '10', '\$5.00']),
        _buildRow(['Widget B', '5', '\$12.50'], color: color),
        _buildRow(['Widget C', '20', '\$2.00']),
        _buildRow(['Widget D', '8', '\$8.75'], color: color),
      ],
    );
  }

  // 4. List Table (Horizontal lines only)
  Widget _buildListTable() {
    return Table(
      border: const TableBorder(
        horizontalInside: BorderSide(width: 1.0, color: Colors.grey),
        bottom: BorderSide(width: 1.0, color: Colors.grey),
      ),
      children: [
        _buildRow(['Task Name', 'Assignee', 'Status'], isHeader: true),
        _buildRow(['Design UI', 'Alice', 'Done']),
        _buildRow(['Backend API', 'Bob', 'In Progress']),
        _buildRow(['Testing', 'Charlie', 'Pending']),
      ],
    );
  }

  // 5. Colorful Header
  Widget _buildColorfulHeaderTable(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Table(
      border: TableBorder.all(color: Colors.grey.shade400),
      children: [
        TableRow(
          decoration: BoxDecoration(color: primaryColor),
          children: [
            _buildCell('Quarter', isHeader: true, textColor: Colors.white),
            _buildCell('Revenue', isHeader: true, textColor: Colors.white),
            _buildCell('Growth', isHeader: true, textColor: Colors.white),
          ],
        ),
        _buildRow(['Q1 2023', '\$10k', '+5%']),
        _buildRow(['Q2 2023', '\$12k', '+20%']),
        _buildRow(['Q3 2023', '\$11k', '-8%']),
      ],
    );
  }

  // 6. Modern Minimalist
  Widget _buildModernMinimalist(BuildContext context) {
    return Table(
      border: TableBorder.all(style: BorderStyle.none),
      children: [
        TableRow(
          children: [
            _buildCell('PROJECT', isHeader: true, textColor: Colors.grey.shade600),
            _buildCell('CLIENT', isHeader: true, textColor: Colors.grey.shade600),
            _buildCell('YEAR', isHeader: true, textColor: Colors.grey.shade600),
          ],
        ),
        _buildRow(['Rebrand', 'Acme Corp', '2023']),
        _buildRow(['Website', 'Globex', '2024']),
        _buildRow(['App', 'Soylent', '2024']),
      ],
    );
  }

  TableRow _buildRow(List<String> cells, {bool isHeader = false, Color? color}) {
    return TableRow(
      decoration: color != null ? BoxDecoration(color: color) : null,
      children: cells.map((c) => _buildCell(c, isHeader: isHeader)).toList(),
    );
  }

  Widget _buildCell(String text, {bool isHeader = false, Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
          color: textColor ?? Colors.black87,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
  
  List<Widget> _buildCells(List<String> cells, {bool isHeader = false}) {
    return cells.map((c) => _buildCell(c, isHeader: isHeader)).toList();
  }
}
