# flutter_protected_screen
  Flutter secure screen.

## Secure 2 Way

### First way
    1. Android : Add code to path <project>/android/app/src/main/kotlin/com/example/flutter_protected_screen/MainActivity.kt
```ruby
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
