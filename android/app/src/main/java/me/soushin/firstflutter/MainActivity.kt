package me.soushin.firstflutter

import android.os.Bundle
import android.util.Log
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        MethodChannel(flutterView, FLUTTER_LOG_CHANNEL).setMethodCallHandler { call, result ->
            logPrint(call)
        }
    }
    
    private fun logPrint(call: MethodCall) {
        val tag: Any = call.arguments
        when (call.method) {
            "logV" -> Log.v("android",tag.toString())
            "logD" -> Log.d("android",tag.toString())
            "logI" -> Log.i("android",tag.toString())
            "logW" -> Log.w("android",tag.toString())
            "logE" -> Log.e("android",tag.toString())
        }
    }

    companion object {
        const val FLUTTER_LOG_CHANNEL = "android_log"
    }
}
