//
//  Climage.swift
//  Breezy
//
//  Created by Fahim Uddin on 3/26/25.
//

import CoreImage

extension CIImage {
    
    var cgImage: CGImage? {
        
        let ciContext = CIContext()
        
        guard let cgImage = ciContext.createCGImage(self, from: self.extent) else {
            return nil
        }
    
        return cgImage
    }
    
}
