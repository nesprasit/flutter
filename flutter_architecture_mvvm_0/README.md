# Flutter Architecture MVVM

Architecture MVVM

## Feature
 - productFlavors IOS And Android
 - use dio plugin for service
 - use get_it plugin for inject
 - use alice plugin for logger service
 - use provider plugin for state management

### Configuration productFlavors for debug setting launch.json
```ruby
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        // Android Launch
        {
            "name": "Flutter_Android",
            "request": "launch",
            "type": "dart",
            "flutterMode": "debug",
            "args": [
                "--flavor",
                "dev" // dev, prod, uat
            ]
        },
        // IOS Launch
        {
            "name": "Flutter_IOS",
            "request": "launch",
            "type": "dart",
            "flutterMode": "debug",
            "args": [
                "--flavor",
                "Development" // Development, Production, UAT
            ]
        }
    ]
}
```
