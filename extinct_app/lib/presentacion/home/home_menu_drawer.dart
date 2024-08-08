import 'package:flutter/material.dart';

class HomeMenuDrawer extends StatelessWidget {
  final VoidCallback onClose;

  const HomeMenuDrawer({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: onClose,
            child: const Text('Close Menu'),
          ),
          const _AnimalsGrid(),
        ],
      ),
    );
  }
}

class _AnimalsGrid extends StatelessWidget {
  const _AnimalsGrid();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blueGrey,
            ),
          );
        },
        itemCount: 9, // You can set the number of items here
      ),
    );
  }
}
