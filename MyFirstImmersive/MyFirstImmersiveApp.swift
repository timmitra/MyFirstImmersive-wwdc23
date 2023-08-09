//
//  MyFirstImmersiveApp.swift
//  MyFirstImmersive
//
//  Created by Tim Mitra on 2023-08-08.
//

import SwiftUI

@main
struct MyFirstImmersiveApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
