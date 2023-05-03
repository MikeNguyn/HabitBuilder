//
//  ImageSlideShow.swift
//  Practice
//
//  Created by Francesca Brown on 4/19/23.
//

import SwiftUI

//This view is our tutorial for how to use the app. Users will press the question mark on content view to open up the tutorial.

struct ImageSlideShow: View {
    let images: [String]
    @State private var currentImageIndex = 0
    @State private var isSlideshowRunning = true
    @State private var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Image(images[currentImageIndex])
                .resizable()
                .scaledToFit()
                .onReceive(timer) { _ in
                    if isSlideshowRunning {
                        if currentImageIndex < images.count - 1 {
                            currentImageIndex += 1
                        } else {
                            currentImageIndex = 0
                        }
                    }
                }
                .onTapGesture {
                    isSlideshowRunning.toggle()
                }
            HStack {
                Button(action: previousImage) {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Button(action: toggleSlideshow) {
                    if isSlideshowRunning {
                        Image(systemName: "pause")
                    } else {
                        Image(systemName: "play")
                    }
                }
                Spacer()
                Button(action: nextImage) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
        }
    }
    
    //These next two functions let us scroll left and right manually during the slideshow.
    func previousImage() {
        if currentImageIndex > 0 {
            currentImageIndex -= 1
        } else {
            currentImageIndex = images.count - 1
        }
        restartTimer()
    }

    func nextImage() {
        if currentImageIndex < images.count - 1 {
            currentImageIndex += 1
        } else {
            currentImageIndex = 0
        }
        restartTimer()
    }

    func toggleSlideshow() {
        isSlideshowRunning.toggle()
    }

    func restartTimer() {
        timer.upstream.connect().cancel()
        timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    }
}


