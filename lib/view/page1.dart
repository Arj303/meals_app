import 'package:flutter/material.dart';

import '../models/meals_models.dart';

class CategoryDetails extends StatelessWidget {
  final Category category;

  const CategoryDetails({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.strCategory),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                category.strCategoryThumb,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              Text(
                category.strCategory,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                category.strCategoryDescription,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}