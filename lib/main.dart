import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  final AudioPlayer player = AudioPlayer();

  void playSound(String soundFileName) async {
    print('Playing sound: $soundFileName'); // Debugging statement
    await player.play(AssetSource(soundFileName)); // Play sound from assets
  }

  Expanded buildKey({required Color color, required String soundFile}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: color, // Set background color
        ),
        onPressed: () {
          playSound(soundFile); // Play corresponding sound file
        },
        child: Container(), // Empty container for the button
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Xylophone App',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Optional: change the color as needed
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(
                  color: Color(0xFFD0F4F7),
                  soundFile: 'note7.wav'), // Arctic Blue
              buildKey(
                  color: Color(0xFF8FE3EF),
                  soundFile: 'note6.wav'), // Pale Cyan
              buildKey(
                  color: Color(0xFF00E1AE),
                  soundFile: 'note5.wav'), // Aquamarine
              buildKey(
                  color: Color(0xFF00BF88),
                  soundFile: 'note4.wav'), // Seafoam Green
              buildKey(
                  color: Color(0xFF00B2CA),
                  soundFile: 'note3.wav'), // Light Blue
              buildKey(
                  color: Color(0xFF017C8E),
                  soundFile: 'note2.wav'), // Turquoise
              buildKey(
                  color: Color(0xFF0131B4),
                  soundFile: 'note1.wav'), // Deep Blue
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          color: Colors.grey,
          child: Container(
            height: 60,
          ),
        ),
      ),
    );
  }
}
