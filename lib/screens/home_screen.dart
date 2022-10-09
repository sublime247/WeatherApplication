import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapplication/API_CALLS/weather_api_calls.dart';
import 'package:weatherapplication/model/weather_data.dart';

WeatherCalls weatherCalls = WeatherCalls();
Weather? weather;

Future getWeather() async {
  weather = await weatherCalls.getWeather(inputText.text);
  // weather = await calls;
}

TextEditingController inputText = TextEditingController();
TextEditingController newText = TextEditingController();
// String _inputText = inputText.text;

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool choosen = true;
  changeLocation() {
    setState(() {
      inputText.text = newText.text;
      choosen = false;
    });
  }

  @override
  void initState() {
    inputText.text = 'lagos';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
          future: getWeather(),
          // initialData: ,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
      
                          children: [
                          CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  Image.asset('assets/Rectangle.png').image),
                          const SizedBox(
                            width: 20,
                          ),
                        
                          SizedBox(
                            width: 100,
                            child: TextField(
                                controller: choosen ? inputText : newText,
                                autofocus: false,
                                onSubmitted: (value) => changeLocation(),
                                cursorColor: const Color(0xFF36424D),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    suffixIcon: SizedBox(
                                      width:0,
                                      height: 0,
                                      child: Icon(
                                        Icons.expand_more,
                                        color: Color(0xFF36424D),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1)))),
                          )
                        ]),
                        SizedBox(height: 20,),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Feels Like A good\ntime to ride a bike',
                                  style: GoogleFonts.poppins(
                                      color: const Color(0xFF09151E),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20)),
                              const SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: SvgPicture.asset('assets/Vector.svg'),
                              )
                            ]),
                            SizedBox(height: 30,),
                        CircleAvatar(
                        radius: 150,
                        backgroundColor: const Color(0xFF09151E),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 25,
                              left: 3,
                              child: Image.asset('assets/Cloud5.png')),
                             Positioned(
                              top: 25,
                              right: 3,
                              child: Image.asset('assets/cloud.png')),
                            Center(
                              child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 8.0),
                                child: Text('${weather!.city}',  style:  GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16))),
                              Container(
                                 margin: EdgeInsets.only(right: 30.0, top:15.0),
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  children: [
                                    Text('${weather!.temperature}',
                                     style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30)),
                                     const  Text('o', style: TextStyle(fontFeatures: [FontFeature.subscripts()],color: Colors.white ),),
                                      Text('C',style:  GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30)),
                                    ]),
                              ),
                               
                              Container(
                                margin:const  EdgeInsets.only(left: 35.0, top:20.0)
                  ,                                child: Image.network(
                                  'http://openweathermap.org/img/wn/${weather!.icon}@2x.png'),
                              )])),
                             Positioned(
                              bottom:30,
                              right: 3,
                              child: Image.asset('assets/clear1.png')),
                             Positioned(
                              bottom: 30,
                              left: 3,
                              child: Image.asset('assets/windy.png')),
                            Positioned(
                        bottom: -10,
                         left: 120,
                        // right: 75,
                        child: Image.asset('assets/thunder.png')) 
                           ]),
                          ),
                  
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('Description:', style:  GoogleFonts.poppins(
                                      color: const Color(0xFF09151E),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16)),
                                Text('${weather!.description}',style:  GoogleFonts.poppins(
                                      color:const Color(0xFF09151E),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12))
                              ],
                            ),
                            Column(
                                children: [
                               Text('Pressure:', style:  GoogleFonts.poppins(
                                      color:const Color(0xFF09151E),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16)),
                                Text('${weather!.pressure} atm',style:  GoogleFonts.poppins(
                                      color:const Color(0xFF09151E),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12) )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                          Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('Wind Degree:',style:  GoogleFonts.poppins(
                                    color: const Color(0xFF09151E),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16)),
                                Wrap(
                                  direction: Axis.horizontal,
                                  children:[ 
                                    Text('${weather!.windDirection}', style:  GoogleFonts.poppins(
                                        color:const Color(0xFF09151E),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,)),
                                 const  Text('0', style: TextStyle(
                                  fontSize: 9,
                                  fontFeatures:[ FontFeature.superscripts()])
                                        ,)
                              ])
                              ],
                            ),
                            Column(
                                children: [
                               Text('WindSpeed:',style:  GoogleFonts.poppins(
                                      color:const Color(0xFF09151E),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16)),
                                Text('${weather!.windSpeed} m/s',style:  GoogleFonts.poppins(
                                      color:const Color(0xFF09151E),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12))
                              ],
                            )
                          ],
                        ),
                          ],)  
                                      )
                      ]),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF09151E),),
            );
          }),
    );
  }
}
