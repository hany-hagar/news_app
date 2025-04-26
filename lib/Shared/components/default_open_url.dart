import 'package:url_launcher/url_launcher.dart';

Future<bool> defaultOpenUrl({required String url}) async {
  final Uri uri = Uri.parse(url);
  // ignore: deprecated_member_use
  if (await canLaunch(uri.toString())) {
    // ignore: deprecated_member_use
    await launch(uri.toString());
    return true;
  } else {
    return false;
  }
}
