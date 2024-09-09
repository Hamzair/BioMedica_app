import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';




class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primaryColor,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(192, 208, 221, 1),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(50)),
              child:  Icon(Icons.menu,color: buttonColor2,)),
        ),
        title: CustomText(text: 'Courses', textColor: primaryColor, fontWeight: FontWeight.bold,),
        actions: [],
      ),
      body: Column(
        children: [
          Container(
            height: 90,
            color: secondaryColor,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for anything',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon:Image.asset('assets/images/search.png'),
                        filled: true,
                        fillColor: primaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),

                      backgroundColor: primaryColor,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.tune,color: Colors.white,size: 25,),
                        SizedBox(width: 10),
                        Text("Filter",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10,)
              ],
            ),
          ),
          SizedBox(height: 20),
          // Course Grid
          Expanded(
            child: GridView.builder(
              itemCount: 4, // Number of courses
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return CourseCard();
              },
            ),
          ),
        ],
      ),

    );
  }
}

class CourseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        color: Color.fromRGBO(0, 28, 49, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        image: DecorationImage(
                          image: AssetImage('assets/images/c1.png'), // Replace with actual image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'UX Research in Digital Product Design: Master Class',
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),

                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'UX Design',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
