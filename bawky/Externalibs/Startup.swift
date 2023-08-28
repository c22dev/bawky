//
//  Startup.swift
//  bawky
//
//  Created by Constantin Clerc on 28/08/2023.
//

import WelcomeSheet
import UIKit
import SwiftUI

enum ColorScheme {
    case light
    case dark
    case unspecified
}

func getColorScheme() -> SwiftUI.ColorScheme? {
    if #available(iOS 13.0, *) {
        let currentTraitCollection = UIScreen.main.traitCollection
        if currentTraitCollection.userInterfaceStyle == .dark {
            return .dark
        } else if currentTraitCollection.userInterfaceStyle == .light {
            return .light
        }
    }
    // Fallback for older iOS versions or unspecified trait collections
    return .light
}



let pages = [
    WelcomeSheetPage(title: "Welcome to bawky !", rows: [
        WelcomeSheetPageRow(imageSystemName: "lock.fill",
                            title: "Safe",
                            content: "The app tries to protect your device from bootlooping by applying slowly and preventing any panic that could break your iPhone."),
        
        WelcomeSheetPageRow(imageSystemName: "paintbrush.fill",
                            title: "Compatibiltiy",
                            content: "Bawky works with all kfd devices compatible with misaka, and with most of the existing iOS themes."),
        
        WelcomeSheetPageRow(imageSystemName: "appclip",
                            title: "True icon theming",
                            content: "No appclip, no shortcut. Full icon theming !")
    ])
]
