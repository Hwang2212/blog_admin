import 'package:Blog_web/bloc/bloc.dart';
import 'package:Blog_web/theme/theme.dart';
import 'package:Blog_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:Blog_web/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../widgets/widgets.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextTheme get textTheme => Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[AppColors.gradient1, AppColors.gradient2])),
        child: SingleChildScrollView(
          child: Stack(
            children: [Center(child: buildMainContent())],
          ),
        ),
      ),
    );
  }

  Widget titleText() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p30),
      child: Row(
        children: [
          Text(
            'Categories',
            style: textTheme.headlineLarge,
          )
        ],
      ),
    );
  }

  Widget buildMainContent() {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoryLoading) {
        return const ShowLoading();
      }

      if (state is CategoryLoaded) {
        final categoryList = state.categoryList;
        return Container(
          margin: EdgeInsets.symmetric(
              vertical: AppMargin.m100, horizontal: AppMargin.m30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppTitleText(title: "Category"),
              const SizedBox(
                height: AppSize.s20,
              ),
              AppElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.addCategoryScreen);
                  },
                  child: const Text('Add Another Category')),
              Container(
                height: AppSize.s800,
                width: 2000,
                padding: ScreenUtils.contentMargin,
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p10,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 3),
                  // padding: ScreenUtils.contentMargin,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                          margin: ScreenUtils.contentMargin,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Text(
                              categoryList[index].name,
                              style: getBoldStyle(fontSize: 28),
                            ),
                            categoryList[index].activated == 1
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: AppColors.yellow,
                                      ),
                                      Text(
                                        "Activated",
                                        style: getLightStyle(
                                            fontSize: 10,
                                            color: Colors.black54,
                                            fontStyle: FontStyle.italic),
                                      )
                                    ],
                                  )
                                : const SizedBox(
                                    height: AppSize.s20,
                                  ),
                            Text(
                              "Description",
                              style: getLightStyle(
                                  fontSize: 10,
                                  color: Colors.black54,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(categoryList[index].description),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppElevatedButton(
                                  onPressed: () {},
                                  buttonColor: AppColors.yellow,
                                  child: const Icon(Icons.edit),
                                ),
                                const SizedBox(
                                  width: AppSize.s15,
                                ),
                                AppElevatedButton(
                                  onPressed: () {},
                                  buttonColor: AppColors.yellow,
                                  child: const Icon(Icons.search),
                                ),
                                const SizedBox(
                                  width: AppSize.s15,
                                ),
                                AppElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<CategoryBloc>(context,
                                            listen: false)
                                        .add(RemoveCategory(
                                            categoryList[index]));
                                  },
                                  buttonColor: AppColors.red,
                                  child: const Icon(Icons.delete),
                                ),
                              ],
                            )
                          ])),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      } else if (state is CategoryError) {
        return Center(
          child: Text(state.error),
        );
      }
      return Container();
    });
  }
}
