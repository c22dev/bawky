//
//  userSelection.swift
//  bawky
//
//  Created by Constantin Clerc on 28/08/2023.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var autoRespring: Bool {
        didSet {
            UserDefaults.standard.set(autoRespring, forKey: "autoRespring")
        }
    }
    @Published var dev: Bool {
        didSet {
            UserDefaults.standard.set(dev, forKey: "dev")
        }
    }
    @Published var exploit_method: Int {
        didSet {
            UserDefaults.standard.set(exploit_method, forKey: "exploit_method")
        }
    }
    @Published var enforce_exploit_method: Bool {
        didSet {
            UserDefaults.standard.set(enforce_exploit_method, forKey: "enforce_exploit_method")
        }
    }
    
    @Published var puafPagesIndex: Int {
        didSet {
            UserDefaults.standard.set(puafPagesIndex, forKey: "puafPagesIndex")
        }
    }
    @Published var puafMethod: Int {
        didSet {
            UserDefaults.standard.set(puafMethod, forKey: "puafMethod")
        }
    }
    @Published var kreadMethod: Int {
        didSet {
            UserDefaults.standard.set(kreadMethod, forKey: "kreadMethod")
        }
    }
    @Published var kwriteMethod: Int {
        didSet {
            UserDefaults.standard.set(kwriteMethod, forKey: "kwriteMethod")
        }
    }
    @Published var puafPages: Int {
        didSet {
            UserDefaults.standard.set(puafPages, forKey: "puafPages")
        }
    }
    @Published var RespringMode: Int {
        didSet {
            UserDefaults.standard.set(RespringMode, forKey: "RespringMode")
        }
    }
    
    init() {
        self.autoRespring = UserDefaults.standard.bool(forKey: "autoRespring")
        self.dev = UserDefaults.standard.bool(forKey: "dev")
        self.exploit_method = UserDefaults.standard.integer(forKey: "exploit_method")
        self.enforce_exploit_method = UserDefaults.standard.bool(forKey: "enforce_exploit_method")
        self.puafPagesIndex = UserDefaults.standard.integer(forKey: "puafPagesIndex")
        self.puafMethod = UserDefaults.standard.integer(forKey: "puafMethod")
        self.kreadMethod = UserDefaults.standard.integer(forKey: "kreadMethod")
        self.kwriteMethod = UserDefaults.standard.integer(forKey: "kwriteMethod")
        self.puafPages = UserDefaults.standard.integer(forKey: "puafPages")
        self.RespringMode = UserDefaults.standard.integer(forKey: "RespringMode")
        if UserDefaults.standard.object(forKey: "puafPagesIndex") == nil {
            self.puafPagesIndex = 7
        }
        if UserDefaults.standard.object(forKey: "puafPages") == nil {
            self.puafPages = 0
        }
        if UserDefaults.standard.object(forKey: "puafMethod") == nil {
            self.puafMethod = 1
        }
        if UserDefaults.standard.object(forKey: "kreadMethod") == nil {
            self.kreadMethod = 1
        }
        if UserDefaults.standard.object(forKey: "kwriteMethod") == nil {
            self.kwriteMethod = 1
        }
        if UserDefaults.standard.object(forKey: "RespringMode") == nil {
            self.RespringMode = 0
        }
    }
}
