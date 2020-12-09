# Flutter Camera and Image

Camera And Image in Flutter application.

# Example
![Alt Text](https://github.com/nesprasit/flutter/blob/main/flutter_camera_and_image/example.gif)

# Permisson
  - IOS
    ```ruby
    <key>NSPhotoLibraryUsageDescription</key>
    <string>$(PRODUCT_BUNDLE_IDENTIFIER) photo use</string>
    
    <key>NSCameraUsageDescription</key>
    <string>$(PRODUCT_BUNDLE_IDENTIFIER) photo camera</string>
    ```
  - Android
    ```ruby
    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-feature android:name="android.hardware.camera" android:required="false" />
    <uses-feature android:name="android.hardware.camera.front" android:required="false" />
    ```
