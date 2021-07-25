import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void getMyLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
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
            onPressed: () => getMyLocation(),
            icon: Icon(Icons.pin_drop_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://i.pinimg.com/originals/7e/b6/6d/7eb66d739c10bc4b32fc8fd45628901f.png',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Mogadishu, SO',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w300,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: '\nUpdated: 20:19 EAT, 25/7/2021',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: '\n\n20.9',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: '°C',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    TextSpan(
                      text: '\nLight Rain',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w300,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh),
              ),
            ],
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

class WelcomeView extends StatelessWidget {
  const WelcomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Kusoo dhawaaw ',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w200,
                height: 1.5,
              ),
              children: [
                TextSpan(
                  text: '\nCimiloSheeg App⛅',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
