import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchForConsultantView extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search for Consultant"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for consultant',
                prefixIcon:const  Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
              ),
              onSubmitted: (query) =>
                  ref.read(searchProvider.notifier).search(query),
            ),
          ),
          Expanded(child: )
        ],
      ),
    );
  }
}
