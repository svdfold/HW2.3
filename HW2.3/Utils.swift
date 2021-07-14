//
//  Utils.swift
//  HW2.3
//
//  Created by Mike Albright on 14.07.2021.
//

import Foundation
import UIKit

extension UIView {
    func setGradient(upperColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [upperColor.cgColor, bottomColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
    }
}
