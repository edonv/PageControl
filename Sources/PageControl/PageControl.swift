//
//  PageControl.swift
//  PageControl
//
//  Created by Edon Valdman on 5/13/26.
//  Starting point created by Apple
//  https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit
//

import SwiftUI

/// A control that displays a horizontal series of dots, each of which corresponds to a page in the app’s document or other data-model entity.
public struct PageControl: UIViewRepresentable {
    // MARK: Public Properties
    
    @Binding
    public var selection: Int
    public let pageCount: Int
    
    // MARK: Init
    
    public init(
        selection: Binding<Int>,
        pageCount: Int
    ) {
        self._selection = selection
        self.pageCount = pageCount
    }
    
    // MARK: UIViewRepresentable
    
    public func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = pageCount
        
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged
        )
        
        // Custom EnvironmentValues
        control.hidesForSinglePage = context.environment.pageControlHidesForSinglePage
        
        if #available(iOS 13.0, macCatalyst 13.1, tvOS 13.0, visionOS 1.0, *) {
            control.pageIndicatorTintColor = context.environment.pageControlPageIndicatorTint
            control.currentPageIndicatorTintColor = context.environment.pageControlCurrentPageIndicatorTint
        }
        
        if #available(iOS 14.0, macCatalyst 14.0, tvOS 14.0, visionOS 1.0, *) {
            control.backgroundStyle = context.environment.pageControlBackgroundStyle
            control.allowsContinuousInteraction = !context.environment.pageControlContinuousInteractionDisabled
            
            // Indicator Images
            control.preferredIndicatorImage = context.environment.pageControlIndicatorImages.preferred
            for (page, image) in context.environment.pageControlIndicatorImages.perPage {
                control.setIndicatorImage(image, forPage: page)
            }
        }
        
        if #available(iOS 16.0, macCatalyst 16.0, tvOS 16.0, visionOS 1.0, *) {
            control.direction = context.environment.pageControlDirection
            
            // Indicator Images
            control.preferredCurrentPageIndicatorImage = context.environment.pageControlIndicatorImages.currentPage
            for (page, image) in context.environment.pageControlIndicatorImages.currentPerPage {
                control.setCurrentPageIndicatorImage(image, forPage: page)
            }
        }
        
        return control
    }
    
    public func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = selection
    }
    
    @available(iOS 16.0, macCatalyst 16.0, tvOS 16.0, visionOS 1.0, *)
    public func sizeThatFits(_ proposal: ProposedViewSize, uiView: UIPageControl, context: Context) -> CGSize? {
        return uiView.size(forNumberOfPages: pageCount)
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public class Coordinator: NSObject {
        let control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @MainActor @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.selection = sender.currentPage
        }
    }
}

// MARK: Namespaced Typealiases

extension PageControl {
    @available(iOS 16.0, macCatalyst 16.0, tvOS 16.0, visionOS 1.0, *)
    public typealias Direction = UIPageControl.Direction
    
    @available(iOS 14.0, macCatalyst 14.0, tvOS 14.0, visionOS 1.0, *)
    public typealias BackgroundStyle = UIPageControl.BackgroundStyle
}

@available(iOS 17, *)
#Preview {
    @Previewable @State
    var currentPage: Int = 0
    
    var scrollPosition: Binding<Int?> = .init {
        currentPage
    } set: { newValue in
        currentPage = newValue ?? 0
    }
    
    let colors: [Color] = [
        .black,
        .red,
        .blue,
        .orange,
        .yellow,
        .cyan,
        .purple
    ]
    
    ScrollView(.horizontal) {
        HStack(spacing: 0) {
            ForEach(colors.indices, id: \.self) { i in
                Rectangle()
                    .fill(colors[i])
                    .aspectRatio(4 / 3, contentMode: .fit)
                    .containerRelativeFrame([.horizontal])
                    .id(i)
            }
        }
        .scrollTargetLayout()
    }
    .scrollTargetBehavior(.viewAligned)
    .scrollPosition(id: scrollPosition)
    .scrollIndicators(.hidden, axes: .horizontal)
    .background(.placeholder)
    .overlay(alignment: .bottom) {
        PageControl(selection: $currentPage, pageCount: colors.count)
            .pageControlBackgroundStyle(.prominent)
            .pageControlPageIndicatorTint(.systemBlue)
            .pageControlCurrentPageIndicatorTint(.systemGreen)
            .pageControlContinuousInteractionDisabled(false)
            .pageControlIndicatorImage(.init(systemName: "plus.circle.fill"))
            .pageControlIndicatorImage(.init(systemName: "gamecontroller"), forPage: 0)
            .pageControlCurrentPageIndicatorImage(.init(systemName: "gamecontroller.fill"), forPage: 0)
            .pageControlCurrentPageIndicatorImage(.init(systemName: "book.circle.fill"))
//            .direction(.rightToLeft)
    }
    .animation(.default, value: scrollPosition.wrappedValue)
}
