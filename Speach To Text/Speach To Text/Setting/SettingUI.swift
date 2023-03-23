//
//  SettingUI.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit
import SnapKit

extension SettingViewController {
    
    func setup() {
        
        view.backgroundColor = .white
        
        view.addSubview(header)
        view.addSubview(tabbleView)
        view.addSubview(subView)
        subView.addSubview(pat)
        subView.addSubview(subImage)
        subView.addSubview(subLabel)
        tabbleView.backgroundColor = .clear
        tabbleView.layer.cornerRadius = 7
        
        view.addSubview(dismissView)
        dismissView.addGestureRecognizer(dismissTap)
        dismissView.addSubview(chevron)
        dismissView.addSubview(libraryDismisLabel)
        
        pat.layer.cornerRadius = 12
        
        //done.addTarget(self, action: #selector(dismis), for: .touchUpInside)
        subView.addGestureRecognizer(subTap)
        
        libraryDismisLabel.textColor = UIColor(named: "blue")
        chevron.tintColor = UIColor(named: "blue")
        
        
        NSLayoutConstraint.activate([
            
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            tabbleView.topAnchor.constraint(equalTo: subView.bottomAnchor, constant: 33),
            tabbleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tabbleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            tabbleView.heightAnchor.constraint(equalToConstant: 352),
            
        ])
        
        if UserDefaults.standard.value(forKey: "FullAccess") as? Int == 1 {
            subView.isHidden = true
            tabbleView.snp.remakeConstraints { make in
                make.top.equalTo(header.snp.bottom).offset(38)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-15)
                make.height.equalTo(352)
            }
        }
        
        subView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(38)
            make.right.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(80)
        }
        
        pat.snp.makeConstraints { make in
            make.right.left.top.bottom.equalToSuperview()
        }
        
        subImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(24)
            
        }
        
        subLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(subImage.snp.right).offset(24)
        }
        
        dismissView.snp.makeConstraints { make in
            make.centerY.equalTo(header.snp.centerY)
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
        
        
        
    }
    
    
}

extension SettingViewController {
    
    @objc func dismis() {
        dismiss(animated: true)
    }
    
    @objc func sub() {
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
    
}

