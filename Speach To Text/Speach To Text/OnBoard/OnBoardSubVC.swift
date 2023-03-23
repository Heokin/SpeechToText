//
//  OnBoardSubVC.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit
import SwiftyStoreKit

class OnBoardSubVC: UICollectionViewCell {
    
    public static var id = "sub"
    //let swifty = IAPManager()
    
    var buttonDelay = UserDefaults.standard.value(forKey: "closeButtonDelay")
    var sub = UserDefaults.standard.value(forKey: "sub")
    
    var subs = ""
    
    var numberSub = UserDefaults.standard.value(forKey: "wController")
    
    var first = "com.speachtotext.1we"
    var second = "com.speachtotext.1mo"
    var third = "com.speachtotext.1ye"
    var wPrice = "$1.99"
    var mPrice = "$4.99"
    var yPrice = "$9.99"
    var spiner = UIActivityIndicatorView(style: .large)
    
    
    let space = (UIScreen.main.bounds.width - (UIScreen.main.bounds.width / 3.7128) - (UIScreen.main.bounds.width / 3.7128) - (UIScreen.main.bounds.width / 2.9762) - 32) / 2
    
    let subViewHeight = UIScreen.main.bounds.height / 6.1984
    let subViewSmallHeight = UIScreen.main.bounds.height / 5.5
    let subViewWidth = UIScreen.main.bounds.width / 3.7128
    let subViewHeightActive = UIScreen.main.bounds.height / 5.075
    let subViewWidthActive = UIScreen.main.bounds.width / 2.9762
    let subViewSmallHeightActive = UIScreen.main.bounds.height / 4.8
    let subBottom = -UIScreen.main.bounds.height / 4.5363
    let subBottomActive = -UIScreen.main.bounds.height / 4.9512
    let subSmallBottom = -UIScreen.main.bounds.height / 6.5363
    let subSmallBottomActive = -UIScreen.main.bounds.height / 6.9512
    
    
    let local = LocalizationVariables()
    
    lazy var header = Label(type: .subscribeHeader, local.subscribeHeader)
    lazy var titleView = View(type: .ads)
    lazy var titleFirst = Label(type: .subscribeTitle, local.subscribeTitleLim)
    lazy var titleSecond = Label(type: .subscribeTitle, local.subscribeTitleAds)
    lazy var firstImage = ImageView(image: .drop)
    lazy var secondImage = ImageView(image: .drop)
    
    lazy var firstSubView = View(type: .subscribeSubView)
    var firstTopLabel: UILabel?
    var firstBottomLabel: UILabel?
    lazy var firstSubPlace = View(type: .subscribeSubViewPlace)
    
    
    lazy var secondSubView = View(type: .subscribeSubView)
    var secondTopLabel: UILabel?
    var secondBottomLabel: UILabel?
    lazy var secondSubPlace = View(type: .subscribeSubViewPlace)
    
    lazy var thirdSubView = View(type: .subscribeSubView)
    var thirdTopLabel: UILabel?
    var thirdBottomLabel: UILabel?
    lazy var thirdSubPlace = View(type: .subscribeSubViewPlace)
    
    lazy var restoreView = View(type: .dismissView)
    lazy var restoreLabel = Label(type: .restore, local.buttonRestore)
    lazy var dismissView = View(type: .dismissView)
    lazy var xmark = ImageView(image: .xmark)
    
