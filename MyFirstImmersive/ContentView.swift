//
//  ContentView.swift
//  MyFirstImmersive
//
//  Created by Tim Mitra on 2023-08-08.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State var enlarge = false
    @Environment(\.openImmersiveSpace) var openImmersiveScene

    var body: some View {
        VStack {
            RealityView { content in
                // Add the initial RealityKit content
                if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                    content.add(scene)
                }
            } update: { content in
                // Update the RealityKit content when SwiftUI state changes
                if let scene = content.entities.first {
                    let uniformScale: Float = enlarge ? 1.4 : 1.0
                    scene.transform.scale = [uniformScale, uniformScale, uniformScale]
                }
            }
            .gesture(TapGesture().targetedToAnyEntity().onEnded { _ in
                enlarge.toggle()
            })
            Button("Open") {
                Task {
                    await openImmersiveScene(id: "ImmersiveScene")
                }
            }

            VStack {
                Toggle("Change Size", isOn: $enlarge)
                    .toggleStyle(.button)
            }.padding().glassBackgroundEffect()
        }
    }
}

#Preview {
    ContentView()
}
