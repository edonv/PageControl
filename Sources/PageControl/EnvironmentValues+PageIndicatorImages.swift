//
//  EnvironmentValues+PageIndicatorImages.swift
//  PageControl
//
//  Created by Edon Valdman on 5/13/26.
//

import SwiftUI

// MARK: - Entries

extension PageControl {
    @available(iOS 14.0, macCatalyst 14.0, tvOS 14.0, visionOS 1.0, *)
    struct IndicatorImages: Hashable {
        var preferred: UIImage? = nil
        var currentPage: UIImage? = nil
        var perPage: [Int: UIImage] = [:]
        var currentPerPage: [Int: UIImage] = [:]
        
        mutating func setPreferred(
            _ image: UIImage?,
            forPage page: Int?
        ) {
            if let page {
                self.perPage[page] = image
            } else {
                self.preferred = image
            }
        }
        
        @available(iOS 16.0, macCatalyst 16.0, tvOS 16.0, visionOS 1.0, *)
        mutating func setCurrent(
            _ image: UIImage?,
            forPage page: Int?
        ) {
            if let page {
                self.currentPerPage[page] = image
            } else {
                self.currentPage = image
            }
        }
    }
}

extension EnvironmentValues {
    @Entry
    @available(iOS 14.0, macCatalyst 14.0, tvOS 14.0, visionOS 1.0, *)
    internal var pageControlIndicatorImages: PageControl.IndicatorImages = .init()
}

// MARK: - ViewModifiers

extension View {
    /// Sets the image for the page indicators of a ``PageControl/PageControl``.
    /// - Parameters:
    ///   - image: The preferred image for indicators. When `nil`, uses default image.
    ///   - page: Optionally, the index of a page to specifically override. Leave `nil` to set for all pages. The value must be greater than or equal to `0` and less than ``PageControl/PageControl/pageCount``.
    @available(iOS 14.0, macCatalyst 14.0, tvOS 14.0, visionOS 1.0, *)
    nonisolated
    public func pageControlIndicatorImage(
        _ image: UIImage?,
        forPage page: Int? = nil
    ) -> some View {
        transformEnvironment(\.pageControlIndicatorImages) { images in
            images.setPreferred(image, forPage: page)
        }
    }
    
    /// Sets the image for the page indicator for the current page of a ``PageControl/PageControl``.
    /// - Parameters:
    ///   - image: The preferred image for the current page. When `nil`, uses ``pageControlIndicatorImage(_:forPage:)``.
    ///   - page: Optionally, the index of a page to specifically override. Leave `nil` to set for all pages. The value must be greater than or equal to `0` and less than ``PageControl/PageControl/pageCount``.
    @available(iOS 16.0, macCatalyst 16.0, tvOS 16.0, visionOS 1.0, *)
    nonisolated
    public func pageControlCurrentPageIndicatorImage(
        _ image: UIImage?,
        forPage page: Int? = nil
    ) -> some View {
        transformEnvironment(\.pageControlIndicatorImages) { images in
            images.setCurrent(image, forPage: page)
        }
    }
}
