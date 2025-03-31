import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/search/presentation/app/provider/search_provider.dart';

class SearchConsultantView extends ConsumerStatefulWidget {
  const SearchConsultantView({super.key});

  @override
  ConsumerState<SearchConsultantView> createState() =>
      _SearchConsultantViewState();
}

class _SearchConsultantViewState extends ConsumerState<SearchConsultantView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      print('Calling loadHistory...');
      ref.read(searchHistoryProvider.notifier).loadHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Adjust height
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    _controller.clear();
                    ref.read(searchConsultantProvider.notifier).clearQuery();
                    Navigator.pushReplacementNamed(
                        context, RoutesName.homeCustomerView);
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Search for consultant',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    ),
                    onChanged: (query) {
                      ref
                          .read(searchConsultantProvider.notifier)
                          .updateSearchQuery(query);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: SearchResultsOrHistory(controller: _controller)),
        ],
      ),
    );
  }
}

class SearchResultsOrHistory extends ConsumerWidget {
  final TextEditingController controller;

  const SearchResultsOrHistory({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (controller.text.isEmpty) {
      return const SearchHistoryList();
    }
    final searchQuery = ref.watch(searchConsultantProvider);

    return searchQuery.when(
      data: (queryList) {
        return ListView.builder(
          itemCount: queryList.length,
          itemBuilder: (context, index) {
            final item = queryList[index];
            return ListTile(
              title: Text(item.name),
              onTap: () {
                controller.text = item.name; // Update the controller text
                ref.read(searchHistoryProvider.notifier).addQuery(item.name);
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}

class SearchHistoryList extends ConsumerWidget {
  const SearchHistoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchHistory = ref.watch(searchHistoryProvider);

    return searchHistory.when(
      data: (historySearch) {
        if (historySearch.isEmpty) {
          return const Center(
            child: Text(
              'No search history available.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Recent',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () =>
                        ref.read(searchHistoryProvider.notifier).clearAll(),
                    child: const Text('Clear search'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: historySearch.length,
                itemBuilder: (context, index) {
                  final item = historySearch[index];
                  return ListTile(
                    title: Text(item),
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => ref
                          .read(searchHistoryProvider.notifier)
                          .removeQuery(item),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
