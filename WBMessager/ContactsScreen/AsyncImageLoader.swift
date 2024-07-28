//
//  AsyncImageLoader.swift
//  WBMessager
//
//  Created by Anna on 28.07.2024.
//

import Combine
import SwiftUI

class AsyncImageLoader: ObservableObject {
    
    @Published var image: Image?
    
    func loadImage(assetImageName: String) {
        let randomDelay = Double(arc4random_uniform(3) + 1) //Рандомная задержка для загрузки аватаров от 1 до 3 секунд
        DispatchQueue.global().asyncAfter(deadline: .now() + randomDelay) {
            let image = Image(assetImageName)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
