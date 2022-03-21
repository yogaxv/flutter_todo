import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 12.5, 10, 12.5),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 8,
              spreadRadius: 1,
              offset: Offset(0, 10.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 7,
              height: double.infinity,
              color: Colors.blue,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text(
                  "Todo",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontFamily: 'opensans'),
                ),
              ),
            ),
          ],
        ));
  }
}
