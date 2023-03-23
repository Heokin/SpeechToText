//
//  RemoteConfig.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//


//import Foundation
//import UIKit
//import FirebaseRemoteConfig
//
//class RemoteConfigFetch {
//
//    static var shared = RemoteConfigFetch()
//    let remoteConfig = RemoteConfig.remoteConfig()
//
//    let defaults: [String: NSObject] = [
//        "welcomeTourScreenNumber"     : "1" as NSObject,
//        "welcomeTourSubscription"     : "{\"1\": \"com.speakercleaner.1wetr\",                                                              \"2\": \"com.speakercleaner.1motr\",                                                              \"3\": \"com.speakercleaner.1yetr\" }" as NSObject,
//        "closeButtonDelay"            : "0" as NSObject,
//        "adsShow"                     : "2" as NSObject,
//        "availableFreeStereoTest"     : "10" as NSObject,
//        "availableFreeAutoTest"       : "10" as NSObject,
//        "availableFreeManualTest"     : "10" as NSObject,
//        "rateUs"                      : "1" as NSObject,
//        "otherScreenNumber"           : "1" as NSObject,
//        "otherSubscription"           : "{\"1\": \"com.speakercleaner.1we\",                                                                \"2\": \"com.speakercleaner.1mo\",                                                                \"3\": \"com.speakercleaner.1ye\" }" as NSObject,
//
//    ]
//
//    public func fetchValues() {
//        let setting = RemoteConfigSettings()
//        setting.minimumFetchInterval = 0
//        remoteConfig.setDefaults(defaults)
//        remoteConfig.configSettings = setting
//        remoteConfig.fetchAndActivate { (status, error) in
//
//            if error != nil {
//
//            } else {
//                if status != .error{
//                    UserDefaults.standard.set(self.remoteConfig["welcomeTourScreenNumber"].stringValue, forKey: "wController")
//                    UserDefaults.standard.set(self.remoteConfig["welcomeTourSubscription"].stringValue, forKey: "wSub")
//                    UserDefaults.standard.set(self.remoteConfig["closeButtonDelay"].stringValue, forKey: "closeButtonDelay")
//                    UserDefaults.standard.set(self.remoteConfig["adsShow"].stringValue, forKey: "ads")
//                    UserDefaults.standard.set(self.remoteConfig["availableFreeAutoTest"].stringValue, forKey: "availableFreeAutoTest")
//                    UserDefaults.standard.set(self.remoteConfig["availableFreeManualTest"].stringValue, forKey: "availableFreeManualTest")
//                    UserDefaults.standard.set(self.remoteConfig["availableFreeStereoTest"].stringValue, forKey: "availableFreeStereoTest")
//                    UserDefaults.standard.set(self.remoteConfig["otherScreenNumber"].stringValue, forKey: "oController")
//                    UserDefaults.standard.set(self.remoteConfig["otherSubscription"].stringValue, forKey: "oSub")
//                    UserDefaults.standard.set(self.remoteConfig["rateUs"].stringValue, forKey: "rateUs")
//                    NSLog("Remoute Loaded, all ok")
//                }
//                if status == .error{
//                    UserDefaults.standard.set("1", forKey: "wController")
//                    UserDefaults.standard.set("{   \"1\": \"com.speakercleaner.1wetr\",   \"2\": \"com.speakercleaner.1motr\",   \"3\": \"com.speakercleaner.1yetr\" }", forKey: "wSub")
//                    UserDefaults.standard.set("0", forKey: "closeButtonDelay")
//                    UserDefaults.standard.set("2", forKey: "ads")
//                    UserDefaults.standard.set("10", forKey: "availableFreeAutoTest")
//                    UserDefaults.standard.set("10", forKey: "availableFreeManualTest")
//                    UserDefaults.standard.set("10", forKey: "availableFreeStereoTest")
//                    UserDefaults.standard.set("1", forKey: "oController")
//                    UserDefaults.standard.set("{   \"1\": \"com.speakercleaner.1we\",   \"2\": \"com.speakercleaner.1mo\",   \"3\": \"com.speakercleaner.1ye\" }", forKey: "oSub")
//                    UserDefaults.standard.set("1", forKey: "rateUs")
//                    NSLog("Eror: Remoute UnLoaded")
//                }
//            }
//        }
//    }
//
//}
