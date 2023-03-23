//
//  LocaleUI.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit
import SnapKit

extension SelectVoiceType {
    

    
    func setup() {
        view.addSubview(doneButton)
        view.addSubview(chooseVoice)
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.addSubview(cancelButton)
      
        view.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.953, alpha: 1)
        tableView.backgroundColor = .clear
        doneButton.addTarget(self, action: #selector(dismissToMainView), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(hideKeyboard), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

            chooseVoice.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseVoice.topAnchor.constraint(equalTo: doneButton.topAnchor),
            chooseVoice.heightAnchor.constraint(equalToConstant: 25),
            
        ])
        
        cancelButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(searchBar.snp.centerY)
        }
        
        searchBar.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalTo(cancelButton.snp.left).offset(-5)
            make.top.equalTo(chooseVoice.snp.bottom).offset(16)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        tableView.layer.cornerRadius = 16
        //tableView.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
        
    }
    
}
