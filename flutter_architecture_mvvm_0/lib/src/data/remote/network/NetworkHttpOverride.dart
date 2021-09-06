import 'dart:io';

class NetworkHttpOverride extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context) {
    final client = super.createHttpClient(context);
    client.badCertificateCallback = (X509Certificate cer,String host, int post) => true;
    return client;
  }
}