import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQ'S"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Frequently Asked Questions", style: TextStyle(fontSize: 24),),
            SizedBox(height: 20,),
            Text("Upload & Share", style: TextStyle(fontSize: 20, color: Colors.grey[600], fontWeight: FontWeight.bold),),
            ExpansionTile(
                title: Text("Question 1 ?"),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Answer to Question 1'),
                  ),
                ],
            ),
            Container(width: double.infinity, height: 1, color: Colors.grey,),
            ExpansionTile(
              title: Text("Question 2 ?"),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Answer to Question 2'),
                ),
              ],
            ),
            Container(width: double.infinity, height: 1, color: Colors.grey,),
            ExpansionTile(
              title: Text("Question 3 ?"),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Answer to Question 3'),
                ),
              ],
            ),
            Container(width: double.infinity, height: 1, color: Colors.grey,),
          ],
        ),
      ),
    );
  }
}
