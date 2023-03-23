//
//  SettingVC.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit
import MessageUI

class SettingViewController: UIViewController {
    
    let local = LocalizationVariables()
    var  value = "0"
    var rateUs = "0"
    var oController = UserDefaults.standard.value(forKey: "oController")
    
    lazy var dismissView = View(type: .dismissView)
    lazy var dismissTap = UITapGestureRecognizer(target: self, action: #selector(dismis))
    lazy var chevron = ImageView(image: .chevronLeft)
    lazy var libraryDismisLabel = Label(type: .folderDismiss, local.library)
    
    lazy var subView = View(type: .subscribeView)
    lazy var subImage = ImageView(image: .bigCrown)
    lazy var subLabel = Label(type: .subLabel, local.unlockButton)
    lazy var subTap = UITapGestureRecognizer(target: self, action: #selector(sub))
    
    lazy var tabbleView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.delegate = self
        tb.dataSource = self
        
        tb.backgroundColor = .clear
        
        return tb
    }()
    
    
    lazy var header = Label(type: .pageTitle, local.titleSetting)
    
    lazy var pat = ImageView(image: .patern)
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(langUpdate(notification:)), name: Notification.Name("langOk"), object: nil)
        
        self.overrideUserInterfaceStyle = .light
        
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        tabbleView.reloadData()
    }
    
    @objc func langUpdate(notification: Notification) {
        if UserDefaults.standard.value(forKey: "lan") as? String == "Spanish, Latin American (es-419)"{
            UserDefaults.standard.setValue("Spanish (es-419)", forKey: "lan")
        } else if UserDefaults.standard.value(forKey: "lan") as? String == "Chinese, Simplified (yue-CN)"{
            UserDefaults.standard.setValue("Chinese (yue-CN)", forKey: "lan")
        }
        tabbleView.reloadData()
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .darkContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        NotificationCenter.default.addObserver(self, selector: #selector(methodOfReceivedNotification(notification:)), name: Notification.Name("reload"), object: nil)
        
        setup()
    }
    

}

