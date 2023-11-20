import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

final font = "RobotoSlab";

class Weather extends StatefulWidget {
  final String cityname;
  Weather({required this.cityname});

  @override
  State<Weather> createState() => _WeatherState();
}

final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
final apiKey = '2237324bb24d389e7d9f9f4984693697';
var temperature;
var description;
var humidity;
var windspeed;
var max;
var min;
var cl;
var icon;

class _WeatherState extends State<Weather> {
  // @override
  // void initState() {
  //   getCity(widget.cityname);
  //   super.initState();
  // }

  Future<http.Response> getCity(String city) async {
    final response =
        await http.get(Uri.parse('$baseUrl?q=$city&appid=$apiKey'));

    // if (response.statusCode == 200) {
    //   final data = json.decode(response.body);
    //   setState(() {
    //     temperature = (data['main']['temp'] - 273.15 + 5);
    //     description = (data['weather'][0]['description']);
    //     humidity = (data['main']['humidity']);
    //     windspeed = (data['wind']['speed']);
    //     max = (data['coord']['lon']);
    //     min = (data['coord']['lat']);
    //     cl = (data['weather'][0]['main']);
    //     icon = (data['weather'][0]['icon']);
    //   });
    // } else {
    //   throw Exception("Error Occured");
    // }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.cityname,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: font),
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
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
        child: FutureBuilder(
            future: getCity(widget.cityname),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = json.decode(snapshot.data!.body);

                temperature = (data['main']['temp'] - 273.15 + 5);
                description = (data['weather'][0]['description']);
                humidity = (data['main']['humidity']);
                windspeed = (data['wind']['speed']);
                max = (data['coord']['lon']);
                min = (data['coord']['lat']);
                cl = (data['weather'][0]['main']);
                icon = (data['weather'][0]['icon']);

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.cityname + " Weather Details",
                          style: TextStyle(
                              fontFamily: font, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.cloud)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: [
                        Text(
                          "Longitude  :" + max.toString(),
                          style: TextStyle(fontFamily: 'RobotoSlab'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Latitude  :" + min.toString(),
                          style: TextStyle(fontFamily: font),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Image.asset("assets/weather/$icon.png"),
                      ],
                    ),
                    ListTile(
                      subtitle: Container(
                        child: Text(
                          cl.toString(),
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: font,
                              color: Colors.black),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/weather/humidity.png"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Humidity  :" + humidity.toString(),
                          style: TextStyle(
                              fontFamily: font, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset("assets/weather/windspeed.png"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "WindSpeed  :" + windspeed.toString(),
                          style: TextStyle(
                              fontFamily: font, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )

                    // Text(widget.cityname),
                    // Text(temperature != null
                    //     ? '${temperature.toStringAsFixed(2)}'
                    //     : "Not Available"),
                    // Text(description.toString()),
                    // Text(humidity.toString()),
                    // Text("windspeed" + windspeed.toString()),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       getCity(widget.cityname);
                    //     },
                    //     child: Text("Click me"))
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
