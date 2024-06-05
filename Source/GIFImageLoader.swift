//
//  GIFImageLoader.swift
//  SSSwiftUIGIFView
//
//  Created by Yagnik Bavishi on 05/06/24.
//

import Foundation
import Combine

public class GIFImageLoader: ObservableObject {
    
    @Published var data: Data? = nil

    var cancellable: AnyCancellable?

    public func load(url: URL) {
        let nsUrl = url as NSURL

        // Check if the URL is a local file
        if url.isFileURL {
            if let localData = try? Data(contentsOf: url) {
                self.data = localData
                return
            }
        }

        // Check the cache for the data
        if let cachedData = GIFCache.shared.getData(for: nsUrl) {
            self.data = cachedData as Data
            return
        }

        // Fetch the data from the URL
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .catch { _ in Just(nil) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] data in
                if let data = data {
                    GIFCache.shared.setData(data as NSData, for: nsUrl)
                    self?.data = data
                }
            }
    }

    deinit {
        cancellable?.cancel()
    }
}
