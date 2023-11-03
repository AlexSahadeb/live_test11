
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:live_exam11/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String jsonWeatherData = '''
   [
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3
    }
  ]  
  ''';

  List<Weather> parseWeatherData() {
    final List<dynamic> jsonData = json.decode(jsonWeatherData);
    return jsonData.map((item) {
      return Weather(
        city: item['city'],
        temperature: item['temperature'],
        condition: item['condition'],
        humidity: item['humidity'],
        windSpeed: item['windSpeed'].toDouble(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Weather> weatherData = parseWeatherData();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather Information'),
        ),
        body: ListView.builder(
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            Weather weather = weatherData[index];
            return Card(
              child: ListTile(
                title: Text(weather.city),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Temperature: ${weather.temperature}°C'),
                    Text('Condition: ${weather.condition}'),
                    Text('Humidity: ${weather.humidity}%'),
                    Text('Wind Speed: ${weather.windSpeed} m/s'),
                  ],
                ),
              ),
            );
          },
        ),
    );
  }
}
