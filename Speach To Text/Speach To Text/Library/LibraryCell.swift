//
//  LibraryCollection.swift
//  Speach To Text
//
//  Created by Kirill Sedliarov on 6.03.23.
//

import Foundation
import Foundation
import UIKit
import SnapKit
import Lottie
import SwipeCellKit

class CustomCollectionViewCell: SwipeCollectionViewCell {
    
    
    
    public var image = ImageView(image: .changeIcon)
    public var viewImg = View(type: .navigationView)
    public var text = Label(type: .semibold17, "")
    public var dateLabel = Label(type: .regular15, "")
    public var chevrone = ImageView(image: .chevron)
    public var idRecord = ""

    public var access = 0
    static let id = "cellID"

    var animationView: LottieAnimationView = {
            var animation = LottieAnimationView()
            animation = .init(name: "stars")
            animation.animationSpeed = 0.6
            animation.loopMode = .loop
            animation.translatesAutoresizingMaskIntoConstraints = false
            animation.isUserInteractionEnabled = false
            return animation
        }()
    
//    init(frame: CGRect) {
//         super.init(frame: frame)
//        
//        
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    

    
    public func setup(name: String, date: Date, access: Int) {

        self.text.text = name
        
        let dataFormate = DateFormatter()
        dataFormate.dateFormat = "MM.dd.yyyy HH:mm"
//        dataFormate.string(from: date)
        
        dateLabel.text = dataFormate.string(from: date)
        
        //self.image.contentMode = .scaleAspectFit
        if access == 0 {
            image.isHidden = true
            animationView.isHidden = false
            
        } else if access == 1 {
            self.image.image = UIImage(named: "mic")
            animationView.isHidden = true
            
        } else if access == 2 {
            self.image.image = UIImage(named: "mictext")
            animationView.isHidden = true
        }
        
        
        
    }
    
    func anim() {
        UIView.animate(withDuration: 1.0) {[weak self] in
            self?.image.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }
    }
    
    func setUp() {
        
        layer.cornerRadius = 8
        layer.shadowColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 0.1).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 14
        layer.shadowPath = UIBezierPath(roundedRect: contentView.bounds, cornerRadius: 8).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        layer.position = contentView.center
        
        contentView.backgroundColor = .white
        
        viewImg.backgroundColor = UIColor(red: 0.941, green: 0.969, blue: 1, alpha: 1)
        
        
        addSubview(viewImg)
        addSubview(image)
        addSubview(dateLabel)
        addSubview(chevrone)
        addSubview(text)

        addSubview(animationView)
        animationView.isHidden = true
        text.textColor = .black
        
        animationView.snp.makeConstraints { make in
            make.center.equalTo(viewImg.snp.center)
        }
        
        viewImg.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
            make.width.equalTo(42)
        }

        
        image.snp.makeConstraints { make in
            make.center.equalTo(viewImg.snp.center)
        }
        
        text.snp.makeConstraints { make in
            make.left.equalTo(viewImg.snp.right).offset(8)
            make.top.equalTo(viewImg.snp.top)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(viewImg.snp.right).offset(8)
            make.bottom.equalTo(viewImg.snp.bottom)
        }
        
        
        chevrone.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.height.equalTo(15)
            make.width.equalTo(7)
        }
        
//        NSLayoutConstraint.activate([
//            chevrone.centerYAnchor.constraint(equalTo: centerYAnchor),
//            chevrone.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            chevrone.widthAnchor.constraint(equalToConstant: 7),
//            chevrone.heightAnchor.constraint(equalToConstant: 15),
//        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
