import 'package:flutter/material.dart';

MaterialColor getWeatherColor(String? dayCondition) {
  if (dayCondition == null) {
    return Colors.teal; // Default color when condition is null
  }

  switch (dayCondition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case "Partly Cloudy ":
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
    case 'Cloudy ':
    case 'Overcast ':
      return Colors.grey;

    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Light rain':
    case 'Patchy light rain':
    case 'Light rain shower':
    case "Patchy rain nearby":
      return Colors.lightBlue;

    case 'Moderate rain':
    case 'Torrential rain shower':
    case 'Moderate or heavy rain shower':
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case "Light freezing rain":
      return Colors.blue;

    case 'Patchy snow possible':
  
    case 'Patchy light snow':
    case 'Light snow showers':
      return Colors.cyan;

    case 'Moderate snow':
      case 'Light snow':
    case 'Heavy snow':
    case 'Blizzard':
    case 'Heavy rain':
    case 'Moderate or heavy snow showers':
      return Colors.indigo;

    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;

    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return Colors.teal;

    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.purple;

    default:
      return Colors.teal; // Default color for unknown conditions
  }
}
