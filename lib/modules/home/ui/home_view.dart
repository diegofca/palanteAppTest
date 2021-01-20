import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:testapp/app/constants/general_constants.dart';
import 'package:testapp/modules/contact/ui/contact_view.dart';
import 'package:testapp/modules/home/ui/calculate_widget.dart';
import 'package:testapp/modules/home/viewModel/Home_view_model.dart';
import 'home_footer_widget.dart';

class HomeView extends StatelessWidget {

  const HomeView({Key key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) => SafeArea(
          child: Scaffold(
            body: bodyView(context, model)
          ),
        ),
        viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget bodyView(BuildContext context, HomeViewModel model) {
    return Stack(
      children: <Widget>[
        Container( // Fondo del App
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset(
              GeneralConstants.appBackgroundImage,
              fit: BoxFit.fill,
          ),
        ),
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                navigationBar(context, model),
                descriptionView(),
                whatsAppAndUserButtonsView(context, model),
                underlineSeparator(),
                CalculateWidget(model.navigateToDetailCredit),
                ContactView(),
                HomeFooterWidget()
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget navigationBar(BuildContext context, HomeViewModel model) {
    return Container(
      padding: EdgeInsets.only(
        left: 40, right: 20, top: 32, bottom: 16
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: SvgPicture.asset(GeneralConstants.palanteImage),
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget descriptionView() {
    return Container(
      padding: EdgeInsets.only(right: 100, top: 32, left: 40, bottom: 32),
      child: Text("Es una plataforma para conectar gente y facilitar microcreditos conectando a quienes necesitan dinero, con quienes pueden prestarlo y obtener ingresos por ello",
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.white,
          height: 1.8
        ),
      ),
    );
  }

  Widget whatsAppAndUserButtonsView(BuildContext context, HomeViewModel model) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 32, right: 32, bottom: 32),
          child: GestureDetector(
            onTap: () {
              print("onTap whatasapp.");
            },
            child: SvgPicture.asset(
              GeneralConstants.whatsAppButtonImage,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width/2,
          child: GestureDetector(
            onTap: model.navigateToUsersList,
            child: SvgPicture.asset(
             GeneralConstants.userListButtonImage,
            ),
          ),
        )
      ],
    );
  }

  Widget underlineSeparator() {
    return Container(
      margin: EdgeInsets.only(right: 32, left: 32),
      color: Colors.grey,
      height: 1,
    );
  }

}
