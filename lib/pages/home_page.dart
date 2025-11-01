import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/pages/exercise_details_page.dart';
import 'package:workout_planner/widgets/exercise_card.dart';
import 'package:workout_planner/widgets/progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Date and Time formatter
  final DateFormat formeeter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  //User data
  final userData = user;

  //exercise and equipment data
  final exerciseList = ExerciseData().exerciseList;
  final equipmentList = EquipmentData().equipmentList;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formeeter.format(now);
    String formattedDay = dayFormat.format(now);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
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
                  "Hello ${userData.fullName}",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor,
                  ),
                ),

                SizedBox(height: 10),

                ProgressCard(progressValue: 0.7, total: 100),

                SizedBox(height: 10),

                Text(
                  "Today’s Activity",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExerciseDetailsPage(
                                  exerciseTitle: "Warmups",
                                  exerciseDiscription:
                                      "In the field of fitness and exercise, warmups play a vital role in preparing the body and mind for physical activity. The Workout Planner mobile application I created includes a dedicated section for Warmups, designed to help users begin their workouts safely and effectively. This feature ensures that users understand the importance of warming up and can easily follow guided routines before their main exercises.",
                                  exerciseList: exerciseList,
                                ),
                              ),
                            );
                          },
                          child: ExerciseCard(
                            title: "Warmup",
                            imageUrl: "assets/exercises/cobra.png",
                            description: "see more...",
                          ),
                        ),

                        ExerciseCard(
                          title: "Equipment",
                          imageUrl: "assets/equipments/dumbbells2.png",
                          description: "see more...",
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ExerciseCard(
                          title: "Exercise",
                          imageUrl: "assets/exercises/dragging.png",
                          description: "see more...",
                        ),

                        ExerciseCard(
                          title: "Stretching",
                          imageUrl: "assets/exercises/yoga.png",
                          description: "see more...",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
