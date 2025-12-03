class TableStyle {
  final String id;
  final String name;
  final String description;
  final String usage;
  final TableType type;

  const TableStyle({
    required this.id,
    required this.name,
    required this.description,
    required this.usage,
    required this.type,
  });
}

enum TableType {
  simpleGrid,
  listTable,
  apaAcademic,
  professionalReport,
  bandedRows,
  colorfulHeader,
  modernMinimalist, // Added new type
}
