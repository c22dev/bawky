//
//  kfdSetup.swift
//  bawky
//
//  Created by Constantin Clerc on 28/08/2023.
//

import SwiftUI

struct kfdSetup: View {
    @Binding var puafPagesIndex: Int
    @Binding var puafMethod: Int
    @Binding var kreadMethod: Int
    @Binding var kwriteMethod: Int
    @Binding var puafPages: Int
    @Binding var RespringMode: Int
    @Binding var exploit_method: Int
    @Binding var enforce_exploit_method: Bool

    private let puafPagesOptions = [16, 32, 64, 128, 256, 512, 1024, 2048]
    private let puafMethodOptions = ["physpuppet", "smith"]
    private let kreadMethodOptions = ["kqueue_workloop_ctl", "sem_open"]
    private let kwriteMethodOptions = ["dup", "sem_open"]
    private let RespringOptions = ["Backboard Respring", "Frontboard Respring"]
    private let ExploitOptions = ["KFD", "MDC", "TrollStore"]

    var body: some View {
        Form {
            Section(header: Text("Exploit Settings")) {
                Picker("puaf pages:", selection: $puafPagesIndex) {
                    ForEach(0 ..< puafPagesOptions.count, id: \.self) {
                        Text(String(self.puafPagesOptions[$0]))
                    }
                }

                Picker("puaf method:", selection: $puafMethod) {
                    ForEach(0 ..< puafMethodOptions.count, id: \.self) {
                        Text(self.puafMethodOptions[$0])
                    }
                }

                Picker("kread method:", selection: $kreadMethod) {
                    ForEach(0 ..< kreadMethodOptions.count, id: \.self) {
                        Text(self.kreadMethodOptions[$0])
                    }
                }

                Picker("kwrite method:", selection: $kwriteMethod) {
                    ForEach(0 ..< kwriteMethodOptions.count, id: \.self) {
                        Text(self.kwriteMethodOptions[$0])
                    }
                }
            }
            Section(header: Text("Other Settings")) {
                Picker("Respring Mode:", selection: $RespringMode) {
                    ForEach(0 ..< RespringOptions.count, id: \.self) {
                        Text(String(self.RespringOptions[$0]))
                    }
                }
                
                Toggle(isOn: $enforce_exploit_method) {
                    Text("Override Exploit Method").font(.headline)
                }
                if enforce_exploit_method {
                    Picker("Exploit:", selection: $exploit_method) {
                        ForEach(0 ..< ExploitOptions.count, id: \.self) {
                            Text(String(self.ExploitOptions[$0]))
                        }
                    }
                }
            }
        }.navigationBarTitle("Settings", displayMode: .inline)
    }
}
