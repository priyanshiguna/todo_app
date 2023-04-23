import 'package:flutter/material.dart';

import '../../res/common/app_container.dart';
import '../../res/constant/app_strings.dart';
import '../add_to_do/today_task_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppImages.drawer),
                  const Text(
                    AppStrings.logoTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: AppStrings.fontOne,
                        fontSize: 20,
                        color: Color(0xFFFFFFFF)),
                  ),
                  Image.asset(AppImages.profileImage, width: 50, height: 50),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: AppStrings.you,
                        style: TextStyle(
                          fontFamily: AppStrings.fontOne,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    TextSpan(
                        text: AppStrings.tasks,
                        style: TextStyle(
                            fontFamily: AppStrings.fontOne,
                            color: Color(0xFFFFFFFF),
                            fontSize: 26,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: AppStrings.today,
                        style: TextStyle(
                            fontFamily: AppStrings.fontOne,
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const Text(
                AppStrings.time,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: AppStrings.fontOne,
                    fontSize: 14,
                    color: Color(0xFF363636)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color(0x400D0D0D),
                        spreadRadius: 0,
                        blurRadius: 14,
                        offset: Offset(2, 6))
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    Image.asset(AppImages.search),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    const Text(
                      AppStrings.search,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: AppStrings.fontTwo,
                          fontSize: 16,
                          color: Color(0xFF888888)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TodayTaskScreen(),
                          ));
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        const BorderSide(
                          color: Color(0xFF646FD4),
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    child: const Text(
                      AppStrings.buttonOne,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: AppStrings.fontOne,
                          fontSize: 16,
                          color: Color(0xFF7D7D7D)),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        const BorderSide(
                          color: Color(0xFF646FD4),
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    child: const Text(
                      AppStrings.buttonTwo,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: AppStrings.fontOne,
                          fontSize: 16,
                          color: Color(0xFF7D7D7D)),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        const BorderSide(
                          color: Color(0xFF646FD4),
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    child: const Text(
                      AppStrings.buttonThree,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: AppStrings.fontOne,
                          fontSize: 16,
                          color: Color(0xFF7D7D7D)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  AppContainer(
                    color: Color(0xFF2A8899),
                    image: AppImages.school,
                    text: AppStrings.school5,
                    titleText: AppStrings.school,
                  ),
                  AppContainer(
                    color: Color(0xFF5EB0D2),
                    image: AppImages.work,
                    text: AppStrings.work3,
                    titleText: AppStrings.work,
                  ),
                  AppContainer(
                    color: Color(0xFFBE8972),
                    image: AppImages.shop,
                    text: AppStrings.shop12,
                    titleText: AppStrings.shop,
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const AppContainer(
                    color: Color(0xFF646FD4),
                    image: AppImages.read,
                    text: AppStrings.read2,
                    titleText: AppStrings.read,
                  ),
                  const AppContainer(
                    color: Color(0xFF83BC74),
                    image: AppImages.workout,
                    text: AppStrings.workout3,
                    titleText: AppStrings.workout,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 3.5,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: const Color(0xFFD25EB0)),
                    ),
                    child: Image.asset(AppImages.addMore),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
