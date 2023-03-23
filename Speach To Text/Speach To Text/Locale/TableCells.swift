//
//  File.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 9.02.23.
//

import Foundation
import UIKit

class VoiceTableViewCell: UITableViewCell {
    
    public static var id = "id"
    
    lazy var image = ImageView(image: .checkMark)
    var header = Label(type: .regular17, "Header")
    
    public func setup(headerValue: String) {
     
        self.header.text = headerValue
//        if self.header.text?.slice(from: "(", to: ")") == UserDefaults.standard.value(forKey: "langCode") as? String{
//            image.isHidden = false
//        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        let selectedView = UIView()
        selectedView.backgroundColor = .clear
        selectedBackgroundView = selectedView
        image.tintColor = UIColor(named: "purple")
        
        contentView.addSubview(image)
        contentView.addSubview(header)
        header.textColor = .black
        image.isHidden = true
        header.textAlignment = .left
        
        
        let constraints = [
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            header.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            header.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            header.trailingAnchor.constraint(equalTo: image.leadingAnchor),
            header.heightAnchor.constraint(equalToConstant: 22),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
