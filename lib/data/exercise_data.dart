import 'package:workout_planner/models/exercises_model.dart';

class ExerciseData {
  final List<Exercise> exerciseList = [
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
    Exercise(
      exerciseName: "Jumping Jacks",
      exerciseImageUrl: "assets/exercises/hunch_back.png",
      noOfMinuites: 10,
      completed: false,
      id: 3,
    ),
    Exercise(
      exerciseName: "Crunches",
      exerciseImageUrl: "assets/exercises/treadmill-machine_men.png",
      noOfMinuites: 15,
      id: 4,
      completed: false,
    ),
    Exercise(
      exerciseName: "Lunges",
      exerciseImageUrl: "assets/exercises/treadmill-machine_women.png",
      noOfMinuites: 20,
      id: 5,
      completed: false,
    ),
    Exercise(
      exerciseName: "Burpees",
      exerciseImageUrl: "assets/exercises/triangle.png",
      noOfMinuites: 25,
      id: 6,
      completed: false,
    ),
    Exercise(
      exerciseName: "High Knees",
      exerciseImageUrl: "assets/exercises/weightlifting.png",
      noOfMinuites: 10,
      id: 7,
      completed: false,
    ),
    Exercise(
      exerciseName: "Bicycle Crunches",
      exerciseImageUrl: "assets/exercises/yoga.png",
      noOfMinuites: 20,
      id: 8,
      completed: false,
    ),
    Exercise(
      exerciseName: "Leg Raises",
      exerciseImageUrl: "assets/exercises/triangle.png",
      noOfMinuites: 15,
      id: 9,
      completed: false,
    ),
  ];
}
