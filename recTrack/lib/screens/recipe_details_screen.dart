import 'package:flutter/material.dart';
import 'package:recptrack/widgets/rt_text.dart';
import '../widgets/rt_show_recipe.dart';
import '../widgets/rt_internet_connection.dart';

class RecipeDetailsScreen extends State<RTShowRecipe> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.teal),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          RTInternetConnection(),
          Container(
            height: 290,
            padding: EdgeInsets.only(left: 16),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 90,
                      width: 160,
                      child: RTText(
                        text: widget.label,
                        color: Colors.teal,
                        size: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 30,
                      width: 150,
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(children: [
                          Icon(
                            Icons.local_fire_department_outlined,
                            color: Colors.teal,
                          ),
                          RTText(
                            text: ' ${widget.calories.round()} Cal',
                            color: Colors.black,
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 30,
                      width: 150,
                      child: Row(children: [
                        Icon(
                          Icons.timer_outlined,
                          color: Colors.teal,
                        ),
                        RTText(
                          text: ' ${widget.totalTime.round()} Min',
                          color: Colors.black,
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 30,
                      width: 180,
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(children: [
                          Icon(
                            Icons.category_outlined,
                            color: Colors.teal,
                          ),
                          RTText(
                              text: ' ${widget.cuisineType.first} recipe',
                              color: Colors.black),
                        ]),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    right: -75,
                    top: 5,
                    child: SizedBox(
                        height: 280,
                        width: 300,
                        child: CircleAvatar(
                          radius: 40,
                          // Image radius
                          backgroundImage: NetworkImage(widget.image),
                        ))),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: AppBar(
              backgroundColor: Colors.teal,
              shadowColor: null,
              elevation: 0,
              bottom: TabBar(
                tabs: const [
                  Tab(
                    icon: RTText(
                      text: 'Ingredient',
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    icon: RTText(
                      text: 'Health Labels',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView.builder(
                  itemCount: widget.ingredientLines.length,
                  padding: EdgeInsets.only(left: 4, right: 4),
                  itemBuilder: (context, index) => Card(
                    color: Colors.grey[200],
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: RTText(
                        text: widget.ingredientLines[index],
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: widget.healthLabels.length,
                  padding: EdgeInsets.only(left: 4, right: 4),
                  itemBuilder: (context, index) => Card(
                    color: Colors.grey[200],
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: RTText(
                        text: widget.healthLabels[index],
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
