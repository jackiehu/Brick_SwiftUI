//
//  ColorEx.swift
//  SwiftBrick
//
//  Created by iOS on 2023/4/20.
//  Copyright © 2023 狄烨 . All rights reserved.
//
import SwiftUI
#if os(iOS)
import UIKit
public extension Color {
 
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        let length = hexSanitized.count
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            self.init(red: r, green: g, blue: b, opacity: a)
            return
        }
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
            
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
            
        } else {
            self.init(red: r, green: g, blue: b, opacity: a)
        }
        
        self.init(red: r, green: g, blue: b, opacity: a)
    }
    
    func toHex() -> String? {
        let uic = UIColor(self)
        guard let components = uic.cgColor.components, components.count >= 3 else {
            return nil
        }
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        
        if components.count >= 4 {
            a = Float(components[3])
        }
        
        if a != Float(1.0) {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}

public extension Color {
    static func dynamic(light: String, dark: String) -> Color {
        let l = UIColor(hex: light)
        let d = UIColor(hex: dark)
        return UIColor.dynamicColor(light: l, dark: d).toColor()
    }
    
    
    static func dynamic(light: Color, dark: Color) -> Color {
        let l = UIColor(light)
        let d = UIColor(dark)
        return UIColor.dynamicColor(light: l, dark: d).toColor()
    }
    
    
    func toUIColor() -> UIColor {
        return UIColor(self)
    }
}

public extension UIColor {
    func toColor() -> Color {
        return Color(self)
    }
}


public extension Color {

    static let defaultBackground = Color(light: .white, dark: .black)

    init(light: Color, dark: Color) {
        self.init(UIColor.dynamicColor(light: light.toUIColor(), dark: dark.toUIColor()))
    }
}

struct DetectThemeChange: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        
        if(colorScheme == .dark){
            content.colorInvert()
        }else{
            content
        }
    }
}

public extension View {
    func invertOnDarkTheme() -> some View {
        modifier(DetectThemeChange())
    }
}
#endif


extension Color {
    public static var almostClear: Color {
        Color.black.opacity(0.0001)
    }
}
