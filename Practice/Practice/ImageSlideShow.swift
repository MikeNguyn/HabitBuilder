//
//  ImageSlideShow.swift
//  Practice
//
//  Created by Francesca Brown on 4/19/23.
//

import SwiftUI

struct ImageSlideShow: View {
    let images: [String]
    @State private var currentImageIndex = 0
    @State private var isSlideshowRunning = true
    
    var body: some View {
        if isSlideshowRunning {
            Image(images[currentImageIndex])
                .resizable()
                .scaledToFit()
                .onAppear {
                    let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                        if currentImageIndex < images.count - 1 {
                            currentImageIndex += 1
                        } else {
                            isSlideshowRunning = false
                        }
                    }
                    timer.fire()
                }
        }
    }
}
//            ImageSlideShow(images: ["Tutss1", "Tutss1", "Tutss2", "Tutss3", "Tutss4","Tutss5", "Tutss6", "Tutss7", "Tutss8", "Tutss9", "Tutss10", "Tutss11", "Tutss12"])
