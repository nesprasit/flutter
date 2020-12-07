package com.nes.flutter_persistent_storage

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    final val CHANNEL = "flutter.native/utils"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL).setMethodCallHandler { call, result ->
            if(!onMethodCallHandler(call,result)){
                result.notImplemented()
            }
        }
    }

    private fun onMethodCallHandler(call: MethodCall, result: MethodChannel.Result): Boolean {
        return when(call.method){
            "getText" -> {
                result.success(getText())
                true
            }
            else ->{
                false
            }
        }
    }

    private fun getText():String = "I'm Native app android"

}
