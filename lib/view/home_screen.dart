import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nobel_prize_winner_directory_app/view/detail_screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> data1 = [];
  String knownName = '';
  late String motivation;

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    fetchNobelPrizes();
  }

  Future<void> fetchNobelPrizes() async {
    try {
      final response = await http.get(
        Uri.parse("https://irfangul92.github.io/index.json"),
      );

      if (response.statusCode == 200) {
        setState(() {
          var data = jsonDecode(response.body.toString());
          data1 = data["nobelPrizes"];
        });
      } else {
        // Handle HTTP error
        print("Error: ${response.statusCode}");
        // You might want to display an error message to the user
      }
    } catch (e) {
      // Handle other errors such as network issues
      print("Error: $e");
      // You might want to display an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Container(
          width: 120,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Text(
            'Nobel Prizes',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Flexible(
              fit: FlexFit.loose,
              child: data1.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data1.length,
                itemBuilder: (context, index) {
                  // Access the 'laureates' list for the current Nobel Prize entry
                  List<dynamic> laureates = data1[index]["laureates"];

                  // Create a list of ListTile widgets for each laureate
                  List<Widget> laureateListTiles = [];

                  for (var laureate in laureates) {
                    knownName = laureate["knownName"];
                    motivation = laureate["motivation"];
                    // Add a ListTile for each laureate
                    laureateListTiles.add(
                      ListTile(
                        title: Text(knownName),
                        subtitle: Text(motivation),
                      ),
                    );
                  }

                  return InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            awardYear: data1[index]["awardYear"],
                            category: data1[index]["category"],
                            categoryFullName: data1[index]["categoryFullName"],
                            dateAwarded: data1[index]["dateAwarded"],
                            name: knownName,
                            prizeAmount: data1[index]["prizeAmount"],
                            prizeAmountAdjusted: data1[index]["prizeAmountAdjusted"],
                            motivation: motivation,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.blue),
                                Text(
                                  data1[index]["awardYear"].toString(),
                                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data1[index]["categoryFullName"],
                                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                              "Awarded Date: ${data1[index]["dateAwarded"]}",
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          // Display the laureates list for the current Nobel Prize entry
                          Column(children: laureateListTiles),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
