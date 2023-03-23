//
//  ExsistNoteUI.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit
import SnapKit

extension ExsistNoteViewController {
    
    func setup() {
        
        view.backgroundColor = .white
        
        view.addSubview(textView)
        view.addSubview(button)
        
        view.addSubview(progress)
        
        view.addSubview(time)
        view.addSubview(totalTime)
        
        view.addSubview(navigationView)
        
        navigationView.addSubview(dismissView)
        navigationView.addSubview(filterButton)
        dismissView.addGestureRecognizer(dismissTap)
        dismissView.addSubview(chevron)
        dismissView.addSubview(libraryDismisLabel)
        
        libraryDismisLabel.textColor = UIColor(named: "blue")

        chevron.tintColor = UIColor(named: "blue")
        button.backgroundColor = UIColor(named: "blue")
        button.setTitleColor(.white, for: .normal)
        
        buttonTranscribe.backgroundColor = UIColor(red: 0.941, green: 0.969, blue: 1, alpha: 1)
        buttonTranscribe.setTitleColor(UIColor(named: "blue"), for: .normal)
        
        filterButton.addTarget(self, action: #selector(saveDocuments), for: .touchUpInside)
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalTo(progress.snp.top).offset(-10)
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.height / 16.9)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
        
        buttonTranscribe.snp.makeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.height / 16.9)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(progress.snp.top).offset(-52)
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
        
//        librarySaveLabel.snp.makeConstraints { make in
//            make.right.equalToSuperview().offset(-15)
//            make.centerY.equalTo(chevron.snp.centerY)
//        }
        
//        libraryLangLabel.snp.makeConstraints { make in
//            make.right.equalTo(librarySaveLabel.snp.left).offset(-8)
//            make.centerY.equalTo(chevron.snp.centerY)
//        }
        
        progress.snp.makeConstraints { make in
            make.right.equalTo(textView.snp.right)
            make.left.equalTo(textView.snp.left)
            make.bottom.equalTo(button.snp.top).offset(-50)
        }
        
        totalTime.snp.makeConstraints { make in
            make.right.equalTo(textView.snp.right)
            make.top.equalTo(progress.snp.bottom).offset(8)
        }
        
        time.snp.makeConstraints { make in
            make.left.equalTo(textView.snp.left)
            make.top.equalTo(progress.snp.bottom).offset(8)
        }
        
        filterButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(60)
            make.height.equalTo(32)
            make.right.equalToSuperview().offset(-16)
        }
        
//        filterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//        filterButton.topAnchor.constraint(equalTo: chevron.topAnchor),
//        filterButton.widthAnchor.constraint(equalToConstant: 60),
//        filterButton.heightAnchor.constraint(equalToConstant: 24),
        
        button.addTarget(self, action: #selector(startTranscribing), for: .touchUpInside)
    }
    
    
}



