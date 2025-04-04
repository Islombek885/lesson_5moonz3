import 'package:lesson_5moonz3/models/product_model.dart';
import 'package:lesson_5moonz3/next_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  List<ProductModel> models;
  HomePage({super.key, required this.models});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget information({required ProductModel model}) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(model.image, width: 80),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 170,
                child: Text(
                  model.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Row(
                children: [
                  Text('${model.caloriesPerServing} Cal'),
                  SizedBox(width: 10),
                  Text(model.difficulty),
                  SizedBox(width: 10),
                  Text(model.cuisine),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.star_half, color: Colors.orange),
                  SizedBox(width: 10),
                  Text("${model.rating}"),
                  SizedBox(width: 10),
                  Text('(${model.reviewCount})'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recipes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Search",
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: MediaQuery.of(context).size.height - 100,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 145,
                  ),
                  itemCount: widget.models.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        NextPage(model: widget.models[index]),
                              ),
                            );
                          },
                          child: information(model: widget.models[index]),
                        ),
                        if (index < widget.models.length - 1)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [SizedBox(height: 20), Divider()],
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
