import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:testapp/app/constants/general_constants.dart';

class CalculateWidget extends StatelessWidget {

  Function onCalulateTap;

  CalculateWidget(this.onCalulateTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          background(),
          Container(
            margin: EdgeInsets.only(right: 40, left: 40),
            child: Column(
              children: <Widget>[
                header(context),
                body(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget background() {
    return Container(
      height: 410,
      margin: EdgeInsets.all(16),
      child: Container(
        height: 390,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(20.0) //                 <--- border radius here
          ),
        )
        //child: SvgPicture.asset(GeneralConstants.calculateBackgroundImage),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(  // Content data
          padding: EdgeInsets.only(top: 30),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Text('Calcular credito',
                style: TextStyle(
                    fontFamily: GeneralConstants.primaryFont,
                    fontSize: 20,
                    color: Colors.blueAccent
                ),
              ),  //TITLE
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 30,
                            child: Text('Tomador',
                              style: TextStyle(
                                  fontFamily: GeneralConstants.primaryFont,
                                  fontSize: 16,
                                  color: Colors.blueAccent
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              color: Colors.blueAccent,
                              height: 4,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 30,
                            child: Text('Otorgante',
                              style: TextStyle(
                                  fontFamily: GeneralConstants.primaryFont,
                                  fontSize: 16,
                                  color: Colors.grey
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              color: Colors.transparent,
                              height: 4,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ), // PAGES
            ],
          ),
        )
      ],
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 32, left: 32),
          alignment: Alignment.centerLeft,
          child: Text('Elige el monto:',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: GeneralConstants.primaryFont,
                fontSize: 12,
                color: Colors.blueGrey
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 40,
          margin: EdgeInsets.only(left: 30, right: 30, top: 16),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 2),
              borderRadius: BorderRadius.all(
                  Radius.circular(20.0) //                 <--- border radius here
              ),
          ), //             <--- BoxDecoration here
          child: Text(" 500.000",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: GeneralConstants.primaryFont,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.blueAccent
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 32, left: 32),
          alignment: Alignment.centerLeft,
          child: Text('Elige el plazo delas cuotas:',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: GeneralConstants.primaryFont,
                fontSize: 12,
                color: Colors.blueGrey
            ),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 40,
                  margin: EdgeInsets.only(left: 30, right: 8, top: 16),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(
                        Radius.circular(20.0) //                 <--- border radius here
                    ),
                  ), //             <--- BoxDecoration here
                  child: Text("3 meses",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: GeneralConstants.primaryFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 40,
                  margin: EdgeInsets.only(left: 8, right: 30, top: 16),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.all(
                        Radius.circular(20.0) //                 <--- border radius here
                    ),
                  ), //             <--- BoxDecoration here
                  child: Text("6 meses",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: GeneralConstants.primaryFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.blueAccent
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onCalulateTap,
          child: Container(  // Background
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(GeneralConstants.calculateButton)
          ),
        )
      ]
    );
  }

}