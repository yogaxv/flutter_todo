import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Hello, ',
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              )),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Yoga',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.pinkAccent,
                    )),
              ],
            ),
          ),
          Text(
            "You have 5 task today",
            style: GoogleFonts.nunito(
                textStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              wordSpacing: 1.2,
            )),
          )
        ],
      ),
    );
  }
}
