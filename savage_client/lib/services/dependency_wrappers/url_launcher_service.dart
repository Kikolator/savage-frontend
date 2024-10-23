import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future<void> launchWeb({required String host, String? path}) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: host,
      path: path,
    );
    if (kIsWeb) {
      launchUrl(uri);
      return;
    } else {
      final bool launchResult = await launchUrl(uri);
      if (!launchResult) {
        throw Exception('Could not launch Uri $uri');
      }
      return;
    }
  }

  Future<void> launchPhone(String phone) async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: phone,
    );
    final bool launchResult = await launchUrl(uri);
    if (!launchResult) {
      throw Exception('Could not launch Uri $uri');
    }
    return;
  }

  Future<void> launchMail(String mail) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: mail,
    );
    final bool launchResult = await launchUrl(uri);
    if (!launchResult) {
      throw Exception('Could not launch Uri $uri');
    }
    return;
  }
}
