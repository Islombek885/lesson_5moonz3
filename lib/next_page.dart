import 'package:flutter/material.dart';
import 'models/product_model.dart';

class NextPage extends StatelessWidget {
  final ProductModel model;

  const NextPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                model.image,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      Text("${model.rating} (${model.reviewCount})"),
                      Text("${model.caloriesPerServing} CAL"),
                    ],
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      buildCategory(model.mealType.join(", ")),
                      const SizedBox(width: 8),
                      buildCategory(model.difficulty),
                      const SizedBox(width: 8),
                      buildCategory(model.cuisine),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Divider(),

                  Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...model.ingredients.map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle_outline, color: Colors.green),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(item, style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Divider(),

                  Text(
                    "Instructions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(model.instructions.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.orange,
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              model.instructions[index],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDetailRow(
                    "Prep Time",
                    "${model.prepTimeMinutes} minutes",
                  ),
                  buildDetailRow(
                    "Cook Time",
                    "${model.cookTimeMinutes} minutes",
                  ),
                  buildDetailRow("Servings", "${model.servings}"),
                  buildDetailRow("Difficulty", model.difficulty),
                  buildDetailRow("Cuisine", model.cuisine),
                  buildDetailRow("Tags", model.tags.join(", ")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 16)),
        const Divider(),
      ],
    );
  }

  Widget buildCategory(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: TextStyle(fontSize: 14)),
    );
  }
}
