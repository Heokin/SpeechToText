//
//  SecondOnBoard.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 8.02.23.
//

import Foundation
import UIKit

class SecondOnBoarding: UICollectionViewCell {

    public static var id = "second"
    
    let local = LocalizationVariables()
    
    lazy var label = LabelDual(type: .boardingHeader, local.secondOnBoardingHeaderUp, local.secondOnBoardingHeaderDown)
    lazy var mainImage = ImageView(image: .boardingBig)
    
    var imageView: UIImageView = {
            let imageView = UIImageView(frame: .zero)
            imageView.image = UIImage(named: "bgOnSecond")
            imageView.contentMode = .scaleToFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        //self.sendSubviewToBack(imageView)

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SecondOnBoarding {
    
    func setup() {

        addSubview(imageView)
        addSubview(label)
        addSubview(mainImage)
        
        mainImage.image = UIImage(named: "onSecond")

        NSLayoutConstraint.activate([

            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23),
            mainImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -23),
            mainImage.topAnchor.constraint(equalTo: topAnchor, constant: UIScreen.main.bounds.height/6.766),
            mainImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIScreen.main.bounds.height/2.333),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIScreen.main.bounds.height/5.107),
            
        ])
    }
}
