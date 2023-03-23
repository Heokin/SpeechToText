//
//  LibraryLogic.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit
import CoreData
import SwipeCellKit

extension LibraryViewController {

    @objc func settingHandle() {
        let vc = SettingViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    
    func setUpLogic() {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        
        
        
        
        //layout.minimumInteritemSpacing = UIScreen.main.bounds.width / 46.875

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        
        
        guard let collectionView = collectionView else { return }
        
        collectionView.backgroundColor = .clear

        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(navigationHeader.snp.bottom).offset(30)
            make.left.right.equalTo(view).inset(UIScreen.main.bounds.width/25)
            make.bottom.equalTo(button.snp.top).offset(-18)
        }
        
        
        
    }
    
    
    @objc func subHandle() {
        oController = UserDefaults.standard.value(forKey: "oController")
        print(oController)
        let vc = SubVC()
        if oController as! String == "1" {
            vc.numberSub = "first"
        } else {
            vc.numberSub = "second"
        }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func add() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

     
        alert.addAction(UIAlertAction(title: "Voice Recoder", style: .default, handler: {[self] _ in
            let vc = NewNoteViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
        }))
        alert.addAction(UIAlertAction(title: "Import Files", style: .default, handler: {[self] _ in
            let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.mp3])
            documentPicker.allowsMultipleSelection = false
            documentPicker.delegate = self
            documentPicker.modalPresentationStyle = .overFullScreen
            present(documentPicker, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            
        }))
        
        present(alert, animated: true)
    }
    


    
    @objc func removeFile(path: String){

        let fileManager = FileManager.default
                let documentsUrl =  FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first! as NSURL
                let documentsPath = documentsUrl.path

                do {
                    if let documentPath = documentsPath
                    {
                        let fileNames = try fileManager.contentsOfDirectory(atPath: "\(documentPath)")
                        print("all files in cache: \(fileNames)")
                        for fileName in fileNames {

                            if (fileName.hasSuffix(".m4a"))
                            {
                                try fileManager.removeItem(atPath: path)
                            }
                        }

                        let files = try fileManager.contentsOfDirectory(atPath: "\(documentPath)")
                        print("all files in cache after deleting images: \(files)")
                    }

                } catch {
                    print("Could not clear temp folder: \(error)")
                }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if records.count != 0 {
            mainImage.isHidden = true
            helpTextLabel.isHidden = true
        }
        return records.count
    }
    
    @objc func delete(num: Int) {
        let alert = UIAlertController(title: "Do You Really Want to Delete This File?", message: nil, preferredStyle: .actionSheet)

     
        alert.addAction(UIAlertAction(title: "Delete File", style: .default, handler: {[self] _ in
            self.coreDataManager.removeRecord(with: self.records[num].id!)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            
        }))
        
        present(alert, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: nil) { action, indexPath in
            self.delete(indexPath.row)
        }
        
        let shareAction = SwipeAction(style: .destructive, title: nil) { action, indexPath in

        }
        
        deleteAction.backgroundColor = UIColor(red: 1, green: 0.357, blue: 0.176, alpha: 1)
        shareAction.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        deleteAction.image = UIImage(named: "delete")
        shareAction.image = UIImage(named: "share")
        return [shareAction, deleteAction]
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.id, for: indexPath) as! CustomCollectionViewCell
        
        cell.setup(name: records[indexPath.row].name!, date: records[indexPath.row].date!,access: Int(records[indexPath.row].state))
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell
        
        let vc = ExsistNoteViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.id = (records[indexPath.row].id?.uuidString)!
        self.present(vc, animated: true)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width : CGFloat
        let height : CGFloat
        
        width = UIScreen.main.bounds.width - 30
        height = 60

        return CGSizeMake(width, height)
        
      }
    
}

extension LibraryViewController: UIDocumentMenuDelegate,UIDocumentPickerDelegate,UINavigationControllerDelegate {
    func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
                present(documentPicker, animated: true, completion: nil)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        dismiss(animated: true)

        guard url.startAccessingSecurityScopedResource() else {
            return
        }

        defer {
            url.stopAccessingSecurityScopedResource()
        }

        // Copy the file with FileManager
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
                print("view was cancelled")
                dismiss(animated: true, completion: nil)
        }

    

    
    
}
