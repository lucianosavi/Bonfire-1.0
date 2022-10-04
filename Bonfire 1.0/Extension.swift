//
//  Extension+UIView.swift
//  Bonfire 1.0
//
//  Created by user220270 on 10/4/22.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        
        for view in views {
            
            self.addSubview(view)
        }
    }
}
