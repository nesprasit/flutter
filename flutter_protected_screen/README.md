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


### Second way
