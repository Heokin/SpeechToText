//
//  OnBoard.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit

class OnBoard: UIViewController, UIViewControllerTransitioningDelegate {
    
    //let swiftys = IAPManager()
    let local = LocalizationVariables()
    var getter = "1"
    var sub = ""
    var fix = 0
    let width = UIScreen.main.bounds.width
    lazy var collectionView = Collection(
        delegate: self,
        dataSource: self
    )

    lazy var continueButton = Button(type: .subscribeContinue, local.continueOnBoarding)
    
    lazy var currentIndex: IndexPath = .init(index: 0)
    lazy var spiner = UIActivityIndicatorView(style: .large)
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .darkContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //RemoteConfigFetch.shared.fetchValues()
        self.transitioningDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setup()
    }
}

extension OnBoard {
    
    func setup() {
        
        collectionView.backgroundColor = .white
        continueButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(fingerTapGrad), for: .touchDown)
        continueButton.addTarget(self, action: #selector(defaultButtonGradState), for: .touchUpInside)
        
        view.addSubview(collectionView)
        view.addSubview(continueButton)
        view.addSubview(spiner)
        view.bringSubviewToFront(spiner)
        spiner.color = .white
        spiner.translatesAutoresizingMaskIntoConstraints = false
    
        continueButton.titleLabel?.font =  UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        collectionView.register(FirstOnBoarding.self, forCellWithReuseIdentifier: FirstOnBoarding.id)
        collectionView.register(SecondOnBoarding.self, forCellWithReuseIdentifier: SecondOnBoarding.id)
        collectionView.register(ThirdOnBoarding.self, forCellWithReuseIdentifier: ThirdOnBoarding.id)
        collectionView.register(OnBoardSubVC.self, forCellWithReuseIdentifier: OnBoardSubVC.id)

        NSLayoutConstraint.activate([
            
            spiner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spiner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            continueButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 16.9),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    @objc func fingerTapGrad() {
        continueButton.setTitleColor(.white, for: .normal)
    }
    
    @objc func defaultButtonGradState() {
        continueButton.setTitleColor(UIColor(named: "black"), for: .normal)
    }
    
    @objc func closeTarget() {
//        let vc = CustomTabBarController()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
    }
    
   @objc func nextPage() {
       if UserDefaults.standard.value(forKey: "getter") == nil {
               print("getter not corrected")
       } else {
              print("getter corrected")
           getter = UserDefaults.standard.value(forKey: "getter") as! String
               print(getter)
       }

       if fix < 3 {
           fix = fix + 1
           collectionView.scrollToItem(at: IndexPath(arrayLiteral: 0, fix), at: .centeredHorizontally, animated: true)
       } else {
           sub = UserDefaults.standard.value(forKey: "sub") as? String ?? ""
           if sub != "" {
//               switch sub {
//               case "com.speakercleaner.1wetr": swiftys.purchase(purchase: .weekTrial)
//               case "com.speakercleaner.1motr": swiftys.purchase(purchase: .mounthTrial)
//               case "com.speakercleaner.1yetr": swiftys.purchase(purchase: .yearTrial)
//               case "com.speakercleaner.1we": swiftys.purchase(purchase: .week)
//               case "com.speakercleaner.1mo": swiftys.purchase(purchase: .mounth)
//               case "com.speakercleaner.1ye": swiftys.purchase(purchase: .year)
//               default:
//                   print("subError")
//               }
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
           print("subscribe action")
       }

    }
}

extension OnBoard: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        collectionView.isScrollEnabled = false
        var slide: String
        
        switch indexPath.row {
        case 0:
            slide = FirstOnBoarding.id
            
        case 1:
            slide = SecondOnBoarding.id
        case 2:
            slide = ThirdOnBoarding.id
          
        case 3:
            if getter == "2" {
                slide = OnBoardSubVC.id
            } else if getter == "0" {
                closeTarget()
                slide = ThirdOnBoarding.id
            }
            else {
                slide = OnBoardSubVC.id
        }
            
            
        default:
            slide = FirstOnBoarding.id
        }
        
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: slide, for: indexPath)
        return item
    }
}

// MARK: Collection view delegate
extension OnBoard: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = view.bounds.width
        let itemHeight = view.bounds.height
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        currentIndex = indexPath
        
        UIView.transition(with: continueButton, duration: 0.3, options: .transitionCrossDissolve, animations: {}, completion: { _ in })
    }
}
