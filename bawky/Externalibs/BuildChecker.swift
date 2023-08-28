//
//  BuildChecker.swift
//  bawky
//
//  Created by Constantin Clerc on 28/08/2023.
//

import Foundation
import UIKit

func isKFDCompatible() -> String {
    let systemVersion = UIDevice.current.systemVersion
    let versionComponents = systemVersion.split(separator: ".").compactMap { Int($0) }
    if versionComponents.count >= 2 {
        let majorVersion = versionComponents[0]
        let minorVersion = versionComponents[1]
        
        if majorVersion == 16 && minorVersion >= 0 && minorVersion <= 6 {
            if minorVersion == 5 && versionComponents.count >= 3 && versionComponents[2] == 1 {
                return "no"
            } else if minorVersion == 6 {
                let fileURL = URL(fileURLWithPath: "/System/Library/CoreServices/SystemVersion.plist")
                do {
                    let data = try Data(contentsOf: fileURL)
                    if let plist = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any],
                       let buildVersion = plist["ProductBuildVersion"] as? String {
                        let buildID = buildVersion
                        if buildID == "20G5026e" {
                            return "compatible"
                        }
                        else {
                            return "no"
                        }
                    }
                } catch {
                    return "error"
                }
            } else {
                return "compatible"
            }
        } else {
            return "no"
        }
    } else {
        return "error"
    }
    return "error"
}

