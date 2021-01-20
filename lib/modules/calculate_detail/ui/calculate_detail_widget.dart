import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/app/constants/general_constants.dart';

class CalculatDetailWidget extends StatelessWidget {

  Function onCalulateTap;

  CalculatDetailWidget(this.onCalulateTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          background(),
          Container(
            child: Column(
              children: <Widget>[
                header(context),
                body(context),
                pricesValues()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget background() {
    return Container(
      height: 720,
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 53),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all( Radius.circular(20.0) ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(  // Content data
          margin: EdgeInsets.only(right: 40, left: 40),
          padding: EdgeInsets.only(left: 30, right: 30, top: 30),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Text("Monto:",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: GeneralConstants.primaryFont,
                                  fontSize: 12,
                                  color: Colors.black
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent, width: 2),
                              borderRadius: BorderRadius.all( Radius.circular(20.0) ),
                            ), //             <--- BoxDecoration here
                            child: Text("500.000",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: GeneralConstants.primaryFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blueAccent
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Text("Monto:",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: GeneralConstants.primaryFont,
                                  fontSize: 12,
                                  color: Colors.black
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            margin: EdgeInsets.only(left: 8),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent, width: 2),
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
                                  color: Colors.blueAccent
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {

                },
                child: Container(
                    child: SvgPicture.asset(
                      GeneralConstants.newCalculateButton,
                      fit: BoxFit.cover,
                    )
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget body(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 300,
          margin: EdgeInsets.only(right: 30, left: 30),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey.withAlpha(30), Colors.transparent]
              )
            ),
        ),
        Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 32, top: 32),
                child: GestureDetector(
                  child: SvgPicture.asset(GeneralConstants.priceTitleImage),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 8),
                child: GestureDetector(
                  onTap: () {
                    print("onTap whatsapp");
                  },
                  child: SvgPicture.asset(GeneralConstants.whatsAppImage),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 32),
                child: Text('Solicitar credito',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: GeneralConstants.primaryFont,
                    fontSize: 16,
                    color: Colors.black87,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(left: 60, right: 60),
                  color: Colors.grey,
                  height: 0.5,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: Text('Resumen',
                  textAlign: TextAlign.left,
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
                  margin: EdgeInsets.only(left: 60, right: 60),
                  color: Colors.grey,
                  height: 0.5,
                ),
              )
            ]
        ),
      ],
    );
  }

  Widget pricesValues() {

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 80, right: 50, top: 16),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 16),
            child: Row(
              children: <Widget>[
                Text('Interés (25% E.A.):',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                  ),
                ),
                Text(' 4,698',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: GeneralConstants.primaryFont,
                      fontSize: 16,
                      color: Colors.black87
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 16),
            child: Row(
              children: <Widget>[
                Text('Seguro:  ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                  ),
                ),
                Text(' 4,698',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: GeneralConstants.primaryFont,
                      fontSize: 16,
                      color: Colors.black87
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 16),
            child: Row(
              children: <Widget>[
                Text('Administración:  ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                  ),
                ),
                Text(' 16,698',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: GeneralConstants.primaryFont,
                      fontSize: 16,
                      color: Colors.black87
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 8, bottom: 16),
            child: Text('Subtotal:  532.000',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: GeneralConstants.primaryFont,
                  fontSize: 16,
                  color: Colors.blueAccent
              )
            ),
          )
        ],
      ),
    );
  }

}