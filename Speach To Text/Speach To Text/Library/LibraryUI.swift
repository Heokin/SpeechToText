//
//  LibraryUI.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit
import CoreData

extension LibraryViewController {
    
    func setup() {
        
        view.addSubview(navigationView)
        
        navigationView.addSubview(navigationHeader)
        
        navigationHeader.addSubview(roundedSettingView)
        navigationHeader.addSubview(roundedSubscribeView)
        
        view.addSubview(navigationSetting)
        view.addSubview(navigationSubscribe)
        
        view.addSubview(button)
        
        view.addSubview(mainImage)
        
        view.addSubview(helpTextLabel)

        
        view.backgroundColor = .white
        
        button.backgroundColor = UIColor(named: "blue")
        button.setTitleColor(.white, for: .normal)
        
        navigationSetting.addTarget(self, action: #selector(settingHandle), for: .touchUpInside)
        navigationSubscribe.addTarget(self, action: #selector(subHandle), for: .touchUpInside)
        
        
        button.addTarget(self, action: #selector(add), for: .touchUpInside)
        
        
        
        navigationHeader.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(navigationView)
        }
        
        navigationView.snp.remakeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
                make.left.right.equalTo(view).inset(16)
                make.height.equalTo(32)
        }
        navigationSetting.snp.remakeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.right.equalTo(navigationView)
            make.centerY.equalTo(navigationView)
        }

        navigationSubscribe.snp.remakeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.equalTo(navigationView)
            make.centerY.equalTo(navigationView)
        }
        
        roundedSettingView.snp.makeConstraints { make in
            make.center.equalTo(navigationSetting)
        }
        
        roundedSubscribeView.snp.makeConstraints { make in
            make.center.equalTo(navigationSubscribe)
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-58)
            make.height.equalTo(UIScreen.main.bounds.height / 16.9)
            make.width.equalTo(UIScreen.main.bounds.width - 40)
        }
        
        mainImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-80)
        }
        
        helpTextLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainImage.snp.bottom).offset(63)
        }
        
//        collectionView.snp.makeConstraints { make in
//            make.top.equalTo(navigationView.snp.bottom).offset(30)
//            make.left.equalToSuperview().offset(15)
//            make.right.equalToSuperview().offset(-15)
//            make.bottom.equalTo(button.snp.top).offset(24)
//        }
//
//        collectionView.backgroundColor = .red
    }
}
