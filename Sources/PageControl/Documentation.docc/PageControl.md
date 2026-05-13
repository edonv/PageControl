# ``PageControl/PageControl``

A control that displays a horizontal series of dots, each of which corresponds to a page in the app’s document or other data-model entity.

## Overview

`PageControl` is a SwiftUI wrapper around [`UIPageControl`](https://developer.apple.com/documentation/uikit/uipagecontrol). Most of its APIs have been carried over via `Environment`/`EnvironmentValues`.

Based on [Apple's UIViewRepresentable tutorial](https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit).

## Topics

### Managing pages

- ``selection``
- ``pageCount``
- ``PageControl/SwiftUICore/View/pageControlHidesForSinglePage(_:)``

### Coloring the page indicator

- ``PageControl/SwiftUICore/View/pageControlPageIndicatorTint(_:)``
- ``PageControl/SwiftUICore/View/pageControlCurrentPageIndicatorTint(_:)``

### Managing the indicator images

- ``PageControl/SwiftUICore/View/pageControlIndicatorImage(_:forPage:)``
- ``PageControl/SwiftUICore/View/pageControlCurrentIndicatorImage(_:forPage:)``

### Customizing the layout direction

- ``PageControl/SwiftUICore/View/pageControlDirection(_:)``
- ``Direction``

### Customizing the background style

- ``PageControl/SwiftUICore/View/pageControlBackgroundStyle(_:)``
- ``BackgroundStyle``

### Customizing the interaction state

- ``PageControl/SwiftUICore/View/pageControlContinuousInteractionDisabled(_:)``

### Initializers

- ``init(selection:pageCount:)``

### UIViewRepresentable

- ``makeUIView(context:)``
- ``updateUIView(_:context:)``
- ``sizeThatFits(_:uiView:context:)``
- ``makeCoordinator()``
- ``Coordinator``
