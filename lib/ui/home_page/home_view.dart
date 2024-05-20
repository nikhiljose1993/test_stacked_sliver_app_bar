import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test_stacked_sliver_app_bar/ui/home_page/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (viewModel) {
        viewModel.fetchRecipes();
      },
      viewModelBuilder: () {
        return HomeViewModel();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: const Color.fromARGB(255, 255, 213, 227),
                leading: Image.asset('assets/images/Logo.png'),
                title: const Text('Recipies'),
                elevation: 16,
                forceElevated: true,
                shadowColor: const Color.fromARGB(255, 65, 65, 65),
                primary: true,

                stretchTriggerOffset: 100,

                collapsedHeight: 70,
                expandedHeight: 100,
                // flexibleSpace: const FlexibleSpaceBar(
                //   collapseMode: CollapseMode.pin,
                //   centerTitle: true,
                //   title: Text('Search'),
                //   // background: FlutterLogo(),
                // ),

                // stretch: true,
                snap: false,
                pinned: true,
                floating: true,
              ),
              if (viewModel.isBusy)
                const Center(child: CircularProgressIndicator.adaptive()),
              if (!viewModel.isBusy)
                SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 9 / 14,
                    ),
                    itemCount: viewModel.recipesList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: const Color.fromARGB(255, 243, 177, 255),
                        borderRadius: BorderRadius.circular(14),
                        onTap: () {},
                        child: Ink(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color.fromRGBO(248, 209, 255, 1),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.network(
                                      '${viewModel.recipesList[index].image}',
                                      loadingBuilder: (
                                        context,
                                        child,
                                        loadingProgress,
                                      ) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      '${viewModel.recipesList[index].name}',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${viewModel.recipesList[index].cuisine}',
                                  ),
                                  Text(
                                    '${viewModel.recipesList[index].difficulty}',
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
