import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:testapp/app/constants/general_constants.dart';
import 'package:testapp/modules/contact/viewModel/contact_view_model.dart';

class ContactView extends StatelessWidget {

  const ContactView({Key key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactViewModel>.reactive(
      builder: (context, model, child) => bodyView(context, model),
      viewModelBuilder: () => ContactViewModel(),
    );
  }

  Widget bodyView(BuildContext context, ContactViewModel model) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset(GeneralConstants.contactBackgroundImage,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 100),
            child: SvgPicture.asset(GeneralConstants.contactEmailImage,
              fit: BoxFit.fitWidth,
            ),
          ),
          Column(
            children: <Widget>[
              contactNumbers(),
              formContact(model)
            ],
          )
        ],
      ),
    );
  }

  Widget contactNumbers() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          alignment: Alignment.center,
          child: Text('Contacto',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: GeneralConstants.primaryFont,
                fontSize: 33,
                color: Colors.white
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          margin: EdgeInsets.only(bottom: 70),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 8, bottom: 3),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: Colors.white,  // Text colour here
                    width: 0.5, // Underline width
                  ))
                ),
                child: Text('informacion@creditospalante.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: GeneralConstants.primaryFont,
                      fontSize: 16,
                      color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 8, bottom: 3),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(
                      color: Colors.white,  // Text colour here
                      width: 0.5, // Underline width
                    ))
                ),
                child: Text('lina.rojas@creditospalante.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: GeneralConstants.primaryFont,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget formContact(ContactViewModel model) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: SvgPicture.asset(GeneralConstants.contactLineDecorationImage,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 40, top: 60),
          child: Text('Correo:',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 40,
          margin: EdgeInsets.only(left: 30, right: 30, top: 16),
          padding: EdgeInsets.only(left: 16, bottom: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all( Radius.circular(20.0) ),
          ),
          child: TextField(
            textAlign: TextAlign.left,
            cursorColor: Colors.blueAccent,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Correo@correo.com',
                hintStyle: TextStyle(fontSize: 14.0, color: Colors.blueAccent.withAlpha(100)),
            ),
            style: TextStyle(
                fontFamily: GeneralConstants.primaryFont,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.blueAccent,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 40, top: 40),
          child: Text('Mensaje:',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 150,
          margin: EdgeInsets.only(left: 30, right: 30, top: 16),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0) ),
          ),
          child: TextField(
            maxLines: 10,
            maxLength: 300,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Max 300'
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            model.openEmailApp();
          },
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 50),
            width: 168,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25.0) ),
            ),
            child: Text("Enviar",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: GeneralConstants.primaryFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blueAccent
              ),
            ),
          ),
        )
      ],
    );
  }

}