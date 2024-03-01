import 'package:flutter/material.dart';
import 'package:meals_app/view/page1.dart';

import '../models/meals_models.dart';
import '../services/api.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<Category> categories =[];



  @override
  void initState() {
    super.initState();
    fetchCategories().then((value) {
      setState(() {
        categories = value;
      });
    }).catchError((error) {
      print('Error fetching categories: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Categories',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,),),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: categories == null
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        )
            : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return  Card(
                elevation: 4.0,
                shadowColor: Colors.black26,
                surfaceTintColor: Colors.orange,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Expanded(
                    //child:
                    Image.network(
                      categories[index].strCategoryThumb,
                      fit: BoxFit.cover,
                    ),
                    //),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        categories[index].strCategory,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        categories[index].strCategoryDescription,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              );

          },
        ),
      ),

    );
  }
}
