//
//  OnBoardSubUI.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit

extension OnBoardSubVC  {
    
    func setup() {
        
        backgroundColor = .white
        
        //MARK: add Subview
        
        addSubview(imageView)
        
        addSubview(header)
        addSubview(titleFirst)
        addSubview(firstImage)
        addSubview(titleSecond)
        addSubview(secondImage)
        
        addSubview(restoreView)
        addSubview(restoreLabel)
        addSubview(dismissView)
        addSubview(xmark)
        
        addSubview(firstSubView)
        firstSubView.addSubview(firstSubPlace)
        firstSubPlace.addSubview(firstTopLabel!)
        firstSubView.addSubview(firstBottomLabel!)
        
        addSubview(secondSubView)
        secondSubView.addSubview(secondSubPlace)
        secondSubPlace.addSubview(secondTopLabel!)
        secondSubView.addSubview(secondBottomLabel!)
        
        addSubview(thirdSubView)
        thirdSubView.addSubview(thirdSubPlace)
        thirdSubPlace.addSubview(thirdTopLabel!)
        thirdSubView.addSubview(thirdBottomLabel!)
        
        xmark.isHidden = true
        
        //MARK: Add target
        firstSubView.addGestureRecognizer(recognizeFirst)
        secondSubView.addGestureRecognizer(recognizeSecond)
        thirdSubView.addGestureRecognizer(recognizeThird)
        dismissView.addGestureRecognizer(dismissTap)
        restoreView.addGestureRecognizer(restoreTap)
        
        firstTopLabel?.textColor = .white
        secondTopLabel?.textColor = .white
        thirdTopLabel?.textColor = .white
        
        firstSubView.layer.borderWidth = 0.5
        firstSubView.layer.borderColor = UIColor.clear.cgColor

        secondSubView.layer.borderWidth = 0.5
        secondSubView.layer.borderColor = UIColor(named: "blue")?.cgColor

        thirdSubView.layer.borderWidth = 0.5
        thirdSubView.layer.borderColor = UIColor.clear.cgColor
        
        addSubview(headerImage)
                
        //MARK: Add constraint
        
        imageView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        restoreView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(19)
            make.left.equalToSuperview()
            make.width.equalTo(110)
        }
        
        restoreLabel.snp.makeConstraints { make in
            make.centerY.equalTo(restoreView.snp.centerY)
            make.left.equalTo(restoreView.snp.left).offset(15)
        }
        
        header.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UIScreen.main.bounds.height / 2.85)
            make.centerX.equalToSuperview()
        }
        
        titleFirst.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(UIScreen.main.bounds.height / 25.375)
            make.centerX.equalToSuperview().offset(20)
        }
        
        firstImage.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(UIScreen.main.bounds.height / 25.375)
            make.right.equalTo(titleFirst.snp.left).offset(-20)
        }
        
        titleSecond.snp.makeConstraints { make in
            make.top.equalTo(titleFirst.snp.bottom).offset(UIScreen.main.bounds.height / 50.75)
            make.left.equalTo(titleFirst.snp.left)
        }
        
        secondImage.snp.makeConstraints { make in
            make.top.equalTo(titleFirst.snp.bottom).offset(UIScreen.main.bounds.height / 50.75)
            make.right.equalTo(titleFirst.snp.left).offset(-20)
        }
        
        dismissView.snp.makeConstraints { make in
            make.centerY.equalTo(restoreView.snp.centerY)
            make.right.equalToSuperview()
            make.width.equalTo(110)
        }
        
        xmark.snp.makeConstraints { make in
            make.centerY.equalTo(dismissView.snp.centerY)
            make.right.equalTo(dismissView.snp.right).offset(-15)
        }
        
        headerImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(header.snp.top).offset(-50)
        }
        
        //MARK: Constraints
        
        if UIScreen.main.bounds.height < 668 {
            smallUI()
        } else {
            bigUI()
        }
        
        
    }
    
}


extension OnBoardSubVC  {
    
    func smallUI() {
        
        firstSubView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(subSmallBottom)
            make.width.equalTo(subViewWidth)
            make.height.equalTo(subViewSmallHeight)
            make.left.equalToSuperview().offset(16)
        }
        
