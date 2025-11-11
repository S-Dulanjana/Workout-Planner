import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipments_model.dart';
import 'package:workout_planner/models/exercises_model.dart';
import 'package:workout_planner/widgets/profile_card.dart';
import 'package:workout_planner/widgets/progress_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //Date and Time formatter
  final DateFormat formeeter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formeeter.format(now);
    String formattedDay = dayFormat.format(now);

    final userData = user;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$formattedDate $formattedDay",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: kSubTitleColor,
                  ),
                ),

                SizedBox(height: 10),
                Text(
                  "Hello, ${userData.fullName} ",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor,
                  ),
                ),

                SizedBox(height: 10),
                ProgressCard(
                  progressValue: userData.calculateTotalcaloriesBurned(),
                  total: 100,
                ),

                SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // ignore: deprecated_member_use
                    color: kSubTitleColor.withOpacity(0.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Total Minutes Spened : ${userData.calculateTotalMinuitesSpent()}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kMainColor,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Total Exercises Completed : ${userData.totalExercisesCompleted.toString()} ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: kMainBlackColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Total Equipment Handoverd : ${userData.totalEquipmentsHandOvered.toString()} ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: kMainBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Text(
                  "Your Exercises ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: kMainColor,
                  ),
                ),
                SizedBox(height: 10),

                //exercise list of the user
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: userData.exerciseList.length,
                  itemBuilder: (context, index) {
                    Exercise userExercise = userData.exerciseList[index];
                    return ProfileCard(
                      taskName: userExercise.exerciseName,
                      taskImageUrl: userExercise.exerciseImageUrl,
                      markAsDone: () {
                        setState(() {
                          userData.markExerciseAsCompleted(userExercise.id);
                        });
                      },
                    );
                  },
                ),
                SizedBox(height: 10),
                Text(
                  "Your Equipment ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: kMainColor,
                  ),
                ),
                SizedBox(height: 10),

                //equipment list of the user
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: userData.equipmentList.length,
                  itemBuilder: (context, index) {
                    Equipment userEquipment = userData.equipmentList[index];
                    return ProfileCard(
                      taskName: userEquipment.equipmentName,
                      taskImageUrl: userEquipment.equipmentImageUrl,
                      markAsDone: () {
                        setState(() {
                          userData.markAsHandovered(userEquipment.id);
                        });
                      },
                    );
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
