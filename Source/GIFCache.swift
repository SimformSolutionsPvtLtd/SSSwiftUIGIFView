//
//  GIFCache.swift
//  SSSwiftUIGIFView
//
//  Created by Yagnik Bavishi on 05/06/24.
//

import Foundation

class GIFCache {
    
    // MARK: - Variables
    static let shared = GIFCache()
    private let cache = NSCache<NSURL, NSData>()
    
    /// Retrieves the data stored in the cache for the given URL.
    ///
    /// - Parameter url: The URL key used to look up the cached data. The URL is expected to be of type `NSURL`.
    /// - Returns: The cached data associated with the provided URL, or nil if no data exists for that URL.
    func getData(for url: NSURL) -> NSData? {
        return cache.object(forKey: url)
    }
    
    /// Stores the given data in the cache for the specified URL.
    ///
    /// - Parameters:
    ///   - data: The data to be stored in the cache. This data should be of type `NSData`.
    ///   - url: The URL key with which to associate the stored data. The URL is expected to be of type `NSURL`.
    func setData(_ data: NSData, for url: NSURL) {
        cache.setObject(data, forKey: url)
    }
}
