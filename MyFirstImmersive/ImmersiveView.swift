//
//  ImmersiveScene.swift
//  MyFirstImmersive
//
//  Created by Tim Mitra on 2023-08-08.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: "ImmersiveSpace", in: realityKitContentBundle) {
                content.add(scene)
            }
        }.offset(y:-600)
            .offset(z: -2400)
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
