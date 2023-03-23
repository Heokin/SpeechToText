//
//  FirstLaunch.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation

class IsFirstLaunch {
    static let shared = IsFirstLaunch()
    
    var isFirstLaunch: Bool {
        get {
            UserDefaults.standard.bool(forKey: #function)
        } set  {
            UserDefaults.standard.setValue(newValue, forKey: #function)
        }
    }
}
