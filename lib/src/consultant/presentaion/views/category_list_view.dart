import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/consultant/domain/entities/category_entity.dart';
import 'package:health_mate/src/consultant/presentaion/app/provider/category_provider.dart';
import 'package:health_mate/src/consultant/presentaion/app/state/category_state.dart';
import 'package:health_mate/src/consultant/presentaion/widgets/category_card.dart';
import 'package:health_mate/src/search/presentation/views/search_consultant_nav.dart';

class CategoryConsultantView extends ConsumerStatefulWidget {
  const CategoryConsultantView({super.key});

  @override
  ConsumerState<CategoryConsultantView> createState() =>
      _SelectInterestItemState();
}

class _SelectInterestItemState extends ConsumerState<CategoryConsultantView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        ref.read(interestConsultantProvider.notifier).fetchConsultantTypes());
  }

  @override
  Widget build(BuildContext context) {
    final consultantState = ref.watch(interestConsultantProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SearchConsultantNav(),
              const SizedBox(
                height: 16,
              ),
              consultantState.status == InterestConsultantStatus.loading
                  ? const Center(child: CircularProgressIndicator())
                  : consultantState.status == InterestConsultantStatus.error
                      ? Center(
                          child: Text('Lỗi: ${consultantState.errorMessage}'))
                      : _ConsultantTypeGrid(consultantState.consultantsType),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConsultantTypeGrid extends StatelessWidget {
  final List<CategoryEntity> consultants;
  const _ConsultantTypeGrid(this.consultants);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: consultants.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final consultant = consultants[index];
        return _ConsultantTypeItem(consultant);
      },
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
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.categorySpecficView);
          },
          child: ConsultantTypeCard(
            image: consultant.imageURL,
            title: consultant.name,
          ),
        );
      },
    );
  }
}
