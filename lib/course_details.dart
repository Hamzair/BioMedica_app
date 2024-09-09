import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';



class CourseDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          // Course Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            child: Image.asset(
              'assets/images/rectangle.png', // Replace with actual image
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                children: [
                  // Course Category and Title
                  CustomText(
                    text: '• UX Design',
                     textColor:  buttonColor2, fontsize: 16,fontWeight: FontWeight.bold),
                  
                  SizedBox(height: 8),
                  CustomText(
                    text: 'Master Digital Product Design: UX Research & UI Design',
                     textColor: Colors.white, fontWeight: FontWeight.w400,fontsize: 22,
                  ),
                  SizedBox(height: 20),


                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.cyan,
                        ),
                        child: Text('About',style: TextStyle(color: Colors.white),),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text('Lessons', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Course Description
                  CustomText(
                    text: 'Transformative journey through our comprehensive course, '
                        '‘Master Digital Product Design: UX Research & UI Design’. Created especially for budding UX/UI designers, '
                        'this immersive program invites you to explore the intricate art of crafting exceptional digital experiences....',
                    fontWeight: FontWeight.w400, textColor: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Read more',
                    style: TextStyle(color: Colors.cyan),
                  ),
                  SizedBox(height: 20),

                  // Key Points
                  Text('Key points', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.cyan),
                    title: Text('Critical Thinking', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.cyan),
                    title: Text('User Experience Research', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.cyan),
                    title: Text('User Interface Design', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.cyan),
                    title: Text('Usability Testing', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle start course action
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
            backgroundColor: Colors.cyan,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            'Start Now',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
