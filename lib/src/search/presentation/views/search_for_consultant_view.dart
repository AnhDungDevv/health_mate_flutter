import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/search/presentation/app/provider/search_provider.dart';

final searchTextProvider = StateProvider<String>((ref) => '');

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
    _controller.addListener(() {
      ref.read(searchTextProvider.notifier).state = _controller.text;
    });

    Future.microtask(() {
      ref.read(searchHistoryProvider.notifier).loadHistory();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 40, left: 0, right: 16),
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
                      hintStyle: const TextStyle(fontSize: 14),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: const OutlineInputBorder(
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
    final searchText = ref.watch(searchTextProvider);

    if (searchText.isEmpty) {
      return const SearchHistoryList();
    }

    final searchQuery = ref.watch(searchConsultantProvider);
    return searchQuery.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (queryList) {
        if (queryList.isEmpty) {
          return const Center(child: Text('No results found.'));
        }
        return ListView.builder(
          itemCount: queryList.length,
          itemBuilder: (context, index) {
            final item = queryList[index];
            return ListTile(
              title: Text(item.name),
              onTap: () {
                controller.text = item.name;
                ref.read(searchHistoryProvider.notifier).addQuery(item.name);
              },
            );
          },
        );
      },
      error: (err, stack) => Center(child: Text('$err')),
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
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: historySearch.length,
              itemBuilder: (context, index) {
                final item = historySearch[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item,
                          style:
                              const TextStyle(fontSize: 14)), // Giữ chữ nhỏ hơn
                      IconButton(
                        icon: const Icon(Icons.close, size: 18), // Thu nhỏ icon
                        onPressed: () => ref
                            .read(searchHistoryProvider.notifier)
                            .removeQuery(item),
                      ),
                    ],
                  ),
                );
              },
            ))
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
