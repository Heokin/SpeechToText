//
//  AppDelegate.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import UIKit
import AVFoundation
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
            return self.orientationLock
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        print(Locale.preferredLanguages[0])
        
        if UserDefaults.standard.value(forKey: "record") == nil {
            UserDefaults.standard.set("1", forKey: "record")
        }

        
        UserDefaults.standard.setValue(Locale.preferredLanguages[0], forKey: "langCode")
        
        window?.overrideUserInterfaceStyle = .dark
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        if IsFirstLaunch.shared.isFirstLaunch {
            //window?.rootViewController = NewNoteViewController()
            window?.rootViewController = LibraryViewController()
        } else {
            //window?.rootViewController = NewNoteViewController()
            window?.rootViewController = LibraryViewController()
        }
        
        // Override point for customization after application launch.
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        } catch {
            print("AVAudioSessionCategoryPlayback not work")
        }
    }


}

