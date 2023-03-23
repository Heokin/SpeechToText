//
//  ButtonEx.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit

class Button: UIButton {
    
    let local = LocalizationVariables()
    
    enum ButtonType {
        case subscribeContinue
        case alertB
        case empty
        case alertCancel
        case alertSetting
        case unlock
        case navigationSetting
        case navigationSubscribe
        case xmark
        case doneButton
        case mainLevel
        case nextLevel
        case filter
    }
    
    init(type: ButtonType, _ text: String?) {
        
        
        
        super.init(frame: .zero)
        self.setTitle(text, for: .normal)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
            
        case .filter:
            setImage(UIImage(named: "line.3.horizontal.decrease.circle"), for: .normal)
            tintColor = UIColor(named: "blue")
            widthAnchor.constraint(equalToConstant: 30).isActive = true
            heightAnchor.constraint(equalToConstant: 30).isActive = true
            
        case .doneButton:
            setTitle(text, for: .normal)
            titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            setTitleColor(UIColor(named: "blue"), for: .normal)
            
        case .navigationSetting:
            setTitle(text, for: .normal)
            setTitleColor(UIColor(named: "black"), for: .normal)
            backgroundColor = .clear
            titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            
        case .empty:
            setTitle(text, for: .normal)
            setTitleColor(UIColor(named: "blue"), for: .normal)
            backgroundColor = .clear
            titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            
        case .navigationSubscribe:
            setTitle(text, for: .normal)
            setTitleColor(UIColor(named: "black"), for: .normal)
            backgroundColor = .clear
            titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            
        case .xmark:
            setImage(UIImage(systemName: "xmark"), for: .normal)
            tintColor = UIColor(named: "black")
            
        case .alertB:
            setTitle(text, for: .normal)
            setTitleColor(UIColor(red: 0, green: 0.591, blue: 0.917, alpha: 1), for: .normal)
            titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            backgroundColor = .clear
            
        case .alertSetting:
            setTitle(text, for: .normal)
            setTitleColor(UIColor(red: 0, green: 0.591, blue: 0.917, alpha: 1), for: .normal)
            titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            backgroundColor = .clear
            
        case .alertCancel:
            setTitle(text, for: .normal)
            setTitleColor(UIColor(red: 0.82, green: 0.384, blue: 0.514, alpha: 1), for: .normal)
            titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            backgroundColor = .clear
            
        case .subscribeContinue:
            setTitle(text, for: .normal)
            setTitleColor(UIColor(named: "black"), for: .normal)
            backgroundColor = UIColor(named: "yellow")
            layer.cornerRadius = 25
            titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            
            
        case .unlock:
            setTitle(text, for: .normal)
            
            
            let imageAttachment = NSTextAttachment()
            
            imageAttachment.image = UIImage(systemName: "crown")?.withTintColor(.white)
            //imageAttachment.setImageHeight(height: 50)

            let imageSize = imageAttachment.image!.size
            imageAttachment.bounds = CGRect(x: CGFloat(-30), y: ((titleLabel?.font.capHeight)! - imageSize.height) / 2, width: 51, height: 40)
                    
            let fullString = NSMutableAttributedString(attachment: imageAttachment)
            fullString.append(NSAttributedString(string: " " + local.unlockButton))
            
            setAttributedTitle(fullString, for: .normal)
            
            backgroundColor = UIColor(red: 0.51, green: 0.78, blue: 0.902, alpha: 1)
            layer.cornerRadius = 12
            titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
            titleLabel?.textColor = .white
            
            
        case .mainLevel:
            setTitle(text, for: .normal)
            
            backgroundColor = UIColor(named: "pink")
            layer.cornerRadius = 14
            titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            titleLabel?.textColor = UIColor(named: "black")
        
        case .nextLevel:
            setTitle(text, for: .normal)
            
            backgroundColor = UIColor(named: "purple")
            layer.cornerRadius = 14
            titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            titleLabel?.textColor = UIColor(named: "black")
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NSTextAttachment {
    func setImageHeight(height: CGFloat) {
        guard let image = image else { return }
        let ratio = image.size.width / image.size.height

        bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: ratio * height, height: height)
    }
}
