import 'package:workout_planner/models/equipments_model.dart';
import 'package:workout_planner/models/exercises_model.dart';
import 'package:workout_planner/models/user_model.dart';

User user = User(
  fullName: "Kamal perera",
  userId: "ABC123",
  gender: "Male",
  address: "No123, Anuradhapura",
  age: 25,
  description: "description",
  exerciseList: [
    Exercise(
      exerciseName: "Push-ups",
      exerciseImageUrl: "assets/exercises/cobra.png",
      noOfMinuites: 15,
      id: 0,
      completed: false,
    ),
    Exercise(
      exerciseName: "Squats",
      exerciseImageUrl: "assets/exercises/downward-facing.png",
      noOfMinuites: 20,
      id: 1,
      completed: false,
    ),
    Exercise(
      exerciseName: "Plank",
      exerciseImageUrl: "assets/exercises/dragging.png",
      noOfMinuites: 30,
      id: 2,
      completed: false,
    ),
  ],
  equipmentList: [
    Equipment(
      id: 0,
      equipmentName: "Dumbbells",
      equipmentDescription:
          "A pair of dumbbells for strength training exercises.",
      equipmentImageUrl: "assets/equipments/calendar.png",
      noOfMinuites: 30,
      noOfCalories: 2,
      handOvered: false,
    ),
    Equipment(
      id: 1,
      equipmentName: "Resistance Bands",
      equipmentDescription: "Elastic bands used for resistance exercises.",
      equipmentImageUrl: "assets/equipments/checklist.png",
      noOfMinuites: 20,
      handOvered: false,
      noOfCalories: 15,
    ),
  ],

  favouriteExerciseList: [
    Exercise(
      exerciseName: "Push-ups",
      exerciseImageUrl: "assets/exercises/cobra.png",
      noOfMinuites: 15,
      id: 0,
      completed: false,
    ),
    Exercise(
      exerciseName: "Plank",
      exerciseImageUrl: "assets/exercises/dragging.png",
      noOfMinuites: 30,
      id: 2,
      completed: false,
    ),
  ],

  favouriteEquipmentList: [
    Equipment(
      id: 1,
      equipmentName: "Resistance Bands",
      equipmentDescription:
          "Resistance bands provide constant tension on the muscles during movement, which helps enhance both strength and stability. The Workout Planner app includes multiple resistance band exercises such as banded squats, lateral walks, bicep curls, tricep extensions, and shoulder raises.",
      equipmentImageUrl: "assets/equipments/checklist.png",
      noOfMinuites: 20,
      handOvered: false,
      noOfCalories: 15,
    ),
    Equipment(
      id: 0,
      equipmentName: "Dumbbells",
      equipmentDescription:
          "Dumbbells are highly versatile because they can be used for both upper-body and lower-body workouts. The Workout Planner app includes a library of dumbbell exercises such as bicep curls, shoulder presses, lunges, chest flies, and squats. Each exercise is explained with clear instructions, illustrations, and video demonstrations.",
      equipmentImageUrl: "assets/equipments/calendar.png",
      noOfMinuites: 30,
      noOfCalories: 2,
      handOvered: false,
    ),
  ],
);
