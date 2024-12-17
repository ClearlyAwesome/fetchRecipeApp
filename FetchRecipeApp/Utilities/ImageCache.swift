//
//  ImageCache.swift
//  FetchRecipeApp
//
//  Created by R C on 12/16/24.
//

import SwiftUI
import Combine

struct ImageCache {
    private var cache = NSCache<NSURL, UIImage>()

    func image(for url: URL) -> UIImage? {
        return cache.object(forKey: url as NSURL)
    }

    func insertImage(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url as NSURL)
    }
}
