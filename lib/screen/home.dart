import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temp;
  var description;
  var humidity;
  var currently;
  var windSpeed;

  Future getWeather() async {
    var url =
        "http://api.openweathermap.org/data/2.5/weather?q=Lucknow&appid=71fceb2105659e3abc92f56a94e34f90";

    http.Response response = await http.get(url);
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main'][0]['humidity'];
      this.humidity = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue[800],
                    Colors.yellow[700],
                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Currently in Lucknow",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  temp != null ? temp.toString() + "\u00B0" : "Loading",
                  style: TextStyle(
                      color: Colors.purple[200],
                      fontSize: 60.0,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : "Loading",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green[200],
                        ),
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.thermometer,
                              color: Colors.white54,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("Temperature"),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              temp != null
                                  ? temp.toString() + "\u00B0"
                                  : "Loading",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green[200],
                        ),
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.cloud,
                              color: Colors.white54,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("Weather"),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(description != null
                                ? description.toString()
                                : "Loading"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green[200],
                        ),
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.sun,
                              color: Colors.white54,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("Humidity"),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(humidity != null
                                ? humidity.toString()
                                : "Loading")
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green[200],
                        ),
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.wind,
                              color: Colors.white54,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("Wind"),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(windSpeed != null
                                ? windSpeed.toString()
                                : "Loading"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
