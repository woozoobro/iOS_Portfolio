//
//  CustomWebImage.swift
//  CacheImage_tunsdev
//
//  Created by 우주형 on 2023/08/06.
//

import SwiftUI
import SDWebImageSwiftUI

struct CustomWebImage: View {
    var body: some View {
        WebImage(url: URL(string: "https://nokiatech.github.io/heif/content/images/ski_jump_1440x960.heic"))
        // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
        .onSuccess { image, data, cacheType in
            // Success
            // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
        }
        .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
        .placeholder(Image(systemName: "photo")) // Placeholder Image
        // Supports ViewBuilder as well
        .placeholder {
            ProgressView()
        }
        .indicator(.activity) // Activity Indicator
        .transition(.fade(duration: 0.5)) // Fade Transition with duration
        .scaledToFit()
        .frame(width: 300, height: 300, alignment: .center)
    }
}

struct CustomWebImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomWebImage()
    }
}
