//
//  PRSwitch.swift
//  Prelens-jinny
//
//  Created by vinova on 3/26/18.
//  Copyright © 2018 Lamp. All rights reserved.
//

import UIKit

@IBDesignable
class PRSwitch: UIControl {
    
    @IBInspectable private var bgColorOn: UIColor = UIColor.green
    @IBInspectable private var bgColorOff: UIColor = UIColor.gray
    @IBInspectable private var paddingHorizontal: CGFloat = 3.0
    @IBInspectable private var paddingVertical: CGFloat = 3.0
    @IBInspectable private var defaultValue: Bool = false
    
    private var didTapPosition: CGPoint = CGPoint(x: 0.0, y: 0.0)
    
    private let imgCircle: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .white
        img.clipsToBounds = true
        return img
    }()
    
    private(set) var isOn = false {
        didSet {
//            handleChangeSwitchState!(isOn)
        }
    }
    
//    var handleChangeSwitchState: ((Bool)->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setUpViews() {
        isOn = defaultValue
        
        imgCircle.frame.size = CGSize(width: self.bounds.height - paddingHorizontal, height: self.bounds.height - paddingVertical)
        imgCircle.layer.cornerRadius = imgCircle.bounds.height/2
        
        if !isOn {
            self.backgroundColor = bgColorOff
            imgCircle.frame.origin.x = paddingHorizontal
        } else {
            self.backgroundColor = bgColorOn
            imgCircle.frame.origin.x = frame.width - imgCircle.bounds.width - paddingHorizontal
        }
        imgCircle.center.y = self.bounds.height/2
        
        isUserInteractionEnabled = true
        
        layer.cornerRadius = self.bounds.height/2
        self.addSubview(imgCircle)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // get touch position
        didTapPosition = touches.first?.location(in: self) ?? CGPoint(x: 0.0, y: 0.0)

        // get touched layer
        let layer = self.imgCircle.layer.hitTest(didTapPosition)
        
        if layer == imgCircle.layer {
//            print("👩‍🚒 you reach me")
            return
        } else {
//            print("🙆‍♂️ you dont reach me")
//            if isOn == false && didTapPosition.x > self.bounds.width / 2 {
            // handle switch to on state
            if isOn == false && didTapPosition.x > imgCircle.bounds.width {
                UIView.animate(withDuration: 0.3, animations: {
                    self.backgroundColor = self.bgColorOn
                    self.imgCircle.frame.origin.x = self.frame.width - self.imgCircle.bounds.width - self.paddingHorizontal
                }) { _ in
                    self.sendActions(for: .valueChanged)
                }
                isOn = !isOn
            }

//            if didTapPosition.x < self.bounds.width / 2 && isOn == true {
            // handle switch to off state
            else if didTapPosition.x < imgCircle.frame.origin.x && isOn == true {
                UIView.animate(withDuration: 0.3, animations: {
                    self.backgroundColor = self.bgColorOff
                    self.imgCircle.frame.origin.x = self.paddingHorizontal
                }) { (_) in
                    self.sendActions(for: .valueChanged)
                }
                isOn = !isOn
            }
            
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        setUpViews()
    }
}
