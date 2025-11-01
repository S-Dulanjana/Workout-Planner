import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/models/exercises_model.dart';
import 'package:workout_planner/widgets/exercise_card.dart';

class WarmupDetailsPage extends StatefulWidget {
  final String warmupTitle;
  final String warmupDiscription;
  final List<Exercise> exerciseList;
  const WarmupDetailsPage({
    super.key,
    required this.warmupTitle,
    required this.warmupDiscription,
    required this.exerciseList,
  });

  @override
  State<WarmupDetailsPage> createState() => _WarmupDetailsPageState();
}

class _WarmupDetailsPageState extends State<WarmupDetailsPage> {
  //Date and Time formatter
  final DateFormat formeeter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formeeter.format(now);
    String formattedDay = dayFormat.format(now);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$formattedDate  $formattedDay",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: kSubTitleColor,
              ),
            ),
            Text(
              widget.warmupTitle,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: kMainBlackColor,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Text(
                widget.warmupDiscription,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: kMainBlackColor,
                ),
              ),

              SizedBox(height: 10),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                ),
                itemCount: widget.exerciseList.length,
                itemBuilder: (context, index) {
                  Exercise exercise = widget.exerciseList[index];

                  return ExerciseCard(
                    title: exercise.exerciseName,
                    imageUrl: exercise.exerciseImageUrl,
                    description: "${exercise.noOfMinuites} mins of workout",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
