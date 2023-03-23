//
//  OnBoardSubAttribure.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit

extension OnBoardSubVC {
    
    func activeBottom(_ text: String, _ period: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        var header: NSAttributedString!
        var wayText: NSAttributedString!
        
        if UIScreen.main.bounds.width > 500 {
            header = NSAttributedString(
                string: text + "\n",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 31, weight: .semibold)]
            )
            wayText = NSAttributedString(
                string: period,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .medium)]
            )
        } else {
            header = NSAttributedString(
                string: text + "\n",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .semibold)]
            )
            wayText = NSAttributedString(
                string: period,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .medium)]
            )
        }
        
        attString.append(header)
        attString.append(wayText)
        
        return attString
    }
    
    func noActiveBottom(_ text: String, _ period: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        var header: NSAttributedString!
        var wayText: NSAttributedString!
        
        if UIScreen.main.bounds.width > 500 {
            header = NSAttributedString(
                string: text + "\n",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 27, weight: .semibold)]
            )
            wayText = NSAttributedString(
                string: period,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .medium)]
            )
        } else {
            header = NSAttributedString(
                string: text + "\n",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .semibold)]
            )
            wayText = NSAttributedString(
                string: period,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .medium)]
            )
        }
        
        attString.append(header)
        attString.append(wayText)
        
        return attString
    }
    
    func activeTop(_ text: String, _ period: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        var header: NSAttributedString!
        var wayText: NSAttributedString!
        
        if UIScreen.main.bounds.width > 500 {
            header = NSAttributedString(
                string: text + "\n",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 27, weight: .semibold)]
            )
            wayText = NSAttributedString(
                string: period,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 27, weight: .semibold)]
            )
        } else {
            header = NSAttributedString(
                string: text + "\n",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)]
            )
            wayText = NSAttributedString(
                string: period,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)]
            )
        }
        
        attString.append(header)
        attString.append(wayText)
        
        return attString
    
    }
    
    func noActiveTop(_ text: String, _ period: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        var header: NSAttributedString!
        var wayText: NSAttributedString!
        
        if UIScreen.main.bounds.width > 500 {
            header = NSAttributedString(
                string: text + "\n",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
            )
            wayText = NSAttributedString(
                string: period,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
            )
        } else {
            header = NSAttributedString(
                string: text + "\n",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold)]
            )
            wayText = NSAttributedString(
                string: period,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold)]
            )
        }
        
        attString.append(header)
        attString.append(wayText)
        
        return attString
    }
    
    func dayTop(_ text: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        
        var header: NSAttributedString!
        
        if UIScreen.main.bounds.width > 500 {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 23, weight: .semibold)]
            )
        } else {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold)]
            )
        }
        
        attString.append(header)
        
        return attString
    }
    
    func dayTopActive(_ text: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        
        var header: NSAttributedString!
        
        if UIScreen.main.bounds.width > 500 {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
            )
        } else {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16, weight: .semibold)]
            )
        }
        
        attString.append(header)
        
        return attString
    }
    
    func priceTop(_ text: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        
        var header: NSAttributedString!
        
        if UIScreen.main.bounds.width > 500 {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .medium)]
            )
        } else {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium)]
            )
        }
        
        attString.append(header)
        
        return attString
    }
    
    func priceTopActive(_ text: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        
        var header: NSAttributedString!
        
        if UIScreen.main.bounds.width > 500 {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 29, weight: .medium)]
            )
        } else {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium)]
            )
        }
        
        attString.append(header)
        
        return attString
    }
    

    func dayBottom(_ text: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        
        var header: NSAttributedString!
        
        if UIScreen.main.bounds.width > 500 {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
            )
        } else {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)]
            )
        }
        
        attString.append(header)
        
        return attString
    }
    
    func dayBottomActive(_ text: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        
        var header: NSAttributedString!
        
        if UIScreen.main.bounds.width > 500 {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 29, weight: .semibold)]
            )
        } else {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .semibold)]
            )
        }
        
        attString.append(header)
        
        return attString
    }
    
    func priceBottom(_ text: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        
        var header: NSAttributedString!
        
        if UIScreen.main.bounds.width > 500 {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 27, weight: .medium)]
            )
        } else {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .medium)]
            )
        }
        
        attString.append(header)
        
        return attString
    }
    
    func priceBottomActive(_ text: String) -> NSMutableAttributedString {
        let attString = NSMutableAttributedString()
        
        
        var header: NSAttributedString!
        
        if UIScreen.main.bounds.width > 500 {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 31, weight: .semibold)]
            )
        } else {
            header = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "black"),
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .semibold)]
            )
        }
        
        attString.append(header)
        
        return attString
    }
}
