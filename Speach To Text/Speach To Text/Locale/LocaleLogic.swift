//
//  LocalLogic.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit

extension SelectVoiceType {
    
    @objc func dismissToMainView() {
//        if key != "" {
//            UserDefaults.standard.setValue(key, forKey: "key")
//            UserDefaults.standard.setValue(value, forKey: "value")
//        }

        dismiss(animated: true)
    }
    
    @objc func hideKeyboard() {
            view.endEditing(true)
        }
    
}
