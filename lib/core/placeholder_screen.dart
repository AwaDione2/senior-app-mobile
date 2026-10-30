import 'package:flutter/material.dart';

/// Stand-in for a screen not yet wired up. Each one is tracked in
/// the "Application mobile (Flutter)" table of the technical proposal
/// doc — replace in the same order as that table.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('$title — à intégrer', style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
