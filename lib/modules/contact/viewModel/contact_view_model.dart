import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:testapp/app/locator.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactViewModel extends BaseViewModel {

  final NavigationService navigationService = locator<NavigationService>();

  void openEmailApp() async {
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'correo@gmail.com',
        queryParameters: {
          'subject': 'Enviado email desde app'
        }
    );
    await launch(_emailLaunchUri.toString());
  }

  void navigateToBack() {
    navigationService.back();
  }

}
