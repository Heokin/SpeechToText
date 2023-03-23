//
//  LabelDualEx.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit

class LabelDual: UILabel {
    
    enum LabelType {
        
        case boardingHeader
        case alertText
        
        case subscribeTopPrice
        case subscribeTopPriceActive
        case subscribeBottomPrice
        case subscribeBottomPriceActive
        
    }
    
    let local = LocalizationVariables()
    
    var paragraphStyle = NSMutableParagraphStyle()
    
    init(type: LabelType, _ text: String?, _ subHelper: String?) {
        
        super.init(frame: .zero)
        self.text = text
        translatesAutoresizingMaskIntoConstraints = false
        
        switch type {
            
        case .alertText:
            font = UIFont(name: "Nunito-Regular", size: 13)
            textAlignment = .center
            
            let attString = NSMutableAttributedString()
            var header: NSAttributedString!
            var wayText: NSAttributedString!
            
            paragraphStyle.lineHeightMultiple = 1.17
            paragraphStyle.alignment = .center
            
            numberOfLines = 0
            header = NSAttributedString(
                string: text!+"\n",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
                             NSAttributedString.Key.paragraphStyle: paragraphStyle]
            )
            wayText = NSAttributedString(
                string: subHelper!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
                             NSAttributedString.Key.paragraphStyle: paragraphStyle]
            )
            
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            
        case .boardingHeader:
            let attString = NSMutableAttributedString()
            var header: NSAttributedString!
            var wayText: NSAttributedString!
            
            paragraphStyle.lineHeightMultiple = 1.17
            
            font = UIFont.rounded(ofSize: 40, weight: .bold)
            textColor = .black
            numberOfLines = 0
            header = NSAttributedString(
                string: text!+"\n",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "blue"),
                             NSAttributedString.Key.paragraphStyle: paragraphStyle,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40, weight: .bold)
                            ]
            )
            wayText = NSAttributedString(
                string: subHelper!,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.paragraphStyle: paragraphStyle,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium)
                            ]
            )
            
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            
            textAlignment = .center
            
            centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
            
        case .subscribeTopPrice:
            let attString = NSMutableAttributedString()
            var header: NSAttributedString!
            var wayText: NSAttributedString!
            
            if UIScreen.main.bounds.width > 500 {
                header = NSAttributedString(
                    string: text! + "\n",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 23, weight: .semibold)]
                )
                wayText = NSAttributedString(
                    string: subHelper!,
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 23, weight: .semibold)]
                )
            } else {
                header = NSAttributedString(
                    string: text! + "\n",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold)]
                )
                wayText = NSAttributedString(
                    string: subHelper!,
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold)]
                )
            }
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .black
            numberOfLines = 0
        case .subscribeTopPriceActive:
            let attString = NSMutableAttributedString()
            var header: NSAttributedString!
            var wayText: NSAttributedString!
            
            if UIScreen.main.bounds.width > 500 {
                header = NSAttributedString(
                    string: text! + "\n",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
                )
                wayText = NSAttributedString(
                    string: subHelper!,
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
                )
            } else {
                header = NSAttributedString(
                    string: text! + "\n",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)]
                )
                wayText = NSAttributedString(
                    string: subHelper!,
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)]
                )
            }
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .black
            numberOfLines = 0
            
        case .subscribeBottomPrice:
            let attString = NSMutableAttributedString()
            var header: NSAttributedString!
            var wayText: NSAttributedString!
            
            if UIScreen.main.bounds.width > 500 {
                header = NSAttributedString(
                    string: text! + "\n",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 27, weight: .semibold)]
                )
                wayText = NSAttributedString(
                    string: subHelper!,
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .medium)]
                )
            } else {
                header = NSAttributedString(
                    string: text! + "\n",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .semibold)]
                )
                wayText = NSAttributedString(
                    string: subHelper!,
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .medium)]
                )
            }
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .black
            numberOfLines = 0
        case .subscribeBottomPriceActive:
            let attString = NSMutableAttributedString()
            var header: NSAttributedString!
            var wayText: NSAttributedString!
            
            if UIScreen.main.bounds.width > 500 {
                header = NSAttributedString(
                    string: text! + "\n",
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 31, weight: .semibold)]
                )
                wayText = NSAttributedString(
                    string: subHelper!,
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26, weight: .medium)]
                )
            } else {
                header = NSAttributedString(
                    string: text! + "\n" ,
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .semibold)]
                )
                wayText = NSAttributedString(
                    string: subHelper!,
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.black,
                                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .medium)]
                )
            }
            
            attString.append(header)
            attString.append(wayText)
            attributedText = attString
            textAlignment = .center
            textColor = .black
            numberOfLines = 0
            
            
            
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
