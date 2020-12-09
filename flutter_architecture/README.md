# Flutter Architecture
Provider Simple Architecture TodoList App 

## Folder Structure
```ruby
lib
├── main.dart
├── res/
    ├── colors.dart
    ├── fonts.dart
    └── sizes.dart
└── src/
    ├── di/
        └── service_locator.dart
    ├── models/
        ├── base/
        └── todo/
    ├── remote/
        ├── network/
            ├── network_response.dart
            └── network_result.dart
        ├── repository/
            └── home_repository.dart
        └── response_result.dart
    ├── ui/
        └── home
            ├── home_viewmodel.dart
            └── home.dart
    ├── utils/
    └── widgets/
       ├── base_appbar.dart
       ├── loading_dialog.dart
       ├── loading.dart
       └── one_button_dialog.dart
```

## Dependencies Used
  - http
  - provider
  - flutter_localizations
  - get_it
  - json_annotation
