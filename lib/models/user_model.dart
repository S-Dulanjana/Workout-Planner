import 'package:workout_planner/models/equipments_model.dart';
import 'package:workout_planner/models/exercises_model.dart';

class User {
  final String fullName;
  final String userId;
  final String gender;
  final String address;
  final int age;
  final String description;
  int totalExercisesCompleted = 0;
  int totalEquipmentsHandOvered = 0;

  final List<Exercise> exerciseList;
  final List<Equipment> equipmentList;

  final List<Exercise> favouriteExerciseList;
  final List<Equipment> favouriteEquipmentList;

  User({
    required this.fullName,
    required this.userId,
    required this.gender,
    required this.address,
    required this.age,
    required this.description,
    required this.exerciseList,
    required this.equipmentList,
    required this.favouriteExerciseList,
    required this.favouriteEquipmentList,
  });

  //methodes

  //methode to add new exercise to the list
  void addExercise(Exercise exercise) {
    exerciseList.add(exercise);
  }

  //method to remove the exercise fromm the exxrcise list
  void removeExercise(Exercise exercise) {
    exerciseList.remove(exercise);
  }

  //method for add favourite
  void addFavourite(Exercise exercise) {
    favouriteExerciseList.add(exercise);
  }

  //method for remove from favourite
  void removeFavourite(Exercise exercise) {
    favouriteExerciseList.remove(exercise);
  }
}
