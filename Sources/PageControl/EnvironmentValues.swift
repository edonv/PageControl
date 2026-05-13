//
//  EnvironmentValues.swift
//  PageControl
//
//  Created by Edon Valdman on 5/13/26.
//

import SwiftUI

// MARK: - Entries

extension EnvironmentValues {
    /// Hides a ``PageControl/PageControl`` when there is only one page.
    ///
    /// Assign a value of `true` to hide the page control when there is only one page.
    /// Assign `false` (the default) to show the page control if there is only one page.
    @Entry
    public var pageControlHidesForSinglePage: Bool = false
    
    /// The layout direction of the page indicators in a ``PageControl/PageControl``.
    ///
    /// The default value is [`UIPageControl.Direction.natural`](https://developer.apple.com/documentation/uikit/uipagecontrol/direction-swift.enum/natural).
    @Entry
    @available(iOS 16.0, macCatalyst 16.0, tvOS 16.0, visionOS 1.0, *)
    public var pageControlDirection: PageControl.Direction = .natural
    
    /// The preferred background style for a ``PageControl/PageControl``.
    @Entry
    @available(iOS 14.0, macCatalyst 14.0, tvOS 14.0, visionOS 1.0, *)
    public var pageControlBackgroundStyle: PageControl.BackgroundStyle = .automatic
    
    /// The tint color to apply to the current page indicator of a ``PageControl/PageControl``.
    ///
    /// The default color is a translucent white for the page indicator dot. The page indicator dot is used for all of the pages not visible on the screen. Assigning a new value to this property does not automatically change the color in the ``PageControl/SwiftUICore/EnvironmentValues/pageControlCurrentPageIndicatorTint`` property because the value for these two properties is not automatically derived from the other. Both properties must be specified independently. Similarly, no alpha is applied to this property for you. It is recommended (but not required) that the color you specify for this parameter contains some transparency–i.e. the alpha value should be less than 1.0.
    @Entry
    @available(iOS 13.0, macCatalyst 13.1, tvOS 13.0, visionOS 1.0, *)
    public var pageControlPageIndicatorTint: UIColor? = nil
    
    /// The tint color to apply to the current page indicator of a ``PageControl/PageControl``.
    ///
    /// The default color is an opaque white for the current page indicator dot. The current page indicator dot is used to indicate the currently visible page. Assigning a new value to this property does not automatically change the color in the ``PageControl/SwiftUICore/EnvironmentValues/pageControlPageIndicatorTint`` property because the value for these two properties is not automatically derived from the other. Both properties must be specified independently.
    @Entry
    @available(iOS 13.0, macCatalyst 13.1, tvOS 13.0, visionOS 1.0, *)
    public var pageControlCurrentPageIndicatorTint: UIColor? = nil
    
    /// A Boolean value that determines whether a ``PageControl/PageControl`` allows continuous interaction.
    @Entry
    @available(iOS 14.0, macCatalyst 14.0, tvOS 14.0, visionOS 1.0, *)
    public var pageControlContinuousInteractionDisabled: Bool = false
}

// MARK: - ViewModifiers

extension View {
    /// Hides a ``PageControl/PageControl`` when there is only one page.
    ///
    /// Assign a value of `true` to hide the page control when there is only one page.
    /// Assign `false` (the default) to show the page control if there is only one page.
    nonisolated
    public func pageControlHidesForSinglePage(_ hide: Bool = true) -> some View {
        environment(\.pageControlHidesForSinglePage, hide)
    }
    
    /// The layout direction of the page indicators in a ``PageControl/PageControl``.
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
    
    /// The tint color to apply to the current page indicator of a ``PageControl/PageControl``.
    ///
    /// The default color is a translucent white for the page indicator dot. The page indicator dot is used for all of the pages not visible on the screen. Assigning a new value to this property does not automatically change the color in the ``PageControl/SwiftUICore/EnvironmentValues/pageControlCurrentPageIndicatorTint`` property because the value for these two properties is not automatically derived from the other. Both properties must be specified independently. Similarly, no alpha is applied to this property for you. It is recommended (but not required) that the color you specify for this parameter contains some transparency–i.e. the alpha value should be less than 1.0.
    @available(iOS 13.0, macCatalyst 13.1, tvOS 13.0, visionOS 1.0, *)
    nonisolated
    public func pageControlPageIndicatorTint(_ color: UIColor) -> some View {
        environment(\.pageControlPageIndicatorTint, color)
    }
    
    /// The tint color to apply to the current page indicator of a ``PageControl/PageControl``.
    ///
    /// The default color is an opaque white for the current page indicator dot. The current page indicator dot is used to indicate the currently visible page. Assigning a new value to this property does not automatically change the color in the ``PageControl/SwiftUICore/EnvironmentValues/pageControlPageIndicatorTint`` property because the value for these two properties is not automatically derived from the other. Both properties must be specified independently.
    @available(iOS 13.0, macCatalyst 13.1, tvOS 13.0, visionOS 1.0, *)
    nonisolated
    public func pageControlCurrentPageIndicatorTint(_ color: UIColor) -> some View {
        environment(\.pageControlCurrentPageIndicatorTint, color)
    }
    
    /// A Boolean value that determines whether a ``PageControl/PageControl`` allows continuous interaction.
    @available(iOS 14.0, macCatalyst 14.0, tvOS 14.0, visionOS 1.0, *)
    nonisolated
    public func pageControlContinuousInteractionDisabled(_ disabled: Bool = true) -> some View {
        environment(\.pageControlContinuousInteractionDisabled, disabled)
    }
}
