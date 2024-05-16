import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:frrrrrtime/widgets/common/backgroung_decoration.dart';

class CourseDetailPage extends StatelessWidget {
  final Map<String, dynamic> val;
  static const String routeName = "/course";

  CourseDetailPage({Key? key, required this.val}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = val["title"];
    late String path;

    if (title == 'Physics') {
      path = 'assets/material/cours.pdf';
    } else if (title == 'Web Development') {
      path = 'assets/material/cours3.pdf';
    } else if (title == 'Principles of Programming') {
      path = 'assets/material/cours.pdf';
    } else if (title == 'Chemistry') {
      path = 'assets/material/cours.pdf';
    } else if (title == 'Biology') {
      path = 'assets/material/cours.pdf';
    } else {
      path = 'assets/material/default.pdf';
    }

    return Scaffold(
      body: BackgoundDecoration(
        child: Column(
          children: [
            SizedBox(height: 88),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      SizedBox(height: 24),
                      _buildCourseMaterial(context, path),
                      SizedBox(height: 24),
                      _buildTeacherSection(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: val["color"],
            borderRadius: BorderRadius.circular(24),
            image: DecorationImage(
              image: NetworkImage(
                "https://github.com/flutterbytes/flutter_glassmorphism/blob/master/up.png?raw=true",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                val["title"],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              // Additional details here if needed
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCourseMaterial(BuildContext context, String path) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 16,
          ),
        ],
      ),
      child: InkWell(
        onTap: () => _openPDF(context, path),
        child: Center(
          child: Text(
            'Open Course Material (${_getFileName(path)})',
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeacherSection() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        children: [
          Hero(
            tag: val["image"],
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(val["image"]),
            ),
          ),
          SizedBox(width: 24),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                val["teacher"],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              // Additional details here if needed
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }

  String _getFileName(String path) {
    List<String> parts = path.split('/');
    return parts.last;
  }

  void _openPDF(BuildContext context, String path) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFScreen(path: path),
      ),
    );
  }
}

class PDFScreen extends StatelessWidget {
  final String path;

  PDFScreen({required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFView(
        filePath: path,
        autoSpacing: true,
        enableSwipe: true,
        pageSnap: true,
        swipeHorizontal: true,
        nightMode: false,
        onError: (error) {
          print(error.toString());
        },
        onRender: (_pages) {
          print("Total pages: $_pages");
        },
        onViewCreated: (PDFViewController pdfViewController) {
          print('PDF View created');
        },
        onPageChanged: (int? page, int? total) {
          print('page change: $page/$total');
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
      ),
    );
  }
}
