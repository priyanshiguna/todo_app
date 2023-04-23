import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/res/constant/app_strings.dart';

import '../../model/app_to_do_model.dart';
import '../../res/common/app_date_time_container.dart';
import '../../res/common/app_textfeild.dart';

class AddToDoScreen extends StatefulWidget {
  final List<ToDoModel>? toDoList;
  final int? index;
  const AddToDoScreen({
    Key? key,
    this.index,
    this.toDoList,
  }) : super(key: key);

  @override
  State<AddToDoScreen> createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  bool? dateIsSelected = false;
  TimeOfDay selectedTime = TimeOfDay.now();
  bool? timeIsSelected = false;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    debugPrint("picked ---->> $selectedDate");
    debugPrint("picked ---->> $picked");

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateIsSelected = true;
      setState(() {});
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    debugPrint("picked ---->> $selectedTime");
    debugPrint("picked ---->> $picked");

    if (picked != null && picked != selectedTime) {
      selectedTime = picked;
      timeIsSelected = true;
      setState(() {});
    }
  }

  List<ToDoModel> toDoList = [];
  @override
  void initState() {
    // TODO: implement initState
    toDoList = widget.toDoList!;
    if (widget.index != null) {
      titleController.text = toDoList[widget.index!].title!;
      descriptionController.text = toDoList[widget.index!].des!;

      selectedDate = DateFormat('d/M/y').parse(toDoList[widget.index!].date!);
      dateIsSelected = true;

      var hour =
          toDoList[widget.index!].time!.split(" ").first.split(":").first;
      var minute =
          toDoList[widget.index!].time!.split(" ").first.split(":").last;
      selectedTime =
          TimeOfDay(hour: int.parse(hour), minute: int.parse(minute));
      timeIsSelected = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF646FD4),
            Color(0xE0647ED4),
            Color(0xFF99A0E3),
            Color(0xFFFFFFFF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Divider(
              color: Color(0xFFFFFFFF),
              thickness: 5,
              indent: 110,
              endIndent: 110,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const Text(
              AppStrings.taskTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: AppStrings.fontOne,
                  fontSize: 20,
                  color: Color(0xFFFFFFFF)),
            ),
            TextFieldContainer(
              controller: titleController,
              hintText: AppStrings.hintTitle,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const Text(
              AppStrings.dateTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: AppStrings.fontOne,
                  fontSize: 20,
                  color: Color(0xFFFFFFFF)),
            ),
            GestureDetector(
              onTap: () => selectDate(context),
              child: AppDateAndTimeContainer(
                hintText: dateIsSelected!
                    ? DateFormat.yMd().format(selectedDate)
                    : AppStrings.hintDate,
                isData: dateIsSelected!,
                icon: Icons.calendar_today_rounded,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const Text(
              AppStrings.timeTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: AppStrings.fontOne,
                  fontSize: 20,
                  color: Color(0xFFFFFFFF)),
            ),
            GestureDetector(
              onTap: () => selectTime(context),
              child: AppDateAndTimeContainer(
                hintText: timeIsSelected!
                    ? selectedTime.format(context)
                    : AppStrings.hintTime,
                isData: timeIsSelected!,
                icon: Icons.timer,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const Text(
              AppStrings.desTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: AppStrings.fontOne,
                  fontSize: 20,
                  color: Color(0xFFFFFFFF)),
            ),
            TextFieldContainer(
              controller: descriptionController,
              hintText: AppStrings.hintDes,
              maxLines: 5,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.09),
            FloatingActionButton.extended(
              icon: const Icon(Icons.add),
              label: const Text(AppStrings.label,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppStrings.fontOne)),
              onPressed: () {
                if (widget.index != null) {
                  toDoList[widget.index!] = ToDoModel(
                    title: titleController.text,
                    date: DateFormat.yMd().format(selectedDate),
                    time: selectedTime.format(context),
                    des: descriptionController.text,
                  );
                } else {
                  toDoList.add(
                    ToDoModel(
                      title: titleController.text,
                      date: DateFormat.yMd().format(selectedDate),
                      time: selectedTime.format(context),
                      des: descriptionController.text,
                    ),
                  );
                }
                Navigator.pop(context, toDoList);
              },
              splashColor: Colors.white,
              backgroundColor: const Color(0xFF646FD4),
            ),
          ],
        ),
      ),
    );
  }
}
