import 'package:flutter/material.dart';
import 'package:secure_application/secure_application.dart';

class SecureScreen extends SecureApplication {
  SecureScreen({widget: Widget})
      : super(
          nativeRemoveDelay: 1000,
          child: Builder(builder: (context) {
            /*
             * Secure Enabled
              if the user switch app or leave app the content will not be visible
              in the app switcher and when it goes back to the app it will lock it
             */
            var provider = SecureApplicationProvider.of(context);
            provider?.secure();

            return SecureGate(
                blurr: 20,
                opacity: 0.6,
                lockedBuilder: (context, secureNotifier) {
                  secureNotifier?.unlock();
                  return Container(color: Colors.white);
                },
                child: widget);
          }),
        );
}
