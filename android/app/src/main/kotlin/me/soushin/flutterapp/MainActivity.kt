package me.soushin.flutterapp

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    
    val CHANNEL="me.soushin.flutterapp/battery"


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(flutterEngine!!)
        
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger,CHANNEL).setMethodCallHandler{call, result ->
            run {
                // TODO
                if (call.method == "getBatteryLevel") {
                    val batteryLevel = getBatteryLevel()
                    if (batteryLevel != -1) {
                        result.success(batteryLevel)
                    } else {
                        result.error("UNAVAILABLE", "Battery level not available.", null)
                    }
                } else {
                    result.notImplemented()
                }

            }
        }
        
        
        
    }
    
    
    private fun getBatteryLevel():Int{
        val batteryLevel:Int
        if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.LOLLIPOP){
            val batteryManager=getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel=batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        }else{
            val intent=ContextWrapper(application).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel=intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL,-1)*100/intent.getIntExtra(BatteryManager.EXTRA_SCALE,-1)
        }
        return batteryLevel
    }


}
