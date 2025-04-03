import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_input_field.dart';

class SearchInput extends ConsumerStatefulWidget {
  const SearchInput({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SearchInputState();
  }
}

class _SearchInputState extends ConsumerState<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return CustomInputField(
        inputDecoration: InputDecoration(
      hintText: "Search for consultant",
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      prefixIcon: const Icon(Icons.search, color: Colors.grey),
      suffixIcon: const Icon(Icons.tune, color: Colors.grey),
      fillColor: Colors.grey[200],
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1),
        borderSide: BorderSide.none,
      ),
    ));
  }
}
