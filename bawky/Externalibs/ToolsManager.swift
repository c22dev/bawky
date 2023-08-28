//
//  ToolsManager.swift
//  Cowabunga
//
//  Created by lemin on 1/4/23.
//

import UIKit
import Dynamic
var nulle = "nulle"

// get the user defaults for a boolean key
func getDefaultBool(forKey: String, defaultValue: Bool = false) -> Bool {
    let defaults = UserDefaults.standard
    
    return defaults.object(forKey: forKey) as? Bool ?? defaultValue
}

func getDefaultStr(forKey: String, defaultValue: String = "Visible") -> String {
    let defaults = UserDefaults.standard
    
    return defaults.string(forKey: forKey) ?? defaultValue
}

// set a user defaults value for a boolean key
func setDefaultBoolean(forKey: String, value: Bool) {
    let defaults = UserDefaults.standard
    
    defaults.set(value, forKey: forKey)
}

func exitGracefully() {
    UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
        exit(0)
    }
}

var connection: NSXPCConnection?

func remvoeIconCache() {
    print("removing icon cache")
    if connection == nil {
        let myCookieInterface = NSXPCInterface(with: ISIconCacheServiceProtocol.self)
        connection = Dynamic.NSXPCConnection(machServiceName: "com.apple.iconservices", options: []).asObject as? NSXPCConnection
        connection!.remoteObjectInterface = myCookieInterface
        connection!.resume()
        print("Connection: \(connection!)")
    }
    
    (connection!.remoteObjectProxy as AnyObject).clearCachedItems(forBundeID: nil) { (a, b) in // passing nil to remove all icon cache
        print("Successfully responded (\(a), \(b))")
    }
}

