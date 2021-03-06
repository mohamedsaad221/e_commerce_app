import 'package:e_commerce_app/layouts/cubit/home_layout_cubit.dart';
import 'package:e_commerce_app/modules/category/category_productes.dart';
import 'package:e_commerce_app/modules/details/details_screen.dart';
import 'package:e_commerce_app/modules/search/search_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/helper/constance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              top: 100.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Container(
              // height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15.0),
                    GestureDetector(
                      onTap: () {
                        navigateTo(context, SearchScreen());
                      },
                      child: Container(
                        width: size.width,
                        height: 50,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                          color: myGrey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: const Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    CustomText(
                      text: 'Categories',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 30.0),
                    _listViewCategory(context),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        CustomText(
                          text: 'Best Selling',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: CustomText(
                            text: 'See all',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    _listViewBestSellingProducts(context, size),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _listViewCategory(BuildContext context) {
    var cubit = HomeLayoutCubit.get(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: MediaQuery.of(context).size.height * 0.13,
      child: ListView.separated(
          itemCount: cubit.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                navigateTo(
                  context,
                  CategoryProducts(
                    title: cubit.categories[index].name!,
                    products: cubit.getProductsByCategory(
                      categoryName: cubit.categories[index].name!.toLowerCase(),
                      allProducts: cubit.allProducts,
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width * 0.17,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.network(
                            cubit.categories[index].image!,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomText(text: cubit.categories[index].name!),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 20)),
    );
  }

  Widget _listViewBestSellingProducts(BuildContext context, Size size,) {
    return Container(
      height: size.height * 0.40,
      width: size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            navigateTo(
                context,
                DetailsScreen(
                    HomeLayoutCubit.get(context).allProducts[index]));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: size.height * 0.30,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100,
                    ),
                    child: Image.network(
                      HomeLayoutCubit.get(context).allProducts[index].image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              CustomText(
                text: HomeLayoutCubit.get(context).allProducts[index].name,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                alignment: Alignment.topLeft,
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: size.width * 0.4,
                child: CustomText(
                  text: HomeLayoutCubit.get(context).allProducts[index].description!,
                  fontSize: 12,
                  maxLine: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 10.0),
              CustomText(
                text: '\$' +
                    HomeLayoutCubit.get(context)
                        .allProducts[index]
                        .price,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                alignment: Alignment.topLeft,
                color: primaryColor,
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10.0),
        itemCount: HomeLayoutCubit.get(context).allProducts.length,
      ),
    );
  }
}
