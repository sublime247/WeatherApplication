import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset('assets/star.svg')),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Let’s See\nThe ⭐\nWeather\nAround you',
            style: GoogleFonts.poppins(
                color: const Color(0xFF0C1823),
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    primary: const Color(0xFF0C1823),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                child: Text("Let's check",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 18))),
          ),
        )
      ]),
    );
  }
}
