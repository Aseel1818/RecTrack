import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../api/category_data.dart';
import '../model/category_model.dart';
import 'package:recptrack/widgets/rt_text.dart';
import '../widgets/rt_internet_connection.dart';
import 'category_items_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoryList = CategoryData().categoriesList;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: RTText(
                text: 'Categories',
                size: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 17, left: 30, right: 30),
              child: Column(
                children: [
                  RTInternetConnection(),
                  Expanded(
                    child: AnimationLimiter(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 10),
                          itemCount: categoryList.length,
                          itemBuilder: (BuildContext context, int index) =>
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CategoryItemsScreen(
                                                url: categoryList[index]
                                                    .categoryUrl
                                                    .toString(),
                                                name: categoryList[index]
                                                    .categoryName
                                                    .toString())));
                                  },
                                  child: AnimationConfiguration.staggeredGrid(
                                      columnCount: 2,
                                      position: index,
                                      duration: Duration(milliseconds: 2000),
                                      child: ScaleAnimation(
                                          child: FadeInAnimation(
                                              delay:
                                                  Duration(milliseconds: 200),
                                              child: listItem(
                                                  categoryList[index])))))),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget listItem(CategoryModel category) {
    return Card(
        elevation: 4,
        shadowColor: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.all(8),
              child: Image.asset(category.categoryImage),
            ),
            SizedBox(
              height: 16,
            ),
            RTText(
              text: category.categoryName,
              size: 18,
              color: Colors.black,
            )
          ],
        ));
  }
}
