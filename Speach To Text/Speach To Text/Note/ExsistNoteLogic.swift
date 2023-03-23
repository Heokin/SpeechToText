//
//  ExsistNoteLogic.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit
import Speech


extension ExsistNoteViewController {
    
    @objc func dismis() {
        let vc = LibraryViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func setupMenu() {
                   let topAction = UIAction(title: "Edit text", image: UIImage(systemName: "pencil"), handler: { [self] (_) in
                        if flag == false {
                            self.textView.isEditable = true
//                            doneButtonEdit.isHidden = false
                            filterButton.isHidden = true
                            flag = true
                        } else {
                            self.textView.isEditable = false
                            flag = false
                        }
                    })

         
         let small = UIAction(title: "Small") { [self] (_) in
             textView.font = UIFont.systemFont(ofSize: 20)
         }
         let medium = UIAction(title: "Medium") { [self] (_) in
             textView.font = UIFont.systemFont(ofSize: 25)
         }
         let large = UIAction(title: "Large") { [self] (_) in
             textView.font = UIFont.systemFont(ofSize: 30)
         }
         let submenu = UIMenu(title: "Font size", children: [small, medium, large])
         let item = [topAction, submenu]
                let divider = UIMenu(title: "", options: .displayInline, children: item)

                let bottomAction = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up"), handler: {[self] (_) in
                    
//                    //let file = "\(String(describing: textField.text)).txt"
//                    let text = textView.text
//
//                    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//
//                        //let fileURL = dir.appendingPathComponent(file)
////                        do {
////                            try text!.write(to: fileURL, atomically: false, encoding: .utf8)
////                        }
////                        catch {}
////                        do {
////                            let text2 = try String(contentsOf: fileURL, encoding: .utf8)
////                            let activityVC = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
////                            self.present(activityVC, animated: true, completion: nil)
////                        }
////                        catch {}
//                    }
                })
        let bottomAction2 = UIAction(title: "Export", image: UIImage(systemName: "square.and.arrow.up"), handler: {[self] (_) in
            
//                    //let file = "\(String(describing: textField.text)).txt"
//                    let text = textView.text
//
//                    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//
//                        //let fileURL = dir.appendingPathComponent(file)
////                        do {
////                            try text!.write(to: fileURL, atomically: false, encoding: .utf8)
////                        }
////                        catch {}
////                        do {
////                            let text2 = try String(contentsOf: fileURL, encoding: .utf8)
////                            let activityVC = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
////                            self.present(activityVC, animated: true, completion: nil)
////                        }
////                        catch {}
//                    }
        })
                let items = [divider, bottomAction, bottomAction2]
                
                let menu = UIMenu(title: "", children: items)
         filterButton.menu = menu
    }
    
    
    
    @objc func startTranscribing() {
        
        if !buttonIsActive {
            try! startSession()
            button.setTitle(local.stop, for: .normal)
            button.backgroundColor = UIColor(named: "yellow")
            buttonIsActive = true
        } else {
            buttonIsActive = false
            button.setTitle(local.start, for: .normal)
            button.backgroundColor = UIColor(named: "blue")
            stopTranscribing()
        }
    }
    
    func startSession() throws {
        
        try audioEngine.start()
        
        locale = UserDefaults.standard.value(forKey: "langCode") as! String
        
        print(locale)
        
        speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: locale as? String ?? "en"))!
        
        speechRecognitionTask?.cancel()
        self.speechRecognitionTask = nil
                
                // Configure the audio session for the app.
                let audioSession = AVAudioSession.sharedInstance()
                try audioSession.setCategory(.playAndRecord, mode: .measurement, options: .duckOthers)
                try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
                let inputNode = audioEngine.inputNode
        
        

        speechRecognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let speechRecognitionRequest = speechRecognitionRequest else { fatalError("Unable to create a SFSpeechAudioBufferRecognitionRequest object") }
        speechRecognitionRequest.shouldReportPartialResults = true
        
        if #available(iOS 13, *) {
            if speechRecognizer.supportsOnDeviceRecognition {
                speechRecognitionRequest.requiresOnDeviceRecognition = true
            }
        }

        speechRecognitionTask = speechRecognizer.recognitionTask(with: speechRecognitionRequest) { [self] result, error in

            var isFinal = false
            
            speechRecognitionRequest.addsPunctuation = true
            

            if let result = result {
                self.textView.text = previosString + result.bestTranscription.formattedString.description
                //self.textView.text = result.bestTranscription.formattedString
                isFinal = result.isFinal
                let range = NSMakeRange(textView.text.count - 20, 0)
                textView.scrollRangeToVisible(range)
            }

            if error != nil || isFinal {
                
                
                //previosString += textView.text

                textView.text = previosString
                
                self.audioEngine.stop()
                self.audioEngine.inputNode.removeTap(onBus: 0)

                self.speechRecognitionRequest = nil
                self.speechRecognitionTask = nil
                
                try! self.startSession()

            }

        }
        
        audioEngine.inputNode.removeTap(onBus: 0)
        var recordingFormat = audioEngine.inputNode.outputFormat(forBus: 0)

        inputNode.removeTap(onBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in

            self.speechRecognitionRequest?.append(buffer)
        }

        audioEngine.prepare()
        
    }

    func authorizeSR() {
        SFSpeechRecognizer.requestAuthorization { authStatus in

            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.button.isEnabled = true

                case .denied:
                    self.button.isEnabled = false
                    self.button.setTitle("Speech recognition access denied by user", for: .disabled)

                case .restricted:
                    self.button.isEnabled = false
                    self.button.setTitle("Speech recognition restricted on device", for: .disabled)

                case .notDetermined:
                    self.button.isEnabled = false
                    self.button.setTitle("Speech recognition not authorized", for: .disabled)
                @unknown default:
                    print("fatal error")
                }
            }
        }
    }
    
    @objc func stopTranscribing() {
        
        previosString += textView.text
        

        self.speechRecognitionTask?.cancel()
        self.speechRecognitionTask = nil
        self.speechRecognitionRequest?.endAudio()
        self.speechRecognitionRequest = nil
        
//        DispatchQueue.main.async { [unowned self] in
//                guard let task = self.speechRecognitionTask else {
//                    fatalError("Error")
//                }
//                task.cancel()
//                task.finish()
//
//                speechRecognitionTask = nil
//            }
//
//        speechRecognitionRequest?.endAudio()
//        audioEngine.stop()
//
//        audioEngine.inputNode.removeTap(onBus: 0)

    }
    
    @objc func lang() {
        let vc = SelectVoiceType()
        vc.presentationController?.delegate = self
        self.present(vc, animated: true)
    }
    
    @objc func save() {
        
    }
    
    @objc func saveDocuments() {
        filterButton.showsMenuAsPrimaryAction = true
    }
    
    @objc func play() {
            do {
                
                let file = Bundle.main.path(forResource: "sample4", ofType: "m4a")!
                let fileURL = NSURL(fileURLWithPath: file)
                player = try AVAudioPlayer(contentsOf: fileURL as URL, fileTypeHint: nil)
                player.numberOfLoops = 0 // loop count, set -1 for infinite
                player.volume = 1
                player.prepareToPlay()

                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
                try AVAudioSession.sharedInstance().setActive(true)

                player.play()
            } catch _ {
                print("catch")
            }
        }
    
    @objc func stop() {
        player.pause()
    }
    
    @objc func resume() {
        player.play()
    }
}

