import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/exercises_model.dart';
import 'package:workout_planner/widgets/add_exercise_card.dart';

class AddNew extends StatefulWidget {
  const AddNew({super.key});

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  //import the user from user data
  final userData = user;

  // xexercise list
  final exerciseList = ExerciseData().exerciseList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello , ${userData.fullName}",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Lets Add Some Workouts and Equipment for today!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: kMainColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "All Exercises",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kMainBlackColor,
                  ),
                ),

                SizedBox(height: 10),

                // list view to scroll horizontally
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.31,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: exerciseList.length,
                    itemBuilder: (context, index) {
                      Exercise exercise = exerciseList[index];
                      return AddExerciseCard(
                        exerciseTitle: exercise.exerciseName,
                        imageUrl: exercise.exerciseImageUrl,
                        noOFMinuites: exercise.noOfMinuites,
                        isAdded: userData.exerciseList.contains(exercise),
                        toggleAddExercise: () {
                          setState(() {
                            if (userData.exerciseList.contains(exercise)) {
                              userData.removeExercise(exercise);
                            } else {
                              userData.addExercise(exercise);
                            }
                            ;
                          });
                        },
                        isFav: userData.favouriteExerciseList.contains(
                          exercise,
                        ),
                        toggleAddFavouriteExercise: () {
                          setState(() {
                            if (userData.favouriteExerciseList.contains(
                              exercise,
                            )) {
                              userData.removeFavourite(exercise);
                            } else {
                              userData.addFavourite(exercise);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),

                SizedBox(height: 10),
                Text(
                  "All Equipment",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kMainBlackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
