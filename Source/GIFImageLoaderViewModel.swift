//
//  GIFImageLoaderViewModel.swift
//  SSSwiftUIGIFView
//
//  Created by Yagnik Bavishi on 05/06/24.
//

import Foundation
import Combine

class GIFImageLoaderViewModel: ObservableObject {
    
    // MARK: - Variables
    @Published var data: Data? = nil
    private var cancellable: AnyCancellable?

    /// Loads data from a given URL, with caching and local file support.
    ///
    /// This function attempts to load data from the provided URL by following these steps:
    /// 1. Checks if the URL is a local file. If so, it tries to read the data from the local file and assigns it to `self.data`.
    /// 2. If the data is not from a local file, it checks if the data is already stored in the cache. If cached data is found, it assigns it to `self.data`.
    /// 3. If the data is neither a local file nor found in the cache, it fetches the data from the URL using a network request. The fetched data is then stored in the cache and assigned to `self.data`.
    ///
    /// - Parameter url: The URL to load the data from. It can be a local file URL or a remote URL.
    func load(url: URL) {
        let nsUrl = url as NSURL

        /// Check and return if the URL is a local file
        if url.isFileURL {
            if let localData = try? Data(contentsOf: url) {
                self.data = localData
                return
            }
        }

        /// Check and return the cache for the data
        if let cachedData = GIFCache.shared.getData(for: nsUrl) {
            self.data = cachedData as Data
            return
        }

        /// Fetch the data from the URL
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .catch { _ in Just(nil) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] data in
                guard let self else { return }
                if let data = data {
                    GIFCache.shared.setData(data as NSData, for: nsUrl)
                    self.data = data
                }
            }
    }

    deinit {
        cancellable?.cancel()
    }
}
