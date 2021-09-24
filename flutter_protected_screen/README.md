# flutter_protected_screen
  Flutter secure screen.

## Secure 2 Way

### First way
    1. Android : Add code to path <project>/android/app/src/main/kotlin/com/example/flutter_protected_screen/MainActivity.kt
```ruby
#Import
import io.flutter.embedding.engine.FlutterEngine
import android.view.WindowManager.LayoutParams

#Code
override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    window.addFlags(LayoutParams.FLAG_SECURE)
    super.configureFlutterEngine(flutterEngine)
}
```
    2. IOS : Add code to path <project>/ios/Runner/AppDelegate.swift
```ruby
override func applicationWillResignActive(_ application: UIApplication) {
    // Protected screen capture (Enabled)
    self.window.hidden = YES;
}
  
override func applicationDidBecomeActive(_ application: UIApplication) {
    // Protected screen capture (Disabled)
    self.window.hidden = NO;
}
```

### Second way
[1]:https://pub.dev/packages/secure_application
Use [secure_application][1] plugin

SecureScreen class file
```ruby
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
```

How to use SecureScreen class
```ruby
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SecureScreen(
        widget: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
```
