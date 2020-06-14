import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let controller:FlutterViewController=window?.rootViewController as! FlutterViewController;
    let batteryChannel = FlutterMethodChannel.init(name: "me.soushin.flutterapp/battery", binaryMessenger: controller.binaryMessenger);
    batteryChannel.setMethodCallHandler { (call:FlutterMethodCall,result:FlutterResult) -> Void in if("getBatteryLevel"==call.method){
            receiveBetteryLevel(result: result);
        }else{
            result(FlutterMethodNotImplemented);
        }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

 private func receiveBetteryLevel(result: FlutterResult){
     let device = UIDevice.current;
     device.isBatteryMonitoringEnabled=true;
     if(device.batteryState==UIDevice.BatteryState.unknown){
         result(FlutterError.init(code: "UNAVAILABLE", message: "电池信息不可用", details: nil));
     }else {
         result(Int(device.batteryLevel*100));
     }
 }
