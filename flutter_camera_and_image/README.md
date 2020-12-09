# Flutter Camera and Image

Camera And Image in Flutter application.

## Permisson
  - IOS
    ```ruby
    <key>NSPhotoLibraryUsageDescription</key>
    <string>$(PRODUCT_BUNDLE_IDENTIFIER) use photo</string>
    
    <key>NSCameraUsageDescription</key>
    <string>$(PRODUCT_BUNDLE_IDENTIFIER) use camera</string>
    ```
  - Android
    ```ruby
    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-feature android:name="android.hardware.camera" android:required="false" />
    <uses-feature android:name="android.hardware.camera.front" android:required="false" />
    ```

## Request Version
  - Android >= 21 

## Example
![Alt Text](https://github.com/nesprasit/flutter/blob/main/flutter_camera_and_image/example.gif)

## Dependencies Used
  ```ruby
  - image_picker: ^0.6.7+14
  - camera:
  - path_provider:
  - path:
  ```

