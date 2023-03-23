//
//  SubLogic.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit

extension SubVC {
    
    @objc func sub() {
        if subs != ""{
//            switch subs {
//            case "com.speachtotext.1wetr": swifty.purchase(purchase: .weekTrial)
//            case "com.speachtotext.1motr": swifty.purchase(purchase: .mounthTrial)
//            case "com.speachtotext.1yetr": swifty.purchase(purchase: .yearTrial)
//            case "com.speachtotext.1we": swifty.purchase(purchase: .week)
//            case "com.speachtotext.1mo": swifty.purchase(purchase: .mounth)
//            case "com.speachtotext.1ye": swifty.purchase(purchase: .year)
//            default:
//                print("subError")
//            }
            view.isUserInteractionEnabled = false
            let subV = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            subV.backgroundColor = UIColor(red: 0.046, green: 0.046, blue: 0.046, alpha: 0.4)
            self.view.addSubview(subV)
            self.view.addSubview(spiner)
            self.view.bringSubviewToFront(spiner)
            spiner.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
            spiner.startAnimating()
            let _ = Timer.scheduledTimer(withTimeInterval: 7, repeats: false) { Timer in
                self.spiner.stopAnimating()
                subV.removeFromSuperview()
                self.view.isUserInteractionEnabled = true
            }
        }
    }
    
    @objc func restoreTarget() {
        //IAPManager.shared.restorePurchases()
    }
    
    @objc func fingerTapGrad() {
        continueButton.setTitleColor(.white, for: .normal)
    }
    
    @objc func defaultButtonGradState() {
        continueButton.setTitleColor(UIColor(named: "black"), for: .normal)
    }
    
