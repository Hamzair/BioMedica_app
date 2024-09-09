
import 'package:bio_medica/main.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'course_details.dart';


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
              decoration: BoxDecoration(color:Color(0xFF001A2E),borderRadius: BorderRadius.circular(50)),
              child:  Icon(Icons.menu,color: buttonColor2,)),
        ),
        title: CustomText(text: 'Courses', textColor:Color(0xFF001A2E) , fontWeight: FontWeight.bold,),
        actions: [],
      ),
      body: Column(
        children: [
          ClipRRect(

            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            child: Container(
              height: 70,
              color: secondaryColor,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 38.h,
                        width: 249.w,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search for anything',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Image.asset('assets/images/search.png'),
                            filled: true,
                            fillColor: Color(0xFF001A2E),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 0.96,
                                  color:Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  SizedBox(
                    height: 38.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        backgroundColor: Color(0xFF001A2E),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CourseDetailScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Card(
          color: primaryColor.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                          image: DecorationImage(
                            image: AssetImage('assets/images/c2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                          text:  'UX Research in Digital Product Design: Master Class',
                          fontWeight: FontWeight.bold,  textColor:  Colors.white),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


