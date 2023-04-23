import 'package:flutter/material.dart';

import '../../model/app_to_do_model.dart';
import '../../res/constant/app_strings.dart';
import 'add_todo_screen.dart';

class TodayTaskScreen extends StatefulWidget {
  const TodayTaskScreen({Key? key}) : super(key: key);

  @override
  State<TodayTaskScreen> createState() => _TodayTaskScreenState();
}

class _TodayTaskScreenState extends State<TodayTaskScreen> {
  List<ToDoModel> toDoList = [];
  bool checkBoxData = true;

  List<String> items = [AppStrings.itemOne, AppStrings.itemTwo];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF646FD4),
            Color(0xE0647ED4),
            Color(0xFF99A0E3),
            Color(0xFFFFFFFF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(AppImages.arrowBack)),
          title: const Text(AppStrings.appbarTitle,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppStrings.fontOne,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add),
          label: const Text(AppStrings.buttonLabel,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: AppStrings.fontOne,
              )),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                useSafeArea: true,
                backgroundColor: Colors.transparent,
                builder: (context) => AddToDoScreen(
                      toDoList: toDoList,
                    ));
          },
          splashColor: Colors.white,
          backgroundColor: const Color(0xFF646FD4),
        ),
        body: toDoList.isEmpty
            ? const Center(
                child: Text(
                  AppStrings.suggestion,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppStrings.fontOne),
                ),
              )
            : ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: toDoList.length,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) => Container(
                  height: MediaQuery.of(context).size.height / 9,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                          color: Color(0x400D0D0D),
                          spreadRadius: 0,
                          blurRadius: 14,
                          offset: Offset(2, 6))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              toDoList[index].time!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontFamily: AppStrings.fontTwo,
                                  fontSize: 8,
                                  color: Color(0xFF888888)),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Text(
                              toDoList[index].date!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontFamily: AppStrings.fontTwo,
                                  fontSize: 8,
                                  color: Color(0xFF888888)),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              toDoList[index].title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: AppStrings.fontTwo,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                  color: Color(0xFF363636)),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Text(
                              toDoList[index].des!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontFamily: AppStrings.fontTwo,
                                  fontSize: 10,
                                  color: Color(0x59000000)),
                            ),
                          ],
                        ),
                        const Spacer(),
                        PopupMenuButton<String>(
                          itemBuilder: (context) => items
                              .map((String items) => PopupMenuItem(
                                    value: items,
                                    child: Text(items),
                                  ))
                              .toList(),
                          color: Colors.white,
                          shadowColor: Colors.black54,
                          icon: const Icon(
                            Icons.more_vert_outlined,
                            color: Colors.grey,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          onSelected: (value) {
                            if (value == AppStrings.itemOne) {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                useSafeArea: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => AddToDoScreen(
                                  toDoList: toDoList,
                                  index: index,
                                ),
                              ).then((value) {
                                if (value != null) {
                                  toDoList = value;
                                  setState(() {});
                                }
                              });
                            } else if (value == AppStrings.itemTwo) {
                              toDoList.removeAt(index);
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
