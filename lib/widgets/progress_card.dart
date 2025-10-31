import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';

class ProgressCard extends StatefulWidget {
  final double progressValue;
  final int total;

  const ProgressCard({
    super.key,
    required this.progressValue,
    required this.total,
  });

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    int done = (widget.progressValue * widget.total).toInt();

    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [kMainColor, kMainDarkBlue],
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Text(
              "Proteins, Fats & Carbohydrates",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w800,
                color: kMainWiteColor,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTag(done.toString(), "days"),
                _buildTag((widget.total - done).toString(), "days left"),
              ],
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: widget.progressValue,
              backgroundColor: kMainDarkBlue,
              valueColor: AlwaysStoppedAnimation(kMainWiteColor),
              minHeight: 15,
              borderRadius: BorderRadius.circular(100),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  _buildTag(String value, String title) {
    return Row(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: kMainWiteColor,
          ),
        ),
        SizedBox(width: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: kMainWiteColor,
          ),
        ),
      ],
    );
  }
}
