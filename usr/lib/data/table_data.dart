import '../models/table_style.dart';

final List<TableStyle> tableStyles = [
  const TableStyle(
    id: '1',
    name: 'Simple Grid',
    description: 'A standard table with borders on all sides of every cell.',
    usage: 'General purpose data presentation where cell separation is critical.',
    type: TableType.simpleGrid,
  ),
  const TableStyle(
    id: '2',
    name: 'APA Academic',
    description: 'Minimalist style required for academic papers. No vertical lines; horizontal lines only at the top, bottom, and under the header.',
    usage: 'Research papers, academic journals, and formal publications.',
    type: TableType.apaAcademic,
  ),
  const TableStyle(
    id: '3',
    name: 'Banded Rows',
    description: 'Alternating row colors (zebra striping) to help the eye track data across wide tables.',
    usage: 'Financial reports, inventories, and long lists of data.',
    type: TableType.bandedRows,
  ),
  const TableStyle(
    id: '4',
    name: 'Professional List',
    description: 'Horizontal dividers only. Clean and modern look that reduces visual clutter.',
    usage: 'Resumes, invoices, and modern business documents.',
    type: TableType.listTable,
  ),
  const TableStyle(
    id: '5',
    name: 'Corporate Header',
    description: 'Bold header background with white text. Clearly distinguishes labels from data.',
    usage: 'Business presentations, marketing materials, and executive summaries.',
    type: TableType.colorfulHeader,
  ),
];
