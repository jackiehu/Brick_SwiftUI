//
//  View+Tabbar.swift
//  Example
//
//  Created by iOS on 2023/6/21.
//

import SwiftUI

extension View {
    public func tabBarItem<Selection: Tabable>(tab: Selection, selection: Binding<Selection>) -> some View {
        self.modifier(TabBarItemViewModifier(tab: tab, selection: selection))
    }
    
    public func tabBarForeground<V: View>(_ content: @escaping () -> V) -> some View {
        environment(\.tabBarForegroundView, { AnyView(content()) })
    }
    
    public func tabBarShape(_ shape: any Shape) -> some View {
        environment(\.tabBarShape, shape)
    }
    
    public func tabBarShadow(
        color: Color = Color.black.opacity(0.33),
        radius: CGFloat,
        x: CGFloat = 0,
        y: CGFloat = 0
    ) -> some View {
        environment(\.tabBarShadow, .init(color: color, radius: radius, x: x, y: y))
    }
    
    public func tabBarColor(_ color: Color) -> some View {
        environment(\.tabBarColor, color)
    }
    
    public func tabBarInPadding(_ padding: CGFloat) -> some View {
        environment(\.tabBarInPadding, padding)
    }
    
    public func tabBarHorizontalPadding(_ padding: CGFloat) -> some View {
        environment(\.tabBarHorizontalPadding, padding)
    }
    
    public func tabBarBottomPadding(_ padding: CGFloat) -> some View {
        environment(\.tabBarBottomPadding, padding)
    }
    
    public func tabBarHeight(_ height: CGFloat) -> some View {
        environment(\.tabBarHeight, height)
    }
    
    public func tabBarStyle(_ style: TabBarStyle) -> some View {
        environment(\.tabBarStyle, style)
    }
    
    public func tabBarItemStyle(_ style: TabbarItemStyle) -> some View {
        environment(\.tabBarItemStyle, style)
    }
    
    public func tabBarFont(_ font: Font) -> some View {
        environment(\.tabBarFont, font)
    }
    
    public func tabBarIndicatorHidden(_ hidden: Bool) -> some View {
        environment(\.tabBarIndicatorHidden, hidden)
    }

    @ViewBuilder
    public func visibility(_ visibility: TabbarVisible) -> some View {
        switch visibility {
        case .visible:
            self.transition(.move(edge: .bottom))
        case .hidden:
            hidden().transition(.move(edge: .bottom))
        }
    }
}

extension View {
    func foreground<V: View>(_ content: @escaping () -> V) -> some View {
        return self
            .overlay {
                GeometryReader { geo in
                    content()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                }
            }
    }
    
}
