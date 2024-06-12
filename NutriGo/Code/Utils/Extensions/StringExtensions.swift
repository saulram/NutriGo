//
//  StringExtensions.swift
//  NutriGo
//
//  Created by Saul Ramirez on 11/06/24.
//
import Foundation

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    func localized(arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
}
