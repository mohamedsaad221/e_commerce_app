import 'package:e_commerce_app/layouts/cubit/home_layout_cubit.dart';
import 'package:e_commerce_app/layouts/home_layout.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/modules/details/details_screen.dart';
import 'package:e_commerce_app/modules/search/cubit/search_cubit.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/components/search_widget.dart';
import 'package:e_commerce_app/shared/helper/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              toolbarHeight: 40.0,
              leading: GestureDetector(
                onTap: () {
                  cubit.searchedProducts.clear();
                  navigateAndFinish(context, HomeLayout());
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              title: Text('Search Product'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    SearchWidget(
                      controller: searchController,
                      text: searchController.text,
                      hintText: 'Search',
                      onChanged: (String value) {
                        cubit.searchProduct(value);
                      },
                    ),
                    SizedBox(height: 10.0),
                    if (state is SearchLoadingState) LinearProgressIndicator(),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => buildListProduct(
                            context: context,
                            size: size,
                            index: index,
                            products: cubit.searchedProducts,
                          ),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: cubit.searchedProducts.length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildListProduct({
    required BuildContext context,
    required Size size,
    required int index,
    required List<ProductModel> products,
  }) {
    return Container(
      height: size.height * 0.4,
      child: GestureDetector(
        onTap: () {
          navigateTo(context, DetailsScreen(products[index]));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: size.height * 0.50,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100,
                    ),
                    child: Image.network(
                      products[index].image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              CustomText(
                text: products[index].name!,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 10.0),
              CustomText(
                text: products[index].description!,
                fontSize: 12,
                maxLine: 1,
              ),
              const SizedBox(height: 10.0),
              CustomText(
                text: '\$' + products[index].price!,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListProduct({
    required BuildContext context,
    required Size size,
    required int index,
    required List<ProductModel> products,
  }) {
    return Container(
      height: size.height * 0.15,
      child: GestureDetector(
        onTap: () {
          navigateTo(context, DetailsScreen(products[index]));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                // flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: size.height * 0.2,
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100,
                    ),
                    child: Image.network(
                      products[index].image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  CustomText(
                    text: products[index].name!,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    text: products[index].description!,
                    fontSize: 12,
                    maxLine: 1,
                  ),
                  CustomText(
                    text: '\$' + products[index].price!,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myDivider() => Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20.0,
          top: 10,
          bottom: 10,
        ),
        child: Container(
          width: double.infinity,
          height: 2.0,
          color: Colors.grey[300],
        ),
      );
}
