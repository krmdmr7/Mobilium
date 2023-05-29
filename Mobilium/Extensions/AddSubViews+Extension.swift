//
//  AddSubViews+Extension.swift
//  Mobilium
//
//  Created by Kerem Demır on 26.05.2023.
//

import Foundation
import UIKit

extension UIView {
    func addSubViews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
