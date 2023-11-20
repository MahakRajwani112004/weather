import 'package:flutter/material.dart';

import 'package:flutter_application_1/weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var _name = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(
            //   height: 40,
            // ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  Text(
                    "Current Location!!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    // color: Color(0xFF6EB2BE),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 199, 239, 251),
                      Color.fromARGB(255, 64, 198, 243),
                      Color.fromARGB(255, 0, 182, 243),
                    ], stops: [
                      0.2,
                      0.6,
                      0.5
                    ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: _name,
                          decoration: InputDecoration(
                            hintText: "Enter city or Location",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            suffixIcon: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Weather(cityname: _name.text)));
                              },
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "November 20 2023",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                            Text(
                              "11:09 PM",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 76, 76, 76)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Temparature 23°",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 255, 246, 246)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "23°",
                                  style: TextStyle(
                                    fontSize: 100,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 255, 246, 246),
                                  ),
                                ),
                                Text(
                                  "Search for The Others Detail",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 255, 246, 246),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/weather/02d.png',
                                  height: 100,
                                  width: 100,
                                ),
                                Text(
                                  "Sunny",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 255, 246, 246),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: Container(
                    height: 20,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '${23 - index}°',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
