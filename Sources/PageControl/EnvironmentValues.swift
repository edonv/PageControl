//
//  EnvironmentValues.swift
//  PageControl
//
//  Created by Edon Valdman on 5/13/26.
//

import SwiftUI

// MARK: - Entries

extension EnvironmentValues {
    /// Hides the page control when there is only one page.
    ///
    /// Assign a value of `true` to hide the page control when there is only one page.
    /// Assign `false` (the default) to show the page control if there is only one page.
    @Entry
    public var pageControlHidesForSinglePage: Bool = false
    
    /// The layout direction of the page indicators.
    ///
    /// The default value is [`UIPageControl.Direction.natural`](https://developer.apple.com/documentation/uikit/uipagecontrol/direction-swift.enum/natural).
    @Entry
    @available(iOS 16.0, macCatalyst 16.0, tvOS 16.0, visionOS 1.0, *)
    public var pageControlDirection: PageControl.Direction = .natural
    
    /// The preferred background style for a ``PageControl/PageControl``.
    @Entry
    @available(iOS 14.0, macCatalyst 14.0, tvOS 14.0, visionOS 1.0, *)
    public var pageControlBackgroundStyle: PageControl.BackgroundStyle = .automatic
}

// MARK: - ViewModifiers

extension View {
    /// Hides the page control when there is only one page.
    ///
    /// Assign a value of `true` to hide the page control when there is only one page.
    /// Assign `false` (the default) to show the page control if there is only one page.
    nonisolated
    public func pageControlHidesForSinglePage(_ hide: Bool = true) -> some View {
        environment(\.pageControlHidesForSinglePage, hide)
    }
    
    /// The layout direction of the page indicators.
    ///
    /// The default value is [`UIPageControl.Direction.natural`](https://developer.apple.com/documentation/uikit/uipagecontrol/direction-swift.enum/natural).
    @available(iOS 16.0, macCatalyst 16.0, tvOS 16.0, visionOS 1.0, *)
    nonisolated
    public func pageControlDirection(_ direction: PageControl.Direction) -> some View {
        environment(\.pageControlDirection, direction)
    }
    
    /// The preferred background style for a ``PageControl/PageControl``.
    ///
    /// The default value is [`UIPageControl.BackgroundStyle.automatic`](https://developer.apple.com/documentation/uikit/uipagecontrol/backgroundstyle-swift.enum/automatic).
    @available(iOS 14.0, macCatalyst 14.0, tvOS 14.0, visionOS 1.0, *)
    nonisolated
    public func pageControlBackgroundStyle(_ style: PageControl.BackgroundStyle) -> some View {
        environment(\.pageControlBackgroundStyle, style)
    }
}
