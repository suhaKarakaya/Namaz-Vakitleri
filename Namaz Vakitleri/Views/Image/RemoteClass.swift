//
//  RemoteClass.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 6.05.2024.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromUrlString urlString: String) {
        Task(priority: .background) {
            await NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
                guard let uiImage else { return }
                DispatchQueue.main.async {
                    self.image = Image(uiImage: uiImage)
                }
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct TimeTableRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromUrlString: urlString)
            }
    }
}
