//
//  NewNoteUI.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit
import SnapKit
import CoreData

extension NewNoteViewController {
    
    func setup() {
        
        view.backgroundColor = .white
        
        view.addSubview(textView)
        view.addSubview(button)
        
        view.addSubview(navigationView)
        
        navigationView.addSubview(dismissView)
        dismissView.addGestureRecognizer(dismissTap)
        dismissView.addSubview(chevron)
        dismissView.addSubview(libraryDismisLabel)
        
        navigationView.addSubview(librarySaveLabel)
        
        navigationView.addSubview(libraryLangLabel)
        
        libraryDismisLabel.textColor = UIColor(named: "blue")
        chevron.tintColor = UIColor(named: "blue")
        button.backgroundColor = UIColor(named: "blue")
        button.setTitleColor(.white, for: .normal)
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalTo(button.snp.top).offset(-20)
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.height / 16.9)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
        
        navigationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(14)
            make.left.right.equalTo(view).inset(16)
            make.height.equalTo(52)
        }
        
        dismissView.snp.makeConstraints { make in
            make.centerY.equalTo(navigationView.snp.centerY)
            make.left.equalTo(view).inset(0)
        }
        
        
        chevron.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(18)
        }
        
        libraryDismisLabel.snp.makeConstraints { make in
            make.left.equalTo(chevron.snp.right).offset(8)
            make.centerY.equalTo(chevron.snp.centerY)
            make.right.equalToSuperview()
        }
        
        librarySaveLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.centerY.equalTo(chevron.snp.centerY)
        }
        
        libraryLangLabel.snp.makeConstraints { make in
            make.right.equalTo(librarySaveLabel.snp.left).offset(-8)
            make.centerY.equalTo(chevron.snp.centerY)
        }
        
        button.addTarget(self, action: #selector(startTranscribing), for: .touchUpInside)
        librarySaveLabel.addTarget(self, action: #selector(save), for: .touchUpInside)
        libraryLangLabel.addTarget(self, action: #selector(lang), for: .touchUpInside)

    }
    
    
}



