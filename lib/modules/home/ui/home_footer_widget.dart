import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/app/constants/general_constants.dart';

class HomeFooterWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, bottom: 60),
            child: SvgPicture.asset(GeneralConstants.palanteImage),
          ),
          Text('2020',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                color: Colors.white
            ),
          )
        ],
      ),
    );
  }

}
