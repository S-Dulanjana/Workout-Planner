import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const ExerciseCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // ignore: deprecated_member_use
        color: kSubTitleColor.withOpacity(0.1),
        boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 5))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kMainBlackColor,
              ),
            ),

            SizedBox(height: 10),

            Image.asset(imageUrl, width: 100, height: 80),

            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kMainBlackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
