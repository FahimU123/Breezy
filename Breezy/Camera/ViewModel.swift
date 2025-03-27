//
//  ViewModel.swift
//  Breezy
//
//  Created by Fahim Uddin on 3/26/25.
//

import Foundation
import CoreImage
import Observation

@Observable
class ViewModel {
    var currentFrame: CGImage?
    private let cameraManager = CameraManager()
    
    init() {
           Task {
               await handleCameraPreviews()
           }
       }
    
    func handleCameraPreviews() async {
            for await image in cameraManager.previewStream {
                Task { @MainActor in
                    currentFrame = image
                }
            }
        }
}
