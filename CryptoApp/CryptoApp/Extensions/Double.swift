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
    
    /// Convert a Double to a String with K, M, Bn, Tr abbreviations.
    /// ```
    ///  12 to 12.00
    ///  1234 to 1.23K
    ///  123456 to 123.45K
    ///  12345678 to 12.34M
    ///  1234567890 to 1.23Bn
    ///  123456789012 to 123.45Bn
    ///  12345678901234 to 12.34Tr
    /// ```
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()

        default:
            return "\(sign)\(self)"
        }
    }
    
    
}
