import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:health_mate/src/auth/presentation/app/providers/auth_providers.dart';
import 'package:health_mate/src/interest_consultant_type/presentaion/provider/interest_consultant_provider.dart';
import 'package:health_mate/src/interest_consultant_type/presentaion/provider/interest_consultant_state.dart';
import 'package:health_mate/src/interest_consultant_type/presentaion/widgets/select_interest_card.dart';

class SelectInterestList extends ConsumerStatefulWidget {
  const SelectInterestList({super.key});

  @override
  ConsumerState<SelectInterestList> createState() => _SelectInterestItemState();
}

class _SelectInterestItemState extends ConsumerState<SelectInterestList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        ref.read(interestConsultantProvider.notifier).fetchConsultantTypes());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final consultantState = ref.watch(interestConsultantProvider);
              if (consultantState.status == InterestConsultantStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (consultantState.status ==
                  InterestConsultantStatus.error) {
                return Center(
                    child: Text('Lỗi: ${consultantState.errorMessage}'));
              } else {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: consultantState.consultants.length,
                    itemBuilder: (context, index) {
                      final category = consultantState.consultants[index];
                      return Consumer(
                        builder: (context, ref, child) {
                          return GestureDetector(
                            onTap: () {},
                            child: SelectInterestCard(
                              image: category.imageURL,
                              title: category.name,
                              isSelected: false,
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
