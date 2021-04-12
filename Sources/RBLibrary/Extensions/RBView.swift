//
//  File.swift
//  
//
//  Created by Rezuan Bidzhiev on 29.03.2021.
//

import UIKit

public extension UIView {
  func makeRoundedCornersWithShadow(cornerRadius: CGFloat,
                                    shadowColor: UIColor = .black,
                                    shadowOpacity: Float = 0.4,
                                    shadowRadius: CGFloat = 4,
                                    shadowOffset: CGSize = .zero) {
    let shadowLayer = CAShapeLayer()
    let path = UIBezierPath(roundedRect: frame, cornerRadius: cornerRadius)
    
    shadowLayer.path = path.cgPath
    shadowLayer.fillColor = backgroundColor?.cgColor
  
    shadowLayer.shadowColor = shadowColor.cgColor
    shadowLayer.shadowOffset = shadowOffset
    shadowLayer.shadowRadius = shadowRadius
    shadowLayer.shadowOpacity = shadowOpacity
    
    layer.insertSublayer(shadowLayer, at: 0)
  }
  
  func addParalax(amount: CGFloat) {
       motionEffects.removeAll()
       let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
       horizontal.minimumRelativeValue = -amount
       horizontal.maximumRelativeValue = amount
       
       let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
       vertical.minimumRelativeValue = -amount
       vertical.maximumRelativeValue = amount
       
       let group = UIMotionEffectGroup()
       group.motionEffects = [horizontal, vertical]
       self.addMotionEffect(group)
   }
   
   /**
    SparrowKit: Remove paralax.
    */
   func removeParalax() {
       motionEffects.removeAll()
   }
   
}
