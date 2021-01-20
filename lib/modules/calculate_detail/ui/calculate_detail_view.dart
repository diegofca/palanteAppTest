import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:testapp/app/constants/general_constants.dart';
import 'package:testapp/modules/calculate_detail/ui/calculate_detail_widget.dart';
import 'package:testapp/modules/calculate_detail/viewModel/Calculate_detail_view_model.dart';

class CalculateDetailView extends StatelessWidget {

  const CalculateDetailView({Key key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculateDetailViewModel>.reactive(
      builder: (context, model, child) =>
          SafeArea(
            child: Scaffold(
              body: bodyView(context, model),
            ),
          ),
      viewModelBuilder: () => CalculateDetailViewModel(),
    );
  }

  Widget navigationBar(BuildContext context, CalculateDetailViewModel model) {
    return Container(
      padding: EdgeInsets.only(
          left: 16, right: 20, top: 32, bottom: 16
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              model.navigationService.back();
            },
          ),
          Expanded(
            child: SvgPicture.asset(GeneralConstants.palanteImage),
          ),
          IconButton(
            onPressed: model.navigateToBack,
            icon: Icon(Icons.menu, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget bodyView (BuildContext context, CalculateDetailViewModel model) {
    return Stack(
      children: <Widget>[
        Container( // Fondo del App
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset(GeneralConstants.appBackgroundImage,
            fit: BoxFit.fill,
          ),
        ),
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                navigationBar(context, model),
                CalculatDetailWidget(model.navigateToBack)
              ],
            ),
          ),
        )
      ],
    );
  }

}