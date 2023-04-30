//
//  GalleryView.swift
//  Africa
//
//  Created by Md Abir Hossain on 16-04-2023.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Gallery")
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - PREVIEW

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
