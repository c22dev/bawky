//
//  ContentView.swift
//  bawky
//
//  Created by Constantin Clerc on 28/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var userSettings = UserSettings()
    @State private var autoRespring = false
    @State private var exploit_method = 0
    @State private var enforce_exploit_method = false
    
    // KFD:
    private let puafPagesOptions = [16, 32, 64, 128, 256, 512, 1024, 2048]
    @State private var puafPagesIndex = 7
    @State private var puafPages = 0
    @State private var puafMethod = 1
    @State private var kreadMethod = 1
    @State private var kwriteMethod = 1
    @State private var RespringMode = 0
    var body: some View {
        NavigationView{
            VStack {
                Button("kopen") {
                    exploit(puaf_pages: UInt64(puafPagesOptions[puafPagesIndex]), puaf_method: UInt64(puafMethod), kread_method: UInt64(kreadMethod), kwrite_method: UInt64(kwriteMethod)) //kopen
                    fix_exploit()
                }
                .padding()
                Button("kclose") {
                    close_exploit()
                }
                .padding()
                Button("respring") {
                    respring()
                }
            }
            .navigationBarItems(
                trailing: HStack {
                    NavigationLink(destination: kfdSetup(
                        puafPagesIndex: $userSettings.puafPagesIndex,
                        puafMethod: $userSettings.puafMethod,
                        kreadMethod: $userSettings.kreadMethod,
                        kwriteMethod: $userSettings.kwriteMethod,
                        puafPages: $userSettings.puafPages,
                        RespringMode: $userSettings.RespringMode,
                        exploit_method: $userSettings.exploit_method,
                        enforce_exploit_method: $userSettings.enforce_exploit_method
                    )) {
                        Image(systemName: "gearshape.fill")
                    }
                    NavigationLink(destination: InfoView()) {
                        Image(systemName: "heart.fill")
                    }
                }
            )
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
