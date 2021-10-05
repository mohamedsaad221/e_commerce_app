import 'package:e_commerce_app/layouts/cubit/home_layout_cubit.dart';
import 'package:e_commerce_app/layouts/home_layout.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/modules/details/details_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/helper/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class CategoryProducts extends StatelessWidget {
  final String title;
  final List<ProductModel> products;

  const CategoryProducts({
    Key? key,
    required this.title,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        print('//////////// products length ////////// ${products.length}');

        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            toolbarHeight: 80.0,
            leading: GestureDetector(
              onTap: () {
                navigateAndFinish(context, HomeLayout());
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            title: Text(title),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Conditional.single(
                  context: context,
                  conditionBuilder: (context) => products.length > 0,
                  widgetBuilder: (context) => GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1 / 1.8,
                    children: List.generate(
                      products.length,
                      (index) =>
                          _buildGridProduct(context, size, index, products),
                    ),
                  ),
                  fallbackBuilder: (context) =>
                      const Center(child: const CircularProgressIndicator()),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGridProduct(
    BuildContext context,
    Size size,
    int index,
    List<ProductModel> products,
  ) {
    return Container(
      child: GestureDetector(
        onTap: () {
          navigateTo(context, DetailsScreen(products[index]));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
}
