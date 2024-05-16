import 'package:flutter/material.dart';
import 'package:frrrrrtime/styles.dart';

class CourseCard extends StatelessWidget {
  final bool isTask;
  final Color color;
  final String teacher;
  final String title;
  final String image;
  final String? description;
  final String? startTime;
  final String? endTime;
  final String? date;
  final double titleFontSize;

  const CourseCard({
    Key? key,
    required this.isTask,
    required this.color,
    required this.teacher,
    required this.title,
    required this.image,
    this.description,
    this.startTime,
    this.endTime,
    this.date,
    this.titleFontSize = 22, // Increase the font size for the title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Increased width for the card
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 3.0, color: Colors.white),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: cardNameTextStyle.copyWith(fontSize: titleFontSize),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Teacher: $teacher",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 18, // Increase font size for teacher name
                    ),
                  ),
                  if (isTask)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          description ?? '',
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
                              startTime ?? '',
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
                              endTime ?? '',
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
                              date ?? '',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}