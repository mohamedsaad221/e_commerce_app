import 'package:e_commerce_app/modules/category/category_productes.dart';
import 'package:e_commerce_app/modules/details/details_screen.dart';
import 'package:e_commerce_app/modules/search/search_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100.0,
          left: 20.0,
          right: 20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  navigateTo(context, SearchScreen());
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    color: myGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              CustomText(
                text: 'Categories',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 20.0),
              _listViewCategory(context),
              SizedBox(height: 20.0),
              Row(
                children: [
                  CustomText(
                    text: 'Best Selling',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: CustomText(
                      text: 'See all',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              _listViewProduct(context, size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      child: ListView.separated(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                navigateTo(context, CategoryProducts());
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100,
                    ),
                    width: MediaQuery.of(context).size.width * 0.17,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.network(
                          'https://www.rebelsport.co.nz/globalassets/productimages/rebel/8149593/8149593_default_1.jpg?CatalogContentDetails-292774-600-600-75-0,0'),
                    ),
                  ),
                  SizedBox(height: 7),
                  CustomText(
                    text: 'Men',
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 20)),
    );
  }

  Widget _listViewProduct(BuildContext context, Size size) {
    return Container(
      height: size.height * 0.39,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            navigateTo(context, DetailsScreen());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.30,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade100,
                ),
                child: Image.asset(
                  'assets/images/watch.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 5.0),
              CustomText(
                text: 'Leather Wristwatch',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 10.0),
              CustomText(
                text: 'Tag Heuer',
                fontSize: 12,
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 10.0),
              CustomText(
                text: '\$755',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                alignment: Alignment.topLeft,
                color: primaryColor,
              ),

            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 10.0),
        itemCount: 6,
      ),
    );
  }

}
