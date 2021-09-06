import 'package:e_commerce_app/layouts/home_layout.dart';
import 'package:e_commerce_app/modules/details/details_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/components/custom_text.dart';
import 'package:e_commerce_app/shared/constance.dart';
import 'package:flutter/material.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: 80.0,
        leading: GestureDetector(
          onTap: () {
            navigateAndFinish(context, HomeLayout());
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text('Men'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.72,
              children: List.generate(
                10,
                (index) => _buildGridProduct(context, size),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridProduct(BuildContext context, Size size) {
    return Container(
      child: GestureDetector(
        onTap: () {
          navigateTo(context, DetailsScreen());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              ),
              SizedBox(height: 10.0),
              CustomText(
                text: 'Tag Heuer',
                fontSize: 12,
              ),
              SizedBox(height: 10.0),
              CustomText(
                text: '\$755',
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
