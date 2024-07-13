//
//  Color.swift
//  CryptoApp
//
//  Created by Karamjeet Singh on 10/07/24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

/// To Setup the Application different themes
struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