        firstSubPlace.snp.makeConstraints { make in
            make.width.equalTo(subViewWidth)
            make.height.equalTo(UIScreen.main.bounds.height / 11)
        }
        
        firstTopLabel!.snp.makeConstraints { make in
            make.width.equalToSuperview()
            //make.height.equalToSuperview().multipliedBy(0.5)
            make.center.equalToSuperview()
        }
        
        firstBottomLabel!.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
        }
        
        secondSubView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(subSmallBottomActive)
            make.width.equalTo(subViewWidthActive)
            make.height.equalTo(subViewSmallHeightActive)
            make.left.equalTo(firstSubView.snp.right).offset(8)
        }
        
        secondSubPlace.snp.makeConstraints { make in
            make.width.equalTo(subViewWidthActive)
            make.height.equalTo(UIScreen.main.bounds.height / 11.6)
        }
        
        secondTopLabel!.snp.makeConstraints { make in
            make.width.equalToSuperview()
            //make.height.equalToSuperview().multipliedBy(0.5)
            make.center.equalToSuperview()
        }
        
        secondBottomLabel!.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.4)
            make.centerX.equalToSuperview()
        }
        
        thirdSubView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(subSmallBottom)
            make.width.equalTo(subViewWidth)
            make.height.equalTo(subViewSmallHeight)
            make.right.equalToSuperview().offset(-16)
        }
        
        thirdSubPlace.snp.makeConstraints { make in
            make.width.equalTo(subViewWidth)
            make.height.equalTo(UIScreen.main.bounds.height / 11)
        }
        
        thirdTopLabel!.snp.makeConstraints { make in
            make.width.equalToSuperview()
            //make.height.equalToSuperview().multipliedBy(0.5)
            make.center.equalToSuperview()
        }
        
        thirdBottomLabel!.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
        }
 
    }
    
    func bigUI() {
        
        firstSubView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(subBottom)
            make.width.equalTo(subViewWidth)
            make.height.equalTo(subViewHeight)
            make.left.equalToSuperview().offset(16)
        }
        
        firstSubPlace.snp.makeConstraints { make in
            make.width.equalTo(subViewWidth)
            make.height.equalTo(UIScreen.main.bounds.height / 12.3969)
        }
        
        firstTopLabel!.snp.makeConstraints { make in
            make.width.equalToSuperview()
            //make.height.equalToSuperview().multipliedBy(0.5)
            make.center.equalToSuperview()
        }
        
        firstBottomLabel!.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
        }
        
        secondSubView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(subBottomActive)
            make.width.equalTo(subViewWidthActive)
            make.height.equalTo(subViewHeightActive)
            make.left.equalTo(firstSubView.snp.right).offset(space)
        }
        
        secondSubPlace.snp.makeConstraints { make in
            make.width.equalTo(subViewWidthActive)
            make.height.equalTo(UIScreen.main.bounds.height / 11.6)
        }
        
        secondTopLabel!.snp.makeConstraints { make in
            make.width.equalToSuperview()
            //make.height.equalToSuperview().multipliedBy(0.5)
            make.center.equalToSuperview()
        }
        
        secondBottomLabel!.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.4)
            make.centerX.equalToSuperview()
        }
        
        thirdSubView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(subBottom)
            make.width.equalTo(subViewWidth)
            make.height.equalTo(subViewHeight)
            make.right.equalToSuperview().offset(-16)
        }
        
        thirdSubPlace.snp.makeConstraints { make in
            make.width.equalTo(subViewWidth)
            make.height.equalTo(UIScreen.main.bounds.height / 12.3969)
        }
        
        thirdTopLabel!.snp.makeConstraints { make in
            make.width.equalToSuperview()
            //make.height.equalToSuperview().multipliedBy(0.5)
            make.center.equalToSuperview()
        }
        
        thirdBottomLabel!.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
        }
    }
    
    
    func firstSmall() {
   
        firstSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subSmallBottomActive)
            make.width.equalTo(subViewWidthActive)
            make.height.equalTo(subViewSmallHeightActive)
            make.left.equalToSuperview().offset(16)
        }
        
        firstSubPlace.snp.remakeConstraints { make in
            make.width.equalTo(subViewWidthActive)
            make.height.equalTo(UIScreen.main.bounds.height / 11.6)
        }
        
        firstBottomLabel!.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.4)
            make.centerX.equalToSuperview()
        }
        
        secondSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subSmallBottom)
            make.left.equalTo(firstSubView.snp.right).offset(8)
            make.height.equalTo(subViewSmallHeight)
            make.width.equalTo(subViewWidth)
        }
        
        secondSubPlace.snp.remakeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.height / 11)
            make.width.equalTo(subViewWidth)
        }
        
        secondBottomLabel!.snp.remakeConstraints { make in
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        thirdSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subSmallBottom)
            make.height.equalTo(subViewSmallHeight)
            make.width.equalTo(subViewWidth)
            make.right.equalToSuperview().offset(-16)
        }
        
        thirdSubPlace.snp.remakeConstraints { make in
            make.width.equalTo(subViewWidth)
            make.height.equalTo(UIScreen.main.bounds.height / 11.6)
        }
        
        thirdBottomLabel!.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
        }
        
    }
    
    func firstBig() {
        
        firstSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subBottomActive)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(subViewHeightActive)
            make.width.equalTo(subViewWidthActive)
        }
        
        firstSubPlace.snp.remakeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.height / 11.6)
            make.width.equalTo(subViewWidthActive)
        }
        
        firstBottomLabel!.snp.remakeConstraints { make in
            make.height.equalToSuperview().multipliedBy(1.4)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        secondSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subBottom)
            make.left.equalTo(firstSubView.snp.right).offset(space)
            make.height.equalTo(subViewHeight)
            make.width.equalTo(subViewWidth)
        }
        
        secondSubPlace.snp.remakeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.height / 12.3969)
            make.width.equalTo(subViewWidth)
        }
        
        secondBottomLabel!.snp.remakeConstraints { make in
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        thirdSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subBottom)
            make.width.equalTo(subViewWidth)
            make.height.equalTo(subViewHeight)
            make.right.equalToSuperview().offset(-16)
        }
        
        thirdSubPlace.snp.remakeConstraints { make in
            make.width.equalTo(subViewWidth)
            make.height.equalTo(UIScreen.main.bounds.height / 12.3969)
        }
        
        thirdBottomLabel!.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
        }
    }
    
    func secondSmall() {
   
        firstSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subSmallBottom)
            make.width.equalTo(subViewWidth)
            make.height.equalTo(subViewSmallHeight)
            make.left.equalToSuperview().offset(16)
        }
        
        firstSubPlace.snp.remakeConstraints { make in
            make.width.equalTo(subViewWidth)
            make.height.equalTo(UIScreen.main.bounds.height / 11)
        }
        
        firstBottomLabel!.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
        }
        
        secondSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subSmallBottomActive)
            make.width.equalTo(subViewWidthActive)
            make.height.equalTo(subViewSmallHeightActive)
            make.left.equalTo(firstSubView.snp.right).offset(8)
        }
        
        secondSubPlace.snp.remakeConstraints { make in
            make.width.equalTo(subViewWidthActive)
            make.height.equalTo(UIScreen.main.bounds.height / 11.6)
        }
        
        secondBottomLabel!.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.4)
            make.centerX.equalToSuperview()
        }
        
        thirdSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subSmallBottom)
            make.width.equalTo(subViewWidth)
            make.height.equalTo(subViewSmallHeight)
            make.right.equalToSuperview().offset(-16)
        }
        
        thirdSubPlace.snp.remakeConstraints { make in
            make.width.equalTo(subViewWidth)
            make.height.equalTo(UIScreen.main.bounds.height / 11)
        }
        
        thirdBottomLabel!.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
        }
        
    }
    
    func secondBig() {
        
        firstSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subBottom)
            make.width.equalTo(subViewWidth)
            make.height.equalTo(subViewHeight)
            make.left.equalToSuperview().offset(16)
        }
        
        firstSubPlace.snp.remakeConstraints { make in
            make.width.equalTo(subViewWidth)
            make.height.equalTo(UIScreen.main.bounds.height / 12.3969)
        }
        
        firstBottomLabel!.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
        }
        
        secondSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subBottomActive)
            make.width.equalTo(subViewWidthActive)
            make.height.equalTo(subViewHeightActive)
            make.left.equalTo(firstSubView.snp.right).offset(space)
        }
        
        secondSubPlace.snp.remakeConstraints { make in
            make.width.equalTo(subViewWidthActive)
            make.height.equalTo(UIScreen.main.bounds.height / 11.6)
        }
        
        secondBottomLabel!.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.4)
            make.centerX.equalToSuperview()
        }
        
        thirdSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subBottom)
            make.width.equalTo(subViewWidth)
            make.height.equalTo(subViewHeight)
            make.right.equalToSuperview().offset(-16)
        }
        
        thirdSubPlace.snp.remakeConstraints { make in
            make.width.equalTo(subViewWidth)
            make.height.equalTo(UIScreen.main.bounds.height / 12.3969)
        }
        
        thirdBottomLabel!.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
        }
    }

    func thirdSmall() {
        
        firstSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subSmallBottom)
            make.width.equalTo(subViewWidth)
            make.height.equalTo(subViewSmallHeight)
            make.left.equalToSuperview().offset(16)
        }
        
        firstSubPlace.snp.remakeConstraints { make in
            make.width.equalTo(subViewWidth)
            make.height.equalTo(UIScreen.main.bounds.height / 11)
        }
        
        firstBottomLabel!.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
        }
        
        secondSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subSmallBottom)
            make.left.equalTo(firstSubView.snp.right).offset(8)
            make.height.equalTo(subViewSmallHeight)
            make.width.equalTo(subViewWidth)
        }
        
        secondSubPlace.snp.remakeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.height / 11)
            make.width.equalTo(subViewWidth)
        }
        
        secondBottomLabel!.snp.remakeConstraints { make in
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        thirdSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subSmallBottomActive)
            make.width.equalTo(subViewWidthActive)
            make.height.equalTo(subViewSmallHeightActive)
            make.right.equalToSuperview().offset(-16)
        }
        
        thirdSubPlace.snp.remakeConstraints { make in
            make.width.equalTo(subViewWidthActive)
            make.height.equalTo(UIScreen.main.bounds.height / 11.6)
        }
        
        thirdBottomLabel!.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.4)
            make.centerX.equalToSuperview()
        }
    }
    
    func thirdBig() {
        
        firstSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subBottom)
            make.width.equalTo(subViewWidth)
            make.height.equalTo(subViewHeight)
            make.left.equalToSuperview().offset(16)
        }
        
        firstSubPlace.snp.remakeConstraints { make in
            make.width.equalTo(subViewWidth)
            make.height.equalTo(UIScreen.main.bounds.height / 12.3969)
        }
        
        firstBottomLabel!.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
        }
        
        secondSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subBottom)
            make.width.equalTo(subViewWidth)
            make.height.equalTo(subViewHeight)
            make.left.equalTo(firstSubView.snp.right).offset(space)
        }
        
        secondSubPlace.snp.remakeConstraints { make in
            make.width.equalTo(subViewWidth)
            make.height.equalTo(UIScreen.main.bounds.height / 12.3969)
        }
        
        secondBottomLabel!.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.5)
            make.centerX.equalToSuperview()
        }
        
        thirdSubView.snp.remakeConstraints { make in
            make.bottom.equalToSuperview().offset(subBottomActive)
            make.width.equalTo(subViewWidthActive)
            make.height.equalTo(subViewHeightActive)
            make.right.equalToSuperview().offset(-16)
        }
        
        thirdSubPlace.snp.remakeConstraints { make in
            make.width.equalTo(subViewWidthActive)
            make.height.equalTo(UIScreen.main.bounds.height / 11.6)
        }
        
        thirdBottomLabel!.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.4)
            make.centerX.equalToSuperview()
        }
    }
}
