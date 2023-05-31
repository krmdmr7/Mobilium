//
//  UITextField_LowerCase+Extension.swift
//  Mobilium
//
//  Created by Kerem Demır on 31.05.2023.
//

import Foundation
import UIKit

extension UITextField {
  func addLowerCaseKeyboard() {
    addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
  }

  @objc private func textFieldDidChange(_ textField: UITextField) {
    textField.text = textField.text?.lowercased()
  }
}
