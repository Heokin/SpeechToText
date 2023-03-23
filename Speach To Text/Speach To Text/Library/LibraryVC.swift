//
//  LibraryVC.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit
import CoreData
import SwipeCellKit

class LibraryViewController: UIViewController,UICollectionViewDelegate, SwipeCollectionViewCellDelegate,
                             UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    
    
    let local = LocalizationVariables()
    var oController = UserDefaults.standard.value(forKey: "oController")
    
    var coreDataManager = CoreDataStack()
    
    var records: [Record]!
    
    var coreDataManage13r = UITableView()
    
    lazy var navigationView = View(type: .navigationView)
    lazy var navigationHeader = Label(type: .pageTitle, local.library)
    lazy var navigationSetting = Button(type: .navigationSetting, " ")
    lazy var navigationSubscribe = Button(type: .navigationSubscribe, " ")
    lazy var roundedSettingView = ImageView(image: .setting)
    lazy var roundedSubscribeView = ImageView(image: .crown)
    lazy var helpTextLabel = Label(type: .regular17, local.helpText)
    lazy var mainImage = ImageView(image: .library)
    lazy var button = Button(type: .subscribeContinue, local.addNotes)
    
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        records = coreDataManager.findAll()
        
        setup()
        setUpLogic()
    }
    
}
