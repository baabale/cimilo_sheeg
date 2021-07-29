import 'package:cimilo_sheeg/widgets/weather_view.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather/weather.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String cityName = '';
  WeatherFactory openWeather =
      WeatherFactory('a2db19caba495fd4db81fc39f35c01ec');
  Weather? weather;

  bool isLoading = false;

  Future<void> getWeather() async {
    setState(() => isLoading = !isLoading);
    try {
      weather = await openWeather.currentWeatherByCityName(cityName);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: Duration(seconds: 10),
        ),
      );
    }
    setState(() => isLoading = !isLoading);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // onChanged: (value) {
                //   cityName = value;
                //   getWeather();
                // },
                onSubmitted: (value) {
                  cityName = value;
                  getWeather();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Country or City Name.',
                ),
              ),
            ),
            Expanded(
              child: weather == null
                  ? Container()
                  : WeatherView(
                      weather: weather!,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
