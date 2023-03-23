//
//  SettingCell.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit

class SettingCell: UITableViewCell {
    
    private var icon: ImageView?
    private var label: Label?
    private var subLabel: Label?
    private var color: UIColor?
    
    private var chevron = ImageView(image: .chevronRight)
    private var bgIconView =  View(type: .settingView)
    
    init(reuseID: String, icon: ImageView, label: Label, subLabel: Label, color: UIColor, chevron: ImageView) {
        super.init(style: .default, reuseIdentifier: reuseID)
        
        self.chevron = chevron
        self.icon = icon
        self.label = label
        self.subLabel = subLabel
    
        self.label!.textColor = UIColor(named: "black")
        self.bgIconView.backgroundColor = color
        backgroundColor = .clear
        self.chevron.translatesAutoresizingMaskIntoConstraints = false
        self.icon!.translatesAutoresizingMaskIntoConstraints = false
        self.label!.translatesAutoresizingMaskIntoConstraints = false
        self.bgIconView.translatesAutoresizingMaskIntoConstraints = false
        self.subLabel!.translatesAutoresizingMaskIntoConstraints = false
        
        if label.text == "Language" {
            subLabel.isHidden = false
            self.subLabel!.textColor = UIColor(named: "grey")
            subLabel.text = UserDefaults.standard.value(forKey: "lan") as? String
        } else {
            subLabel.isHidden = true
        }
        
        addSubview(chevron)
        addSubview(label)
        addSubview(subLabel)
        addSubview(bgIconView)
        bgIconView.addSubview(icon)
        
        icon.tintColor = .black
        
        setupConstraint()
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingCell {
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
        self.bgIconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        self.bgIconView.centerYAnchor.constraint(equalTo: centerYAnchor),
        
        self.icon!.centerYAnchor.constraint(equalTo: bgIconView.centerYAnchor),
        self.icon!.centerXAnchor.constraint(equalTo: bgIconView.centerXAnchor),
        
        self.label!.leadingAnchor.constraint(equalTo: self.icon!.trailingAnchor, constant: 20),
        self.label!.centerYAnchor.constraint(equalTo: centerYAnchor),
        
        self.chevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        self.chevron.centerYAnchor.constraint(equalTo: centerYAnchor),
        
        self.subLabel!.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -12),
        self.subLabel!.centerYAnchor.constraint(equalTo: chevron.centerYAnchor),
        ])
    }
}
