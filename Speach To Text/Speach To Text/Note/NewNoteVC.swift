//
//  NewNoteVC.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit
import MessageUI
import AVFoundation
import Speech
import CoreData

class NewNoteViewController: UIViewController, UIAdaptivePresentationControllerDelegate, AVAudioRecorderDelegate  {
    
    var audioPlayer: AVAudioPlayer!
    var audioEngine = AVAudioEngine()
    var audioRecorder: AVAudioRecorder!
    
    var recNow: String?
    
    var speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))!
    
    var speechRecognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    var speechRecognitionTask: SFSpeechRecognitionTask?
    
    var isRec = true
    var buttonIsActive = false
    
    var previosString = ""
    
    var path = ""
    
    let local = LocalizationVariables()
    
    var locale = UserDefaults.standard.value(forKey: "langCode") ?? "en-US"
    
    var coreDataManager = CoreDataStack()
    
    
    lazy var textView: UITextView = {
        var tf = UITextView()
        tf.textColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = UIFont.systemFont(ofSize: 34, weight: .semibold)
        tf.isEditable = false
        //tf.backgroundColor = UIColor(named: "tfWhite")
        
//        tf.attributedPlaceholder = NSAttributedString(
//            string: "  \(local.titlePlaceHolder)",
//            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "grayCell") ?? .gray]
//        )
        
        return tf
    }()
    
    lazy var flag = true;
    
    lazy var navigationView = View(type: .navigationView)
    
    lazy var dismissView = View(type: .dismissView)
    lazy var dismissTap = UITapGestureRecognizer(target: self, action: #selector(dismis))
    lazy var chevron = ImageView(image: .chevronLeft)

    
    lazy var libraryDismisLabel = Label(type: .folderDismiss, local.library)
    
    lazy var librarySaveLabel = Button(type: .empty, NSLocalizedString("save", comment: ""))
    
    lazy var libraryLangLabel = Button(type: .empty, locale as! String)
    
    

    
    lazy var button = Button(type: .subscribeContinue, local.start)

    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        getDocumentsDirectory()
        
        NotificationCenter.default.addObserver(self, selector: #selector(langUpdate(notification:)), name: Notification.Name("langOk"), object: nil)
        
        authorizeSR()
        
        self.overrideUserInterfaceStyle = .light
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .darkContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        flag = true
       
        //libraryLangLabel.text = UserDefaults.standard.value(forKey: "langCode") as! String
        setup()
        
    }
    
    

}






