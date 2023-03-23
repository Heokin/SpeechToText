//
//  LabelEx.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit

class Label: UILabel {
    
    enum LabelType {
        
        case semibold30
        case semibold28
        case semibold22
        case semibold17
        case regular17
        case regular15
        case regular10
        case ads
        case subLabel
        case pageTitle
        case subscribeHeader
        case subscribeTitle

        case folderDismiss
        case mainText
        case alertRate
        case alertRestore
        case alertRestoreDiscription
        case restore
        
        case subscribeTop
        case subscribeTopActive
        case subscribeBottom
        case subscribeBottomActive
        case priceBot
        case priceBotActive
        case priceTop
        case priceTopActive
        case dayBot
        case dayBotActive
        case dayTop
        case dayTopActive
        
        case stereo
        
        case semibold44
        
        case low
        
        case score
        
        case cellHeader
        case cellFooter
    }
    
    let local = LocalizationVariables()
    
    var paragraphStyle = NSMutableParagraphStyle()
    
    init(type: LabelType, _ text: String?) {
        
        super.init(frame: .zero)
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
            
        case .cellHeader:
            font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            textColor = .black
            textAlignment = .left
            
        case .cellFooter:
            font = UIFont.systemFont(ofSize: 15, weight: .regular)
            textColor = UIColor(named: "grayCell")
            textAlignment = .left
            
        case .low:
            textColor = UIColor(red: 0.714, green: 0.714, blue: 0.714, alpha: 1)
            font = UIFont.systemFont(ofSize: 15, weight: .regular)
            
            numberOfLines = 0
            lineBreakMode = .byWordWrapping
            textAlignment = .center
            
        case .semibold44:
            textColor = UIColor(named: "black")
            font = UIFont.systemFont(ofSize: 44, weight: .semibold)
            textAlignment = .center
            
        case .stereo:
            textColor = .white
            font = UIFont.systemFont(ofSize: 70, weight: .bold)
            
        case .semibold30:
            textColor = UIColor(named: "black")
            font = UIFont.systemFont(ofSize: 30, weight: .semibold)
            textAlignment = .center
            numberOfLines = 0
        case .semibold28:
            textColor = UIColor(named: "black")
            font = UIFont.systemFont(ofSize: 28, weight: .semibold)
            textAlignment = .center
            numberOfLines = 0
        case .semibold22:
            textColor = UIColor(named: "black")
            font = UIFont.systemFont(ofSize: 22, weight: .semibold)
            textAlignment = .center
        case .semibold17:
            textColor = UIColor(named: "black")
            font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            textAlignment = .center
        case .regular17:
            textColor = UIColor(named: "grey")
            font = UIFont.systemFont(ofSize: 17, weight: .regular)
            textAlignment = .center
        case .regular15:
            textColor = UIColor(named: "grey")
            font = UIFont.systemFont(ofSize: 15, weight: .regular)
            textAlignment = .center
            numberOfLines = 0
        case .regular10:
            textColor = UIColor(named: "blue")
            font = UIFont.systemFont(ofSize: 10, weight: .regular)
            textAlignment = .center
            numberOfLines = 0
        case .ads:
            textColor = .white
            font = UIFont.systemFont(ofSize: 37, weight: .semibold)
            textAlignment = .center
            centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        case .restore:
            textColor = UIColor(named: "blue")
            font = UIFont.systemFont(ofSize: 17, weight: .medium)
        case .alertRate:
            font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subLabel:
            font = UIFont.systemFont(ofSize: 22, weight: .medium)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .pageTitle:
            font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            textAlignment = .center
            textColor = .black
            numberOfLines = 0
        case .subscribeHeader:
            font = UIFont.systemFont(ofSize: 36, weight: .bold)
            textAlignment = .center
            textColor = UIColor(named: "yellow")
            numberOfLines = 0
            lineBreakMode = .byWordWrapping
        case .subscribeTitle:
            font = UIFont.systemFont(ofSize: 20, weight: .medium)
            textAlignment = .right
            textColor = .black
            numberOfLines = 0
        case .subscribeTop:
            if UIScreen.main.bounds.width > 500 {
                font = UIFont.systemFont(ofSize: 23, weight: .medium)
            } else {
                font = UIFont.systemFont(ofSize: 14, weight: .medium)
            }
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeTopActive:
            if UIScreen.main.bounds.width > 500 {
                font = UIFont.systemFont(ofSize: 25, weight: .medium)
            } else {
                font = UIFont.systemFont(ofSize: 16, weight: .medium)
            }
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .subscribeBottom:
            if UIScreen.main.bounds.width > 500 {
                font = UIFont.systemFont(ofSize: 25, weight: .semibold)
            } else {
                font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            }
            textAlignment = .center
            textColor = .black
            numberOfLines = 0
        case .subscribeBottomActive:
            if UIScreen.main.bounds.width > 500 {
                font = UIFont.systemFont(ofSize: 29, weight: .semibold)
            } else {
                font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            }
            textAlignment = .center
            textColor = .black
            numberOfLines = 0
        case .folderDismiss:
            font = UIFont.systemFont(ofSize: 17, weight: .regular)
            textColor = UIColor(named: "orange")
            textAlignment = .left
        case .mainText:
            font = UIFont.systemFont(ofSize: 17, weight: .regular)
            textColor = .white
            textAlignment = .left
        case .alertRestore:
            font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .alertRestoreDiscription:
            font = UIFont.systemFont(ofSize: 13, weight: .regular)
            textAlignment = .center
            paragraphStyle.lineHeightMultiple = 1.42
            paragraphStyle.alignment = .center
            textColor = .white
            numberOfLines = 0
            attributedText = NSMutableAttributedString(string: local.alertRestoreDiscription, attributes: [NSAttributedString.Key.kern: -0.41, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        case .priceBot:
            if UIScreen.main.bounds.width > 500 {
                font = UIFont.systemFont(ofSize: 27, weight: .semibold)
            } else {
                font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            }
            textAlignment = .center
            textColor = .black
            numberOfLines = 0
        case .priceBotActive:
            if UIScreen.main.bounds.width > 500 {
                font = UIFont.systemFont(ofSize: 31, weight: .semibold)
            } else {
                font = UIFont.systemFont(ofSize: 22, weight: .semibold)
            }
            textAlignment = .center
            textColor = .black
            numberOfLines = 0
        case .priceTop:
            if UIScreen.main.bounds.width > 500 {
                font = UIFont.systemFont(ofSize: 25, weight: .medium)
            } else {
                font = UIFont.systemFont(ofSize: 16, weight: .medium)
            }
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .priceTopActive:
            if UIScreen.main.bounds.width > 500 {
                font = UIFont.systemFont(ofSize: 29, weight: .medium)
            } else {
                font = UIFont.systemFont(ofSize: 20, weight: .medium)
            }
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .dayBot:
            if UIScreen.main.bounds.width > 500 {
                font = UIFont.systemFont(ofSize: 25, weight: .semibold)
            } else {
                font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            }
            
            textAlignment = .center
            textColor = .black
            numberOfLines = 0
        case .dayBotActive:
            if UIScreen.main.bounds.width > 500 {
                font = UIFont.systemFont(ofSize: 29, weight: .semibold)
            } else {
                font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            }
            textAlignment = .center
            textColor = .black
            numberOfLines = 0
        case .dayTop:
            if UIScreen.main.bounds.width > 500 {
                font = UIFont.systemFont(ofSize: 23, weight: .medium)
            } else {
                font = UIFont.systemFont(ofSize: 14, weight: .medium)
            }
            
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .dayTopActive:
            if UIScreen.main.bounds.width > 500 {
                font = UIFont.systemFont(ofSize: 25, weight: .medium)
            } else {
                font = UIFont.systemFont(ofSize: 16, weight: .medium)
            }
            textAlignment = .center
            textColor = .white
            numberOfLines = 0
        case .score:
            font = UIFont.systemFont(ofSize: 22, weight: .semibold)
            textAlignment = .right
            textColor = UIColor(named: "purple")
            numberOfLines = 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIFont {
    class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        let font: UIFont
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: size)
        } else {
            font = systemFont
        }
        return font
    }
}
