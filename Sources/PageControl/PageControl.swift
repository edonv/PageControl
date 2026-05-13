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
    public var numberOfPages: Int
    @Binding
    public var currentPage: Int
    
    public func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return control
    }
    
    public func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
