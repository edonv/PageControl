//
//  PageControl.swift
//  PageControl
//
//  Created by Edon Valdman on 5/13/26.
//  Starting point created by Apple
//  https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit
//

import SwiftUI
import UIKit

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
        
        control.hidesForSinglePage = context.environment.pageControlHidesForSinglePage
        
        return control
    }
    
    public func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = selection
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
}

@available(iOS 17, *)
#Preview {
    @Previewable @State
    var currentPage: Int = 3
    
    Rectangle()
        .fill(.orange)
        .aspectRatio(4 / 3, contentMode: .fit)
        .overlay(alignment: .bottom) {
            PageControl(selection: $currentPage, pageCount: 5)
        }
}
