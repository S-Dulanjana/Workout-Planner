import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipments_model.dart';
import 'package:workout_planner/models/exercises_model.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  //Date and Time formatter
  final DateFormat formeeter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  //
  final userData = user;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formeeter.format(now);
    String formattedDay = dayFormat.format(now);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${formattedDate} ${formattedDay}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: kSubTitleColor,
                  ),
                ),

                Row(
                  children: [
                    Text(
                      "Hello, ${userData.fullName} ",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: kMainBlackColor,
                      ),
                    ),

                    Icon(Icons.favorite, size: 45, color: kMainLightPinkColor),
                  ],
                ),

                SizedBox(height: 10),

                Text(
                  "Here are all your favorited Exercise",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: kMainColor,
                  ),
                ),

                SizedBox(height: 20),

                //Exercise Grid view
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding,
                    childAspectRatio: 2 / 2,
                  ),
                  itemCount: userData.favouriteExerciseList.length,
                  itemBuilder: (context, index) {
                    Exercise favExercise =
                        userData.favouriteExerciseList[index];

                    return Card(
                      // ignore: deprecated_member_use
                      color: kSubTitleColor.withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Column(
                          children: [
                            Text(
                              favExercise.exerciseName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Image.asset(
                              favExercise.exerciseImageUrl,
                              width: 100,
                              fit: BoxFit.cover,
                            ),

                            SizedBox(height: 10),
                            Text(
                              "${favExercise.noOfMinuites.toString()} mins of workout",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: kMainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: 50),

                Text(
                  "Here are all your favorited Equipments",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: kMainColor,
                  ),
                ),

                SizedBox(height: 20),

                //Exercise Grid view
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding,
                    childAspectRatio: 19 / 50,
                  ),
                  itemCount: userData.favouriteEquipmentList.length,
                  itemBuilder: (context, index) {
                    Equipment favEquipment =
                        userData.favouriteEquipmentList[index];

                    return Card(
                      // ignore: deprecated_member_use
                      color: kSubTitleColor.withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Column(
                          children: [
                            Text(
                              favEquipment.equipmentName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Image.asset(
                              favEquipment.equipmentImageUrl,
                              width: 100,
                              fit: BoxFit.cover,
                            ),

                            SizedBox(height: 10),
                            Text(
                              "${favEquipment.noOfMinuites.toString()} mins of workout",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: kMainColor,
                              ),
                            ),

                            SizedBox(height: 10),
                            Text(
                              favEquipment.equipmentDescription,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                // ignore: deprecated_member_use
                                color: kMainBlackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
