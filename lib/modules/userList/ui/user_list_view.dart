import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:testapp/app/constants/general_constants.dart';
import 'package:testapp/modules/userList/model/user.dart';
import 'package:testapp/modules/userList/viewModel/user_list_view_model.dart';

class UsersListView extends StatelessWidget {

  var _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UsersListViewModel>.reactive(
      builder: (context, model, child) =>
          SafeArea(
            child: Scaffold(
                body: bodyView(context, model)
            ),
          ),
      viewModelBuilder: () => UsersListViewModel(),
      onModelReady: (model) => this.initView(model),
    );
  }
  
  void initView(UsersListViewModel model) {
    model.requestGetUsers();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        model.requestGetUsers();
      }
    });
  }

  Widget navigationBar(BuildContext context, UsersListViewModel model) {
    return Container(
      padding: EdgeInsets.only(
          left: 16,
          right: 20,
          top: 32,
          bottom: 16
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: model.navigateToBack,
          ),
          Expanded(
            child: SvgPicture.asset(GeneralConstants.palanteImage),
          )
        ],
      ),
    );
  }

  Widget bodyView(BuildContext context, UsersListViewModel model) {
    return Stack(
      children: <Widget>[
        Container( // Fondo del App
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset(GeneralConstants.appBackgroundImage,
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: <Widget>[
            navigationBar(context, model),
            Expanded(
              child: ListView.builder(
                controller: _controller,
                  itemCount: model.users.length,
                  itemBuilder: (BuildContext context, int index){
                    return userCard(model.users[index]);
                  }
              ),
            )
          ],
        ),
        Visibility(
          visible: model.isCallUsers,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.blueAccent.withAlpha(100),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget userCard(User user) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(8),
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 100,
              margin: EdgeInsets.all(8),
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(user.avatar)
                  )
              )
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(child: Text('${user.firstName} ${user.lastName}')),
                  Container(child: Text(user.email)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}