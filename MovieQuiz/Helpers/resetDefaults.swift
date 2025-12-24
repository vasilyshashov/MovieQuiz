//
//  resetDefaults.swift
//  MovieQuiz
//
//  Created by Vasily on 24.12.2025.
//
import Foundation

extension UserDefaults {
    static func resetDefaults() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
}
