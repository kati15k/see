import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:frrrrrtime/configs/themes/app_colors.dart';
import 'package:frrrrrtime/widgets/courses/course_card.dart';
import 'package:frrrrrtime/screens/course/constants.dart';
import 'package:frrrrrtime/screens/course/course_detail.dart';
import 'package:get/get.dart';

import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/tasks/task_controller.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../models/task.dart';
import '../../widgets/app_circle_button.dart';
import '../../widgets/app_icons.dart';
import '../../widgets/content_area.dart';
import '../home/menu_screen.dart';

class CourseHomePage extends GetView<MyZoomDrawerController> {
  static const String routeName = "/course";

  final _taskController = Get.put(TaskController());

  CourseHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(
        builder: (_) {
          return ZoomDrawer(
            borderRadius: 50.0,
            controller: _.zoomDrawerController,
            showShadow: true,
            angle: 0.0,
            style: DrawerStyle.DefaultStyle,
            backgroundColor: Colors.white.withOpacity(0.5),
            slideWidth: MediaQuery.of(context).size.width * 0.5,
            menuScreen: const MenuScreen(),
            mainScreen: Container(
              decoration: BoxDecoration(
                gradient: mainGradient(),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(mobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppCircleButton(
                            onTap: controller.toogleDraw,
                            width: 10,
                            child: const Icon(AppIcons.menuleft),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          const Text(
                            "Courses Available",
                            style: headerText,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: topCoursesList.map((e) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => CourseDetailPage(val: e, key: null,),
                                  ),
                                ),
                                child: SizedBox(
                                  width: 250, // Adjust card width as needed
                                  child: CourseCard(
                                    color: e["color"] as Color,
                                    teacher: e["teacher"] as String,
                                    title: e["title"] as String,
                                    image: e["image"] as String,
                                    titleFontSize: 15,
                                    isTask: false,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<Task>>(
                        stream: _taskController.displayAllTasks(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }

                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }

                          List<Task> tasks = snapshot.data ?? [];

                          if (tasks.isEmpty) {
                            return const Text('No tasks found.');
                          }

                          return ListView.builder(
                            itemCount: tasks.length,
                            itemBuilder: (context, index) {
                              Task task = tasks[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                child: Card(
                                  color: Colors.white30.withOpacity(0.7),
                                  child: ListTile(
                                    title: Text(
                                      task.title ?? '',
                                      style:  TextStyle(
                                        color: Colors.lightBlue.withOpacity(0.8),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          task.description ?? '',
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.access_time,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              task.startTime ?? '',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              '-',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              task.endTime ?? '',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Icon(
                                              Icons.calendar_today,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              task.date ?? '',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {
                                        _taskController.deleteTask(task);
                                      },
                                      icon: const Icon(Icons.delete, color: Colors.black),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}






/*
BackgoundDecoration(
        child: Container(
          alignment: Alignment.center,

          child: Column(
            children: [
              Container(
                height: 128,
                margin: const EdgeInsets.only(top: 16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 32,
                    ),

                    SizedBox(
                      width: 16,
                    ),

                  ],
                ),
              ),
              Expanded(
                child: BackgoundDecoration(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.topLeft,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(48),
                          topRight: Radius.circular(48),
                        )),
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.only(top: 32, left: 32),
                            child: Text(
                              "Available Courses",
                              style: titleTextStyle,
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 232,
                            margin: const EdgeInsets.only(top: 16),
                            child: PageView(
                              controller: PageController(viewportFraction: 0.8,initialPage: 2),
                              children:topCoursesList.map((e) {
                                return GestureDetector(
                                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (ctx)=>CourseDetailPage(val: e,))),
                                  child: CourseCard(
                                    color: e["color"] as Color ,
                                    teacher: e["teacher"] as String,
                                    title: e["title"] as String,
                                    image: e["image"] as String,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
 */