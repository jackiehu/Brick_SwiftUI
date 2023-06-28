//
//  SwiftUIView.swift
//  
//
//  Created by iOS on 2023/6/28.
//

import SwiftUI
// MARK: - View.background
extension View {
    @_disfavoredOverload
    @inlinable
    public func background<Background: View>(
        alignment: Alignment = .center,
        @ViewBuilder _ background: () -> Background
    ) -> some View {
        self.background(background(), alignment: alignment)
    }

    @_disfavoredOverload
    @inlinable
    public func background(_ color: Color) -> some View {
        background(
            PassthroughView{
                color
            }
            .eraseToAnyView()
        )
    }
    
    @inlinable
    public func backgroundFill(_ color: Color) -> some View {
        background(color.edgesIgnoringSafeArea(.all))
    }
    
    @inlinable
    public func backgroundFill<BackgroundFill: View>(
        _ fill: BackgroundFill,
        alignment: Alignment = .center
    ) -> some View {
        background(fill.edgesIgnoringSafeArea(.all), alignment: alignment)
    }
    
    @inlinable
    public func backgroundFill<BackgroundFill: View>(
        alignment: Alignment = .center,
        @ViewBuilder _ fill: () -> BackgroundFill
    ) -> some View {
        backgroundFill(fill())
    }
}

public struct PassthroughView<Content: View>: View {
    @usableFromInline
    let content: Content
    
    @inlinable
    public init(content: Content) {
        self.content = content
    }
    
    @inlinable
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    @inlinable
    public var body: some View {
        content
    }
}
