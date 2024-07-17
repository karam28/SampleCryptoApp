//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Karamjeet Singh on 17/07/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
