import 'package:flutter/material.dart';
import '../../configs/themes/app_colors.dart';
import '../../models/book_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<BookModel> mainBookList = [
    BookModel(
        "To Kill a Mockingbird",
        1960,
        "https://images.unsplash.com/photo-1589998059171-988d887df646?q=80&w=876&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        4.27),
    BookModel(
        "1984",
        1949,
        "https://images.unsplash.com/photo-1589998059171-988d887df646?q=80&w=876&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        4.67),
  ];

  List<BookModel> displayList = List.from(mainBookList);
  bool isLoading = false;

  void updateList(String value) {
    setState(() {
      isLoading = true;
      displayList = mainBookList
          .where((element) =>
          element.book_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
      isLoading = false;
    });
  }

  void clearSearch() {
    setState(() {
      displayList = List.from(mainBookList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a Book",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) => updateList(value),
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                  hintText: "eg: Flutter",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                  prefixIcon: Icon(Icons.search, color: Colors.purple),

                ),
              ),
            ),
            SizedBox(height: 20),
            isLoading
                ? Center(child: CircularProgressIndicator(color: Colors.white))
                : Expanded(
              child: displayList.isEmpty
                  ? Center(
                child: Text(
                  "No Result Found",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
                  : ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text(
                    displayList[index].book_title!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${displayList[index].book_release_date!}',
                    style: TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                  trailing: Text(
                    "${displayList[index].rating}",
                    style: TextStyle(color: Colors.amber),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      displayList[index].book_poster_url!,
                      width: 60,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
