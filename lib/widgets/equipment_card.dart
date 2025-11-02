import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';

class EquipmentCard extends StatelessWidget {
  final String equipmentName;
  final String equipmentDescription;
  final String equipmentImageUrl;
  final int noOfMinuites;
  final double noOfCalories;
  const EquipmentCard({
    super.key,
    required this.equipmentName,
    required this.equipmentDescription,
    required this.equipmentImageUrl,
    required this.noOfMinuites,
    required this.noOfCalories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: kSubTitleColor.withOpacity(0.1),
        boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 5))],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              equipmentName,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: kMainBlackColor,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Image.asset(equipmentImageUrl, fit: BoxFit.cover, width: 100),
                SizedBox(width: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${noOfMinuites.toString()} mins of workout",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: kMainColor,
                      ),
                    ),
                    Text(
                      "${noOfCalories.toString()} Calories will burn",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: kMainColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),

            Text(
              equipmentDescription,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
