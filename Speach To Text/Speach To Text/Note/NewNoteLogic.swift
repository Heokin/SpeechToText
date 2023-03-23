//
//  NewNoteLogic.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit
import Speech
import CoreData


extension NewNoteViewController {
    
    @objc func dismis() {
        let vc = LibraryViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
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
    
    func startRecording() {
        
        recNow = UserDefaults.standard.value(forKey: "record") as! String
        
        let audioFilename = getDocumentsDirectory().appendingPathComponent("record" + recNow! + ".m4a")
        
        path += "record" + recNow! + ".m4a"
        
        print(path)
        
        UserDefaults.standard.set(String(Int(recNow!)! + 1), forKey: "record")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()

        } catch {
            finishRecording(success: false)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        path = paths[0].absoluteString
        return paths[0]
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    func startSession() throws {
        
        speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: locale as! String))!

        if let recognitionTask = speechRecognitionTask {
            recognitionTask.cancel()
            self.speechRecognitionTask = nil
        }

        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(AVAudioSession.Category.record)
        
        if audioRecorder == nil {
            startRecording()
        } else {
            audioRecorder.record()
        }
        
        speechRecognitionRequest = SFSpeechAudioBufferRecognitionRequest()

        guard let recognitionRequest = speechRecognitionRequest else { fatalError("SFSpeechAudioBufferRecognitionRequest object creation failed") }

        let inputNode = audioEngine.inputNode

        recognitionRequest.shouldReportPartialResults = true

        speechRecognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in

            var finished = false

            if let result = result {
                self.textView.text = self.previosString + result.bestTranscription.formattedString
                finished = result.isFinal
                let range = NSMakeRange(self.textView.text.count - 40, 0)
                self.textView.scrollRangeToVisible(range)
            }

            if error != nil || finished {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)

                self.speechRecognitionRequest = nil
                self.speechRecognitionTask = nil

                self.textView.text = self.previosString
            }
        }

        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in

            self.speechRecognitionRequest?.append(buffer)
        }

        audioEngine.prepare()
        try audioEngine.start()
        
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

        if audioEngine.isRunning {
            isRec = false
            audioRecorder.pause()
            audioEngine.stop()
            speechRecognitionRequest?.endAudio()
            
            previosString = textView.text + ". "
            
            print(previosString)

        }

    }
    
    @objc func lang() {
        let vc = SelectVoiceType()
        vc.presentationController?.delegate = self
        self.present(vc, animated: true)
    }
    
    @objc func save() {
        
        if recNow != nil {
            
            let alertController = UIAlertController(title: local.alertSave,
                                                    message: local.alertSaveDiscription,
                                                    preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: local.alertSave, style: .default) { [self]_ in
                finishRecording(success: true)
                
                
                
                coreDataManager.obtaineRecord(text: textView.text, name: "record" + recNow!, state: 2, path: path)
            })
            alertController.addAction(UIAlertAction(title: local.alertSaveOnly, style: .default) {[self]_ in
                finishRecording(success: true)
                
                
                
                coreDataManager.obtaineRecord(text: "", name: "record" + recNow!, state: 1, path: path)
            })
            alertController.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
            self.present(alertController, animated: true)
            
        }
    }
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        libraryLangLabel.setTitle(UserDefaults.standard.value(forKey: "langCode") as? String, for: .normal)
    }
    
    @objc func langUpdate(notification: Notification) {
        libraryLangLabel.setTitle(UserDefaults.standard.value(forKey: "langCode") as? String, for: .normal)
    }
    
}

