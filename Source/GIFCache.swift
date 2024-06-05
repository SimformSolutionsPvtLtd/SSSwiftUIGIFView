//
//  GIFCache.swift
//  SSSwiftUIGIFView
//
//  Created by Yagnik Bavishi on 05/06/24.
//

import Foundation

public class GIFCache {
    
    static let shared = GIFCache()
    let cache = NSCache<NSURL, NSData>()
    
    public func getData(for url: NSURL) -> NSData? {
        return cache.object(forKey: url)
    }
    
    public func setData(_ data: NSData, for url: NSURL) {
        cache.setObject(data, forKey: url)
    }
}
