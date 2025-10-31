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
}
