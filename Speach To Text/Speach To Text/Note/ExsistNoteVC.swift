//
//  ExsistNoteVC.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import AVFoundation
import UIKit
import MessageUI
import Speech
import CoreData

class ExsistNoteViewController: UIViewController, UIAdaptivePresentationControllerDelegate  {
    
    var audioPlayer: AVAudioPlayer!
    let audioEngine = AVAudioEngine()
    
    var speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))!
    
    var speechRecognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    var speechRecognitionTask: SFSpeechRecognitionTask?
    
    
    var previosString = ""
    
    var id = ""
    
    var coreDataManager = CoreDataStack()
    
    let local = LocalizationVariables()
    
    var locale = UserDefaults.standard.value(forKey: "langCode") ?? "en-US"
    
    var buttonIsActive = false
    
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
    
    var record: Record?
    
    var state = 0
    
    var player = AVAudioPlayer()
    
    lazy var navigationView = View(type: .navigationView)
    
    lazy var filterButton = Button(type: .filter, nil)
    
    lazy var progress: UIProgressView = {
        let p = UIProgressView()
        p.progressTintColor = UIColor(named: "blue")
        p.trackTintColor = UIColor(red: 0.941, green: 0.969, blue: 1, alpha: 1)
        p.progress = 0.3
        
        return p
    }()
    
    lazy var dismissView = View(type: .dismissView)
    lazy var dismissTap = UITapGestureRecognizer(target: self, action: #selector(dismis))
    lazy var chevron = ImageView(image: .chevronLeft)
    lazy var libraryDismisLabel = Label(type: .folderDismiss, local.library)
    
    
    lazy var time = Label(type: .regular10, "00:00")
    lazy var totalTime = Label(type: .regular10, "00:00")
    
    
//    lazy var librarySaveLabel = Button(type: .empty, NSLocalizedString("save", comment: ""))
//    //lazy var saveTap = UITapGestureRecognizer(target: self, action: #selector(dismis))
//    
//    lazy var libraryLangLabel = Button(type: .empty, locale as! String)
    //lazy var langTap = UITapGestureRecognizer(target: self, action: #selector(lang))
    
    

    
    lazy var button = Button(type: .subscribeContinue, local.start)
    
    lazy var buttonTranscribe = Button(type: .subscribeContinue, local.transcribe)

    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        setupMenu()
        
        authorizeSR()
        
        self.overrideUserInterfaceStyle = .light
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .darkContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        flag = true
        
        record = coreDataManager.findRecord()
        
        textView.text = record?.text
        
        print(record)
        
        if state == 1 {
            textView.isHidden = true
            buttonTranscribe.isHidden = false
        } else if state == 2 {
            textView.isHidden = false
            buttonTranscribe.isHidden = true
        } else {
            
        }
        
        //let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        
        var file = record?.path
        
        file = file?.chopPrefix(8)
        
//        let start = file!.index(file!.startIndex, offsetBy: 8)
//        let end = file!.index(file!.startIndex, offsetBy: (record?.path!.count)! - 1)
//        let range = start...end
        
        
        
        //file?.remove(at: 8)
        

        //let newString = String(file.re)
        
        //var fl = String(file)
        
        print(file)
        
        
        let fileExists = FileManager.default.fileExists(atPath: file!)
        
        print(fileExists)
        
        
        
        do {
        
//            let documentsURL = FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: record?.path, create: false)
            let file = Bundle.main.path(forResource: "record1", ofType: "m4a")!
            //let fileURL = NSURL(fileURLWithPath: url)
            print(file)
            //player = try AVAudioPlayer(contentsOf: file, fileTypeHint: nil)
            player.numberOfLoops = 0 // loop count, set -1 for infinite
            player.volume = 1
            player.prepareToPlay()

            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch _ {
            print("catch")
        }
        
//        totalTime.text = String(player.duration)
        time.text = "00:00"
        
       
        //libraryLangLabel.text = UserDefaults.standard.value(forKey: "langCode") as! String
        setup()
        
    }
    

}


extension String {
    func chopPrefix(_ count: Int = 1) -> String {
        return substring(from: index(startIndex, offsetBy: count))
    }

    func chopSuffix(_ count: Int = 1) -> String {
        return substring(to: index(endIndex, offsetBy: -count))
    }
}
