import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/models/equipments_model.dart';
import 'package:workout_planner/widgets/equipment_card.dart';

class EquipmentDetailsPage extends StatefulWidget {
  final String equipmentTitle;
  final String equipmentDiscription;
  final List<Equipment> equipmentList;
  const EquipmentDetailsPage({
    super.key,
    required this.equipmentTitle,
    required this.equipmentDiscription,
    required this.equipmentList,
  });

  @override
  State<EquipmentDetailsPage> createState() => _EquipmentDetailsPageState();
}

class _EquipmentDetailsPageState extends State<EquipmentDetailsPage> {
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
              widget.equipmentTitle,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: kMainBlackColor,
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.equipmentDiscription,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: kMainBlackColor,
                ),
              ),

              SizedBox(height: 10),

              //Grid
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                ),
                itemCount: widget.equipmentList.length,
                itemBuilder: (context, index) {
                  Equipment equipment = widget.equipmentList[index];
                  return EquipmentCard(
                    equipmentName: equipment.equipmentName,
                    equipmentDescription: equipment.equipmentDescription,
                    equipmentImageUrl: equipment.equipmentImageUrl,
                    noOfMinuites: equipment.noOfMinuites,
                    noOfCalories: equipment.noOfCalories,
                  );
                },
              ),

              // EquipmentCard(
              //   equipmentName: "Dumbbells",
              //   equipmentDescription:
              //       "Dumbbells are highly versatile because they can be used for both upper-body and lower-body workouts. The Workout Planner app includes a library of dumbbell exercises such as bicep curls, shoulder presses, lunges, chest flies, and squats. Each exercise is explained with clear instructions, illustrations, and video demonstrations. ",
              //   equipmentImageUrl: "assets/equipments/dumbbell.png",
              //   noOfMinuites: 10,
              //   noOfCalories: 25,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
