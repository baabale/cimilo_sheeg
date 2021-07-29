import 'package:cached_network_image/cached_network_image.dart';
import 'package:cimilo_sheeg/screens/search.dart';
import 'package:cimilo_sheeg/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather/weather.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherFactory openWeather =
      WeatherFactory('a2db19caba495fd4db81fc39f35c01ec');

  Weather? weather;

  bool isLoading = false;

  Future<Position> getMyLocation() async =>
      await Geolocator.getCurrentPosition();

  Future<void> getWeather() async {
    setState(() => isLoading = !isLoading);
    Position position = await getMyLocation();
    weather = await openWeather.currentWeatherByLocation(
        position.latitude, position.longitude);

    setState(() => isLoading = !isLoading);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => getWeather(),
            icon: Icon(Icons.pin_drop_outlined),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SearchScreen(),
              ),
            ),
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                'https://i.pinimg.com/originals/7e/b6/6d/7eb66d739c10bc4b32fc8fd45628901f.png',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8),
                BlendMode.darken,
              ),
            ),
          ),
          child: weather == null
              ? WelcomeView()
              : WeatherView(
                  weather: weather!,
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('CimiloSheeg'),
                content: Text(
                  'CimiloSheeg waa Application loogu talogalay in uu kuu sheego Cimilada meelweliba aad joogto.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Ok, got it!'),
                  )
                ],
              );
            },
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.info_outline),
      ),
    );
  }
}
