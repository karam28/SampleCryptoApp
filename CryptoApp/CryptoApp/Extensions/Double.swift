//
//  Double.swift
//  CryptoApp
//
//  Created by Karamjeet Singh on 12/07/24.
//

import Foundation

extension Double {
    
    
    
    /// private computed property currencyFormatter6 that returns a configured NumberFormatter instance. The NumberFormatter is set up to format numbers as currency values with specific characteristics.
    /// ```
    /// Example for Covert
    /// 12.3456789 to $12,34
    ///
    /// ```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2 decimal places
    /// ```
    /// Example for Covert
    /// 1234.56 to "$1,234.56"
    /// 12.3456789 to "$12.34"
    ///
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    
    /// private computed property currencyFormatter6 that returns a configured NumberFormatter instance. The NumberFormatter is set up to format numbers as currency values with specific characteristics.
    /// ```
    /// Example for Covert
    /// 1234.56 to $1,234.56
    /// 12.3456789 to $12,345679
    ///
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2-6 decimal places
    /// ```
    /// Example for Covert
    /// 1234.56 to "$1,234.56"
    /// 12.3456789 to "$12.345679"
    ///
    /// ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Convert a Double into string representation
    /// ```
    ///Example for convert
    ///1.2345 to "1.23"
    /// - Returns: Converter String
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Convert a Double into string representation with percent symbol
    /// ```
    ///Example for convert
    ///1.2345 to "1.23%"
    /// - Returns: Converter String with percent Symbol
    /// ```
    func asPrecentString() -> String {
        return asNumberString() + "%"
    }
}