    lazy var restoreTap = UITapGestureRecognizer(target: self, action: #selector(restoreTarget))
    lazy var dismissTap = UITapGestureRecognizer(target: self, action: #selector(closeTarget))
    lazy var recognizeFirst = UITapGestureRecognizer(target: self, action: #selector(firstSub))
    lazy var recognizeSecond = UITapGestureRecognizer(target: self, action: #selector(secondSub))
    lazy var recognizeThird = UITapGestureRecognizer(target: self, action: #selector(thirdSub))
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)

            imageView.image = UIImage(named: "bgSub")
        
            
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var headerImage = ImageView(image: .bigBlueCrown)
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)

        numberSub = UserDefaults.standard.value(forKey: "wController")
        print(numberSub)
        
        NotificationCenter.default.addObserver(self, selector: #selector(methodOfReceivedNotification(notification:)), name: Notification.Name("SubscribeOk"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(restoreAlert(notification:)), name: Notification.Name("RestoreError"), object: nil)

        let js = UserDefaults.standard.value(forKey: "wSub") as? String

        if js != nil {
            do{
                if let json = js!.data(using: String.Encoding.utf8){
                    if let jsonData = try JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [String:AnyObject]{
                        print(jsonData["1"] as! String)
                        print(jsonData["2"] as! String)
                        print(jsonData["3"] as! String)
                        self.first = jsonData["1"] as! String
                        self.second = jsonData["2"] as! String
                        self.third = jsonData["3"] as! String
                        print(self.first)
                        print(self.second)
                        print(self.third)
                    }
                }
            }catch {
                print(error.localizedDescription)

            }
        }


        let q = DispatchQueue.global(qos: .default)
        q.async {
            [self] in
            
            numberSub = UserDefaults.standard.value(forKey: "wController")
            
            if (numberSub as! String == "1") {
                SwiftyStoreKit.retrieveProductsInfo([first]) { [self] result in
                    if let product = result.retrievedProducts.first {
                        wPrice = product.localizedPrice!
                        if first == "com.speachtotext.1yetr" {
                            self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeYearly)
                        } else if first == "com.speachtotext.1motr" {
                            self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeMonthly)
                        } else if first == "com.speachtotext.1wetr" {
                            self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeWeekly)
                        } else {
                            self.firstBottomLabel?.text = wPrice
                        }
                    }
                }
                
                SwiftyStoreKit.retrieveProductsInfo([second]) { [self] result in
                    if let product = result.retrievedProducts.first {
                        mPrice = product.localizedPrice!
                        if second == "com.speachtotext.1yetr" {
                            subs = "com.speachtotext.1yetr"
                            self.secondBottomLabel?.attributedText = activeBottom(mPrice, local.subscribeYearly)
                        } else if second == "com.speachtotext.1motr" {
                            subs = "com.speachtotext.1motr"
                            self.secondBottomLabel?.attributedText = activeBottom(mPrice, local.subscribeMonthly)
                        } else if second == "com.speachtotext.1wetr" {
                            subs = "com.speachtotext.1wetr"
                            self.secondBottomLabel?.attributedText = activeBottom(mPrice, local.subscribeWeekly)
                        } else if second == "com.speachtotext.1we" {
                            subs = "com.speachtotext.1we"
                            self.secondBottomLabel?.text = mPrice
                        } else if second == "com.speachtotext.1mo" {
                            subs = "com.speachtotext.1mo"
                            self.secondBottomLabel?.text = mPrice
                        } else if second == "com.speachtotext.1ye" {
                            subs = "com.speachtotext.1ye"
                            self.secondBottomLabel?.text = mPrice
                        }
                        
                        UserDefaults.standard.set(subs, forKey: "sub")
                    }
                }
                
                SwiftyStoreKit.retrieveProductsInfo([third]) { [self] result in
                    if let product = result.retrievedProducts.first {
                        yPrice = product.localizedPrice!
                        if third == "com.speachtotext.1yetr" {
                            self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeYearly)
                        } else if third == "com.speachtotext.1motr" {
                            self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeMonthly)
                        } else if third == "com.speachtotext.1wetr" {
                            self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeWeekly)
                        } else {
                            self.thirdBottomLabel?.text = yPrice
                        }
                    }
                }
                
            } else {
                SwiftyStoreKit.retrieveProductsInfo([first]) { [self] result in
                    if let product = result.retrievedProducts.first {
                        wPrice = product.localizedPrice!
                        if first == "com.speachtotext.1yetr" {
                            self.firstTopLabel?.attributedText = activeTop(wPrice, local.subscribeWeekly)
                        } else if first == "com.speachtotext.1motr" {
                            self.firstTopLabel?.attributedText = activeTop(wPrice, local.subscribeWeekly)
                        } else if first == "com.speachtotext.1wetr" {
                            self.firstTopLabel?.attributedText = activeTop(wPrice, local.subscribeWeekly)
                        } else {
                            self.firstTopLabel?.text = wPrice
                        }
                    }
                }
                
                SwiftyStoreKit.retrieveProductsInfo([second]) { [self] result in
                    if let product = result.retrievedProducts.first {
                        mPrice = product.localizedPrice!
                        if second == "com.speachtotext.1yetr" {
                            subs = "com.speachtotext.1yetr"
                            self.secondTopLabel?.attributedText = noActiveTop(mPrice, local.subscribeYearly)
                        } else if second == "com.speachtotext.1motr" {
                            subs = "com.speachtotext.1motr"
                            self.secondTopLabel?.attributedText = noActiveTop(mPrice, local.subscribeMonthly)
                        } else if second == "com.speachtotext.1wetr" {
                            subs = "com.speachtotext.1wetr"
                            self.secondTopLabel?.attributedText = noActiveTop(mPrice, local.subscribeWeekly)
                        } else if second == "com.speachtotext.1we" {
                            subs = "com.speachtotext.1we"
                            self.secondTopLabel?.text = mPrice
                        } else if second == "com.speachtotext.1mo" {
                            subs = "com.speachtotext.1mo"
                            self.secondTopLabel?.text = mPrice
                        } else if second == "com.speachtotext.1ye" {
                            subs = "com.speachtotext.1ye"
                            self.secondTopLabel?.text = mPrice
                        }
                        
                        UserDefaults.standard.set(subs, forKey: "sub")
                    }
                }
                
                SwiftyStoreKit.retrieveProductsInfo([third]) { [self] result in
                    if let product = result.retrievedProducts.first {
                        yPrice = product.localizedPrice!
                        if third == "com.speachtotext.1yetr" {
                            self.thirdTopLabel?.attributedText = noActiveTop(yPrice, local.subscribeYearly)
                        } else if third == "com.speachtotext.1motr" {
                            self.thirdTopLabel?.attributedText = noActiveTop(yPrice, local.subscribeMonthly)
                        } else if third == "com.speachtotext.1wetr" {
                            self.thirdTopLabel?.attributedText = noActiveTop(yPrice, local.subscribeWeekly)
                        } else {
                            self.thirdTopLabel?.text = yPrice
                        }
                    }
                }
            }
        }
        if (numberSub as! String == "1") {
            if self.first == "com.speachtotext.1wetr"{
                self.firstBottomLabel = LabelDual(type: .subscribeBottomPrice, wPrice + "\n", local.subscribeWeekly)
                self.firstTopLabel = Label(type: .dayTop, local.subscribeFreeTrial)
            } else if self.first == "com.speachtotext.1yetr"{
                self.firstBottomLabel = LabelDual(type: .subscribeBottomPrice, yPrice + "\n", local.subscribeYearly)
                self.firstTopLabel = Label(type: .dayTop, local.subscribeFreeTrial)
            } else if self.first == "com.speachtotext.1motr"{
                self.firstBottomLabel = LabelDual(type: .subscribeBottomPrice, mPrice + "\n", local.subscribeMonthly)
                self.firstTopLabel = Label(type: .dayTop, local.subscribeFreeTrial)
            } else if self.first == "com.speachtotext.1we"{
                self.firstBottomLabel = Label(type: .priceBot, wPrice)
                self.firstTopLabel = Label(type: .dayTop,  local.subscribeWeekly)
            } else if self.first == "com.speachtotext.1ye"{
                self.firstBottomLabel = Label(type: .priceBot, yPrice)
                self.firstTopLabel = Label(type: .dayTop, local.subscribeYearly)
            } else if self.first == "com.speachtotext.1mo"{
                self.firstBottomLabel = Label(type: .priceBot, mPrice)
                self.firstTopLabel = Label(type: .dayTop, local.subscribeMonthly)
            }
            
            
            if self.second == "com.speachtotext.1wetr"{
                self.secondBottomLabel = LabelDual(type: .subscribeBottomPrice, wPrice + "\n", local.subscribeWeekly)
                self.secondTopLabel = Label(type: .dayTop, local.subscribeFreeTrial)
            } else if self.second == "com.speachtotext.1yetr"{
                self.secondBottomLabel = LabelDual(type: .subscribeBottomPrice, yPrice + "\n", local.subscribeYearly)
                self.secondTopLabel = Label(type: .dayTop, local.subscribeFreeTrial)
            } else if self.second == "com.speachtotext.1motr"{
                self.secondBottomLabel = LabelDual(type: .subscribeBottomPrice, mPrice + "\n", local.subscribeMonthly)
                self.secondTopLabel = Label(type: .dayTop, local.subscribeFreeTrial)
            } else if self.second == "com.speachtotext.1we"{
                self.secondBottomLabel = Label(type: .priceBot, wPrice)
                self.secondTopLabel = Label(type: .dayTop, local.subscribeWeekly)
            } else if self.second == "com.speachtotext.1ye"{
                self.secondBottomLabel = Label(type: .priceBot, yPrice)
                self.secondTopLabel = Label(type: .dayTop, local.subscribeYearly)
            } else if self.second == "com.speachtotext.1mo"{
                self.secondBottomLabel = Label(type: .priceBot, mPrice)
                self.secondTopLabel = Label(type: .dayTop, local.subscribeMonthly)
            }
            
            
            if self.third == "com.speachtotext.1wetr"{
                self.thirdBottomLabel = LabelDual(type: .subscribeBottomPrice, wPrice + "\n", local.subscribeWeekly)
                self.thirdTopLabel = Label(type: .dayTop, local.subscribeFreeTrial)
            } else if self.third == "com.speachtotext.1yetr"{
                self.thirdBottomLabel = LabelDual(type: .subscribeBottomPrice, yPrice + "\n", local.subscribeYearly)
                self.thirdTopLabel = Label(type: .dayTop, local.subscribeFreeTrial)
            } else if self.third == "com.speachtotext.1motr"{
                self.thirdBottomLabel = LabelDual(type: .subscribeBottomPrice, mPrice + "\n", local.subscribeMonthly)
                self.thirdTopLabel = Label(type: .dayTop, local.subscribeFreeTrial)
            } else if self.third == "com.speachtotext.1we"{
                self.thirdBottomLabel = Label(type: .priceBot, wPrice)
                self.thirdTopLabel = Label(type: .dayTop, local.subscribeWeekly)
            } else if self.third == "com.speachtotext.1ye"{
                self.thirdBottomLabel = Label(type: .priceBot, yPrice)
                self.thirdTopLabel = Label(type: .dayTop, local.subscribeYearly)
            } else if self.third == "com.speachtotext.1mo"{
                self.thirdBottomLabel = Label(type: .priceBot, mPrice)
                self.thirdTopLabel = Label(type: .dayTop, local.subscribeMonthly)
            }
        } else {
            if self.first == "com.speachtotext.1wetr"{
                self.firstBottomLabel = Label(type: .dayBot, local.subscribeFreeTrial)
                self.firstTopLabel = LabelDual(type: .subscribeTopPrice, wPrice, local.subscribeWeekly)
            } else if self.first == "com.speachtotext.1yetr"{
                self.firstBottomLabel = Label(type: .dayBot, local.subscribeFreeTrial)
                self.firstTopLabel = LabelDual(type: .subscribeTopPrice, yPrice, local.subscribeYearly)
            } else if self.first == "com.speachtotext.1motr"{
                self.firstBottomLabel = Label(type: .dayBot, local.subscribeFreeTrial)
                self.firstTopLabel = LabelDual(type: .subscribeTopPrice, mPrice, local.subscribeMonthly)
            } else if self.first == "com.speachtotext.1we"{
                self.firstBottomLabel = Label(type: .dayBot, local.subscribeWeekly)
                self.firstTopLabel = Label(type: .priceTop,  local.subscribeWeekly)
            } else if self.first == "com.speachtotext.1ye"{
                self.firstBottomLabel = Label(type: .dayBot, local.subscribeYearly)
                self.firstTopLabel = Label(type: .priceTop, local.subscribeYearly)
            } else if self.first == "com.speachtotext.1mo"{
                self.firstBottomLabel = Label(type: .dayBot, local.subscribeMonthly)
                self.firstTopLabel = Label(type: .priceTop, mPrice)
            }
            
            
            if self.second == "com.speachtotext.1wetr"{
                self.secondBottomLabel = Label(type: .dayBotActive, local.subscribeFreeTrial)
                self.secondTopLabel = LabelDual(type: .subscribeTopPriceActive, wPrice, local.subscribeWeekly)
            } else if self.second == "com.speachtotext.1yetr"{
                self.secondBottomLabel = Label(type: .dayBotActive, local.subscribeFreeTrial)
                self.secondTopLabel = LabelDual(type: .subscribeTopPriceActive, yPrice, local.subscribeYearly)
            } else if self.second == "com.speachtotext.1motr"{
                self.secondBottomLabel = Label(type: .dayBotActive, local.subscribeFreeTrial)
                self.secondTopLabel = LabelDual(type: .subscribeTopPriceActive, mPrice, local.subscribeMonthly)
            } else if self.second == "com.speachtotext.1we"{
                self.secondBottomLabel = Label(type: .dayBotActive, local.subscribeWeekly)
                self.secondTopLabel = Label(type: .priceTopActive, wPrice)
            } else if self.second == "com.speachtotext.1ye"{
                self.secondBottomLabel = Label(type: .dayBotActive, local.subscribeYearly)
                self.secondTopLabel = Label(type: .priceTopActive, yPrice)
            } else if self.second == "com.speachtotext.1mo"{
                self.secondBottomLabel = Label(type: .dayBotActive, local.subscribeMonthly)
                self.secondTopLabel = Label(type: .priceTopActive, mPrice)
            }
            
            
            if self.third == "com.speachtotext.1wetr"{
                self.thirdBottomLabel = Label(type: .dayBot, local.subscribeFreeTrial)
                self.thirdTopLabel = LabelDual(type: .subscribeTopPrice, wPrice, local.subscribeWeekly)
            } else if self.third == "com.speachtotext.1yetr"{
                self.thirdBottomLabel = Label(type: .dayBot, local.subscribeFreeTrial)
                self.thirdTopLabel = LabelDual(type: .subscribeTopPrice, yPrice, local.subscribeYearly)
            } else if self.third == "com.speachtotext.1motr"{
                self.thirdBottomLabel = Label(type: .dayBot, local.subscribeFreeTrial)
                self.thirdTopLabel = LabelDual(type: .subscribeTopPrice, mPrice, local.subscribeMonthly)
            } else if self.third == "com.speachtotext.1we"{
                self.thirdBottomLabel = Label(type: .dayBot, local.subscribeWeekly)
                self.thirdTopLabel = Label(type: .priceTop, wPrice)
            } else if self.third == "com.speachtotext.1ye"{
                self.thirdBottomLabel = Label(type: .dayBot, local.subscribeYearly)
                self.thirdTopLabel = Label(type: .priceTop, yPrice)
            } else if self.third == "com.speachtotext.1mo"{
                self.thirdBottomLabel = Label(type: .dayBot, local.subscribeMonthly)
                self.thirdTopLabel = Label(type: .priceTop, mPrice)
            }
        }
        
        self.setup()
        self.setupLogic()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
