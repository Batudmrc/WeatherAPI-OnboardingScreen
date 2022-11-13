//
//  UIViewExtension.swift
//  tabBarPractice
//
//  Created by Batuhan Demircioğlu on 10.11.2022.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get{ return self.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
}
