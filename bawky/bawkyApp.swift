//
//  bawkyApp.swift
//  bawky
//
//  Created by Constantin Clerc on 28/08/2023.
//

import SwiftUI
import WelcomeSheet
import UIKit

@main
struct bawkyApp: App {
    @State private var isntCompatibleAlert = false
    @State private var descriptivion = ""
    @State private var titlealert = ""
    @State private var showSetupSheet = false
    @State private var colorSchemee = getColorScheme()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    DispatchQueue.global(qos: .background).async {
                        let kfdStatus = isKFDCompatible()
                        if kfdStatus == "compatible" {
                            print("kfd device ! can proceed")
                        }
                        else if kfdStatus == "error"{
                            titlealert = "An error have occured."
                            descriptivion = "You might be on iOS 16.6 and we can't read the file. Please try again."
                            isntCompatibleAlert = true
                        }
                        else if kfdStatus == "no"{
                            titlealert = "This app is not compatible with your device."
                            descriptivion = "You are trying to run the app but the exploit used in it won't work on your version. Sorry !"
                            isntCompatibleAlert = true
                        }
                        else {
                            titlealert = "err"
                            descriptivion = "func iskfdcompatible() returned unexpected/nothing. pls contact "
                            isntCompatibleAlert = true
                        }
                    }
                    if !UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
//                        UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
                        showSetupSheet = true
                        print(colorSchemee)
                    }
                }
                .alert(isPresented: $isntCompatibleAlert) {
                    Alert(
                        title: Text("\(titlealert)"),
                        message: Text("\(descriptivion)"),
                        dismissButton: .default(
                            Text("Quit"),
                            action: {
                                //                                       exit(0)
                            }
                        )
                    )
                }
                .welcomeSheet(isPresented: $showSetupSheet, preferredColorScheme: colorSchemee, pages: pages)
        }
    }
}