    @objc func firstSub() {
        
        subs = first
        
        firstSubView.layer.borderWidth = 0.5
        firstSubView.layer.borderColor = UIColor(named: "blue")?.cgColor
        secondSubView.layer.borderWidth = 0.5
        secondSubView.layer.borderColor = UIColor.clear.cgColor
        thirdSubView.layer.borderWidth = 0.5
        thirdSubView.layer.borderColor = UIColor.clear.cgColor
        
        if numberSub == "first" {
            if first == "com.speachtotext.1yetr" {
                self.firstBottomLabel?.attributedText = activeBottom(wPrice, local.subscribeYearly)
                self.firstTopLabel?.attributedText = dayTopActive(local.subscribeFreeTrial)
            } else if first == "com.speachtotext.1motr" {
                self.firstBottomLabel?.attributedText = activeBottom(wPrice, local.subscribeMonthly)
                self.firstTopLabel?.attributedText = dayTopActive(local.subscribeFreeTrial)
            } else if first == "com.speachtotext.1wetr" {
                self.firstBottomLabel?.attributedText = activeBottom(wPrice, local.subscribeWeekly)
                self.firstTopLabel?.attributedText = dayTopActive(local.subscribeFreeTrial)
            } else {
                self.firstBottomLabel?.attributedText = priceBottomActive(wPrice)
                if first == "com.speachtotext.1we" {
                    self.firstTopLabel?.attributedText = dayTopActive(local.subscribeWeekly)
                } else if first == "com.speachtotext.1mo" {
                    self.firstTopLabel?.attributedText = dayTopActive(local.subscribeMonthly)
                } else {
                    self.firstTopLabel?.attributedText = dayTopActive(local.subscribeYearly)
                }
            }
            if second == "com.speachtotext.1yetr" {
                self.secondBottomLabel?.attributedText = noActiveBottom(mPrice, local.subscribeYearly)
                self.secondTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else if second == "com.speachtotext.1motr" {
                self.secondBottomLabel?.attributedText = noActiveBottom(mPrice, local.subscribeMonthly)
                self.secondTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else if second == "com.speachtotext.1wetr" {
                self.secondBottomLabel?.attributedText = noActiveBottom(mPrice, local.subscribeWeekly)
                self.secondTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else {
                self.secondBottomLabel?.attributedText = priceBottom(mPrice)
                if second == "com.speachtotext.1we" {
                    self.secondTopLabel?.attributedText = dayTop(local.subscribeWeekly)
                } else if second == "com.speachtotext.1mo" {
                    self.secondTopLabel?.attributedText = dayTop(local.subscribeMonthly)
                } else {
                    self.secondTopLabel?.attributedText = dayTop(local.subscribeYearly)
                }
            }
            if third == "com.speachtotext.1yetr" {
                self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeYearly)
                self.thirdTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else if third == "com.speachtotext.1motr" {
                self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeMonthly)
                self.thirdTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else if third == "com.speachtotext.1wetr" {
                self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeWeekly)
                self.thirdTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else {
                self.thirdBottomLabel?.attributedText = priceBottom(yPrice)
                if third == "com.speachtotext.1we" {
                    self.thirdTopLabel?.attributedText = dayTop(local.subscribeWeekly)
                } else if third == "com.speachtotext.1mo" {
                    self.thirdTopLabel?.attributedText = dayTop(local.subscribeMonthly)
                } else {
                    self.thirdTopLabel?.attributedText = dayTop(local.subscribeYearly)
                }
            }
        } else {
            if first == "com.speachtotext.1yetr" {
                self.firstTopLabel?.attributedText = activeTop(wPrice, local.subscribeYearly)
                self.firstBottomLabel?.attributedText = dayBottomActive(local.subscribeFreeTrial)
            } else if first == "com.speachtotext.1motr" {
                self.firstTopLabel?.attributedText = activeTop(wPrice, local.subscribeMonthly)
                self.firstBottomLabel?.attributedText = dayBottomActive(local.subscribeFreeTrial)
            } else if first == "com.speachtotext.1wetr" {
                self.firstTopLabel?.attributedText = activeTop(wPrice, local.subscribeWeekly)
                self.firstBottomLabel?.attributedText = dayBottomActive(local.subscribeFreeTrial)
            } else {
                self.firstTopLabel?.attributedText = priceTopActive(wPrice)
                if first == "com.speachtotext.1we" {
                    self.firstBottomLabel?.attributedText = dayBottomActive(local.subscribeWeekly)
                } else if first == "com.speachtotext.1mo" {
                    self.firstBottomLabel?.attributedText = dayBottomActive(local.subscribeMonthly)
                } else {
                    self.firstBottomLabel?.attributedText = dayBottomActive(local.subscribeYearly)
                }
            }
            if second == "com.speachtotext.1yetr" {
                self.secondTopLabel?.attributedText = noActiveTop(mPrice, local.subscribeYearly)
                self.secondBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else if second == "com.speachtotext.1motr" {
                self.secondTopLabel?.attributedText = noActiveTop(mPrice, local.subscribeMonthly)
                self.secondBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else if second == "com.speachtotext.1wetr" {
                self.secondTopLabel?.attributedText = noActiveTop(mPrice, local.subscribeWeekly)
                self.secondBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else {
                self.secondTopLabel?.attributedText = priceTop(mPrice)
                if second == "com.speachtotext.1we" {
                    self.secondBottomLabel?.attributedText = dayBottom(local.subscribeWeekly)
                } else if second == "com.speachtotext.1mo" {
                    self.secondBottomLabel?.attributedText = dayBottom(local.subscribeMonthly)
                } else {
                    self.secondBottomLabel?.attributedText = dayBottom(local.subscribeYearly)
                }
            }
            if third == "com.speachtotext.1yetr" {
                self.thirdTopLabel?.attributedText = noActiveTop(yPrice, local.subscribeYearly)
                self.thirdBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else if third == "com.speachtotext.1motr" {
                self.thirdTopLabel?.attributedText = noActiveTop(yPrice, local.subscribeMonthly)
                self.thirdBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else if third == "com.speachtotext.1wetr" {
                self.thirdTopLabel?.attributedText = noActiveTop(yPrice, local.subscribeWeekly)
                self.thirdBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else {
                self.thirdTopLabel?.attributedText = priceTop(yPrice)
                if third == "com.speachtotext.1we" {
                    self.thirdBottomLabel?.attributedText = dayBottom(local.subscribeWeekly)
                } else if third == "com.speachtotext.1mo" {
                    self.thirdBottomLabel?.attributedText = dayBottom(local.subscribeMonthly)
                } else {
                    self.thirdBottomLabel?.attributedText = dayBottom(local.subscribeYearly)
                }
            }
        }
        
        if UIScreen.main.bounds.height < 668 {
            firstSmall()
        } else {
            firstBig()
        }
    }
    
    
    @objc func secondSub() {
        
        subs = second
        
        firstSubView.layer.borderWidth = 0.5
        firstSubView.layer.borderColor = UIColor.clear.cgColor
        secondSubView.layer.borderWidth = 0.5
        secondSubView.layer.borderColor = UIColor(named: "blue")?.cgColor
        thirdSubView.layer.borderWidth = 0.5
        thirdSubView.layer.borderColor = UIColor.clear.cgColor
        
        if numberSub == "first" {
            if first == "com.speachtotext.1yetr" {
                self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeYearly)
                self.firstTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else if first == "com.speachtotext.1motr" {
                self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeMonthly)
                self.firstTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else if first == "com.speachtotext.1wetr" {
                self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeWeekly)
                self.firstTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else {
                self.firstBottomLabel?.attributedText = priceBottom(wPrice)
                if first == "com.speachtotext.1we" {
                    self.firstTopLabel?.attributedText = dayTop(local.subscribeWeekly)
                } else if first == "com.speachtotext.1mo" {
                    self.firstTopLabel?.attributedText = dayTop(local.subscribeMonthly)
                } else {
                    self.firstTopLabel?.attributedText = dayTop(local.subscribeYearly)
                }
            }
            if second == "com.speachtotext.1yetr" {
                self.secondBottomLabel?.attributedText = activeBottom(mPrice, local.subscribeYearly)
                self.secondTopLabel?.attributedText = dayTopActive(local.subscribeFreeTrial)
            } else if second == "com.speachtotext.1motr" {
                self.secondBottomLabel?.attributedText = activeBottom(mPrice, local.subscribeMonthly)
                self.secondTopLabel?.attributedText = dayTopActive(local.subscribeFreeTrial)
            } else if second == "com.speachtotext.1wetr" {
                self.secondBottomLabel?.attributedText = activeBottom(mPrice, local.subscribeWeekly)
                self.secondTopLabel?.attributedText = dayTopActive(local.subscribeFreeTrial)
            } else {
                self.secondBottomLabel?.attributedText = priceBottomActive(mPrice)
                if second == "com.speachtotext.1we" {
                    self.secondTopLabel?.attributedText = dayTopActive(local.subscribeWeekly)
                } else if second == "com.speachtotext.1mo" {
                    self.secondTopLabel?.attributedText = dayTopActive(local.subscribeMonthly)
                } else {
                    self.secondTopLabel?.attributedText = dayTopActive(local.subscribeYearly)
                }
            }
            if third == "com.speachtotext.1yetr" {
                self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeYearly)
                self.thirdTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else if third == "com.speachtotext.1motr" {
                self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeMonthly)
                self.thirdTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else if third == "com.speachtotext.1wetr" {
                self.thirdBottomLabel?.attributedText = noActiveBottom(yPrice, local.subscribeWeekly)
                self.thirdTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else {
                self.thirdBottomLabel?.attributedText = priceBottom(yPrice)
                if third == "com.speachtotext.1we" {
                    self.thirdTopLabel?.attributedText = dayTop(local.subscribeWeekly)
                } else if third == "com.speachtotext.1mo" {
                    self.thirdTopLabel?.attributedText = dayTop(local.subscribeMonthly)
                } else {
                    self.thirdTopLabel?.attributedText = dayTop(local.subscribeYearly)
                }
            }
        } else {
            if first == "com.speachtotext.1yetr" {
                self.firstTopLabel?.attributedText = noActiveTop(wPrice, local.subscribeYearly)
                self.firstBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else if first == "com.speachtotext.1motr" {
                self.firstTopLabel?.attributedText = noActiveTop(wPrice, local.subscribeMonthly)
                self.firstBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else if first == "com.speachtotext.1wetr" {
                self.firstTopLabel?.attributedText = noActiveTop(wPrice, local.subscribeWeekly)
                self.firstBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else {
                self.firstTopLabel?.attributedText = priceTop(wPrice)
                if first == "com.speachtotext.1we" {
                    self.firstBottomLabel?.attributedText = dayBottom(local.subscribeWeekly)
                } else if first == "com.speachtotext.1mo" {
                    self.firstBottomLabel?.attributedText = dayBottom(local.subscribeMonthly)
                } else {
                    self.firstBottomLabel?.attributedText = dayBottom(local.subscribeYearly)
                }
            }
            if second == "com.speachtotext.1yetr" {
                self.secondTopLabel?.attributedText = activeTop(mPrice, local.subscribeYearly)
                self.secondBottomLabel?.attributedText = dayBottomActive(local.subscribeFreeTrial)
            } else if second == "com.speachtotext.1motr" {
                self.secondTopLabel?.attributedText = activeTop(mPrice, local.subscribeMonthly)
                self.secondBottomLabel?.attributedText = dayBottomActive(local.subscribeFreeTrial)
            } else if second == "com.speachtotext.1wetr" {
                self.secondTopLabel?.attributedText = activeTop(mPrice, local.subscribeWeekly)
                self.secondBottomLabel?.attributedText = dayBottomActive(local.subscribeFreeTrial)
            } else {
                self.secondTopLabel?.attributedText = priceTopActive(mPrice)
                if second == "com.speachtotext.1we" {
                    self.secondBottomLabel?.attributedText = dayBottomActive(local.subscribeWeekly)
                } else if second == "com.speachtotext.1mo" {
                    self.secondBottomLabel?.attributedText = dayBottomActive(local.subscribeMonthly)
                } else {
                    self.secondBottomLabel?.attributedText = dayBottomActive(local.subscribeYearly)
                }
            }
            if third == "com.speachtotext.1yetr" {
                self.thirdTopLabel?.attributedText = noActiveTop(yPrice, local.subscribeYearly)
                self.thirdBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else if third == "com.speachtotext.1motr" {
                self.thirdTopLabel?.attributedText = noActiveTop(yPrice, local.subscribeMonthly)
                self.thirdBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else if third == "com.speachtotext.1wetr" {
                self.thirdTopLabel?.attributedText = noActiveTop(yPrice, local.subscribeWeekly)
                self.thirdBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else {
                self.thirdTopLabel?.attributedText = priceTop(yPrice)
                if third == "com.speachtotext.1we" {
                    self.thirdBottomLabel?.attributedText = dayBottom(local.subscribeWeekly)
                } else if third == "com.speachtotext.1mo" {
                    self.thirdBottomLabel?.attributedText = dayBottom(local.subscribeMonthly)
                } else {
                    self.thirdBottomLabel?.attributedText = dayBottom(local.subscribeYearly)
                }
            }
        }
        
        if UIScreen.main.bounds.height < 668 {
            secondSmall()
        } else {
            secondBig()
        }
    }
    
    
    @objc func thirdSub() {
        
        subs = third
        
        firstSubView.layer.borderWidth = 0.5
        firstSubView.layer.borderColor = UIColor.clear.cgColor
        secondSubView.layer.borderWidth = 0.5
        secondSubView.layer.borderColor = UIColor.clear.cgColor
        thirdSubView.layer.borderWidth = 0.5
        thirdSubView.layer.borderColor = UIColor(named: "blue")?.cgColor
        
        if numberSub == "first" {
            if first == "com.speachtotext.1yetr" {
                self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeYearly)
                self.firstTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else if first == "com.speachtotext.1motr" {
                self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeMonthly)
                self.firstTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else if first == "com.speachtotext.1wetr" {
                self.firstBottomLabel?.attributedText = noActiveBottom(wPrice, local.subscribeWeekly)
                self.firstTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else {
                self.firstBottomLabel?.attributedText = priceBottom(wPrice)
                if first == "com.speachtotext.1we" {
                    self.firstTopLabel?.attributedText = dayTop(local.subscribeWeekly)
                } else if first == "com.speachtotext.1mo" {
                    self.firstTopLabel?.attributedText = dayTop(local.subscribeMonthly)
                } else {
                    self.firstTopLabel?.attributedText = dayTop(local.subscribeYearly)
                }
            }
            if second == "com.speachtotext.1yetr" {
                self.secondBottomLabel?.attributedText = noActiveBottom(mPrice, local.subscribeYearly)
                self.secondTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else if second == "com.speachtotext.1motr" {
                self.secondBottomLabel?.attributedText = noActiveBottom(mPrice, local.subscribeMonthly)
                self.secondTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else if second == "com.speachtotext.1wetr" {
                self.secondBottomLabel?.attributedText = noActiveBottom(mPrice, local.subscribeWeekly)
                self.secondTopLabel?.attributedText = dayTop(local.subscribeFreeTrial)
            } else {
                self.secondBottomLabel?.attributedText = priceBottom(mPrice)
                if second == "com.speachtotext.1we" {
                    self.secondTopLabel?.attributedText = dayTop(local.subscribeWeekly)
                } else if second == "com.speachtotext.1mo" {
                    self.secondTopLabel?.attributedText = dayTop(local.subscribeMonthly)
                } else {
                    self.secondTopLabel?.attributedText = dayTop(local.subscribeYearly)
                }
            }
            if third == "com.speachtotext.1yetr" {
                self.thirdBottomLabel?.attributedText = activeBottom(yPrice, local.subscribeYearly)
                self.thirdTopLabel?.attributedText = dayTopActive(local.subscribeFreeTrial)
            } else if third == "com.speachtotext.1motr" {
                self.thirdBottomLabel?.attributedText = activeBottom(yPrice, local.subscribeMonthly)
                self.thirdTopLabel?.attributedText = dayTopActive(local.subscribeFreeTrial)
            } else if third == "com.speachtotext.1wetr" {
                self.thirdBottomLabel?.attributedText = activeBottom(yPrice, local.subscribeWeekly)
                self.thirdTopLabel?.attributedText = dayTopActive(local.subscribeFreeTrial)
            } else {
                self.thirdBottomLabel?.attributedText = priceBottomActive(yPrice)
                if third == "com.speachtotext.1we" {
                    self.thirdTopLabel?.attributedText = dayTopActive(local.subscribeWeekly)
                } else if third == "com.speachtotext.1mo" {
                    self.thirdTopLabel?.attributedText = dayTopActive(local.subscribeMonthly)
                } else {
                    self.thirdTopLabel?.attributedText = dayTopActive(local.subscribeYearly)
                }
            }
        } else {
            if first == "com.speachtotext.1yetr" {
                self.firstTopLabel?.attributedText = noActiveTop(wPrice, local.subscribeYearly)
                self.firstBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else if first == "com.speachtotext.1motr" {
                self.firstTopLabel?.attributedText = noActiveTop(wPrice, local.subscribeMonthly)
                self.firstBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else if first == "com.speachtotext.1wetr" {
                self.firstTopLabel?.attributedText = noActiveTop(wPrice, local.subscribeWeekly)
                self.firstBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else {
                self.firstTopLabel?.attributedText = priceTop(wPrice)
                if first == "com.speachtotext.1we" {
                    self.firstBottomLabel?.attributedText = dayBottom(local.subscribeWeekly)
                } else if first == "com.speachtotext.1mo" {
                    self.firstBottomLabel?.attributedText = dayBottom(local.subscribeMonthly)
                } else {
                    self.firstBottomLabel?.attributedText = dayBottom(local.subscribeYearly)
                }
            }
            if second == "com.speachtotext.1yetr" {
                self.secondTopLabel?.attributedText = noActiveTop(mPrice, local.subscribeYearly)
                self.secondBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else if second == "com.speachtotext.1motr" {
                self.secondTopLabel?.attributedText = noActiveTop(mPrice, local.subscribeMonthly)
                self.secondBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else if second == "com.speachtotext.1wetr" {
                self.secondTopLabel?.attributedText = noActiveTop(mPrice, local.subscribeWeekly)
                self.secondBottomLabel?.attributedText = dayBottom(local.subscribeFreeTrial)
            } else {
                self.secondTopLabel?.attributedText = priceTop(mPrice)
                if second == "com.speachtotext.1we" {
                    self.secondBottomLabel?.attributedText = dayBottom(local.subscribeWeekly)
                } else if second == "com.speachtotext.1mo" {
                    self.secondBottomLabel?.attributedText = dayBottom(local.subscribeMonthly)
                } else {
                    self.secondBottomLabel?.attributedText = dayBottom(local.subscribeYearly)
                }
            }
            if third == "com.speachtotext.1yetr" {
                self.thirdTopLabel?.attributedText = activeTop(yPrice, local.subscribeYearly)
                self.thirdBottomLabel?.attributedText = dayBottomActive(local.subscribeFreeTrial)
            } else if third == "com.speachtotext.1motr" {
                self.thirdTopLabel?.attributedText = activeTop(yPrice, local.subscribeMonthly)
                self.thirdBottomLabel?.attributedText = dayBottomActive(local.subscribeFreeTrial)
            } else if third == "com.speachtotext.1wetr" {
                self.thirdTopLabel?.attributedText = activeTop(yPrice, local.subscribeWeekly)
                self.thirdBottomLabel?.attributedText = dayBottomActive(local.subscribeFreeTrial)
            } else {
                self.thirdTopLabel?.attributedText = priceTopActive(yPrice)
                if third == "com.speachtotext.1we" {
                    self.thirdBottomLabel?.attributedText = dayBottomActive(local.subscribeWeekly)
                } else if third == "com.speachtotext.1mo" {
                    self.thirdBottomLabel?.attributedText = dayBottomActive(local.subscribeMonthly)
                } else {
                    self.thirdBottomLabel?.attributedText = dayBottomActive(local.subscribeYearly)
                }
            }
        }
        
        if UIScreen.main.bounds.height < 668 {
            thirdSmall()
        } else {
            thirdBig()
        }

    }
    
    @objc func closeTarget() {
        dismiss(animated: true)
        NotificationCenter.default.post(name: Notification.Name("reload"), object: nil)
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        dismiss(animated: true)
        NotificationCenter.default.post(name: Notification.Name("reload"), object: nil)
    }
    
    @objc func restoreAlert(notification: Notification) {
        let alertController = UIAlertController(title: local.alertRestore,
                                                message: local.alertRestoreDiscription,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: local.alertOk, style: .destructive))
        alertController.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
        self.present(alertController, animated: true)
    }
    
    
}
