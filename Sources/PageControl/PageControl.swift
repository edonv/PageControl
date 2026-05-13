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
    @Binding
    public var selection: Int
    public let pageCount: Int
    
    public init(
        selection: Binding<Int>,
        pageCount: Int
    ) {
        self._selection = selection
        self.pageCount = pageCount
    }
    
    public func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = pageCount
        
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged
        )
        
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
