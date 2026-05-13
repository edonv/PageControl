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
}
