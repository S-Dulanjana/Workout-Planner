import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/pages/equipment_details_page.dart';
import 'package:workout_planner/pages/exercise_details_page.dart';
import 'package:workout_planner/pages/warmup_details_page.dart';
import 'package:workout_planner/pages/stretching_details_page.dart';
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
                                builder: (context) => WarmupDetailsPage(
                                  warmupTitle: "Warmups",
                                  warmupDiscription:
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

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EquipmentDetailsPage(
                                  equipmentTitle: "Equipment",
                                  equipmentDiscription:
                                      "The Workout Planner mobile application I created includes an important feature called Equipment, which helps users understand and select the tools they need for different exercises. Equipment plays a major role in improving workout performance, safety, and efficiency. This section of the app is designed to guide users in choosing the right fitness equipment based on their workout type, experience level, and available space.",
                                  equipmentList: equipmentList,
                                ),
                              ),
                            );
                          },
                          child: ExerciseCard(
                            title: "Equipment",
                            imageUrl: "assets/equipments/dumbbells2.png",
                            description: "see more...",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExerciseDetailsPage(
                                  exerciseTitle: "Exercises",
                                  exerciseDiscription:
                                      "The Exercise section of the app provides users with a wide variety of workout options—ranging from strength training and cardio to yoga and flexibility exercises. Each workout includes detailed instructions, images, and short video demonstrations to ensure users perform each move correctly and safely. The app also categorizes exercises by body part (such as arms, chest, legs, back, and core) and by goal (like muscle gain, weight loss, or endurance), allowing users to find the most suitable routines for their needs.",
                                  exerciseList: exerciseList,
                                ),
                              ),
                            );
                          },
                          child: ExerciseCard(
                            title: "Exercise",
                            imageUrl: "assets/exercises/dragging.png",
                            description: "see more...",
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StretchingDetailsPage(
                                  stretchingTitle: "Stretching",
                                  stretchingDiscription:
                                      "Stretching helps to increase the range of motion in muscles and joints, reduce muscle stiffness, and improve blood circulation. In the Workout Planner app, users can find various stretching routines designed for different purposes—such as pre-workout dynamic stretches to prepare the body for movement, and post-workout static stretches to relax muscles after intense training. Each stretch includes clear images, step-by-step instructions, and timers to guide users through the correct duration and form.",
                                  exerciseList: exerciseList,
                                ),
                              ),
                            );
                          },
                          child: ExerciseCard(
                            title: "Stretching",
                            imageUrl: "assets/exercises/yoga.png",
                            description: "see more...",
                          ),
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
