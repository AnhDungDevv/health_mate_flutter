import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_button.dart';
import 'package:health_mate/src/consultant/domain/entities/category_entity.dart';

import 'package:health_mate/src/consultant/presentaion/app/provider/category_provider.dart';
import 'package:health_mate/src/consultant/presentaion/app/state/category_state.dart';
import 'package:health_mate/src/consultant/presentaion/widgets/select_category_card.dart';

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
    final consultantState = ref.watch(interestConsultantProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'What type of consultant do you need?',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: consultantState.status == InterestConsultantStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : consultantState.status == InterestConsultantStatus.error
                    ? Center(
                        child: Text('Lỗi: ${consultantState.errorMessage}'))
                    : _ConsultantTypeGrid(consultantState.consultantsType),
          ),
        ],
      ),
    );
  }
}

class _ConsultantTypeGrid extends StatelessWidget {
  final List<CategoryEntity> consultants;
  const _ConsultantTypeGrid(this.consultants);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _ConsultantTypeItem(consultants[index]);
            },
            childCount: consultants.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: CustomButton(
              label: "Continue",
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}

class _ConsultantTypeItem extends StatelessWidget {
  final CategoryEntity consultant;
  const _ConsultantTypeItem(this.consultant);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final isSelected = ref.watch(selectedInterestsProvider
            .select((state) => state.contains(consultant.id)));
        return GestureDetector(
          onTap: () {
            ref
                .read(selectedInterestsProvider.notifier)
                .toggleInterest(consultant.id);
          },
          child: SelectInterestCard(
            image: consultant.imageURL,
            title: consultant.name,
            isSelected: isSelected,
          ),
        );
      },
    );
  }
}
