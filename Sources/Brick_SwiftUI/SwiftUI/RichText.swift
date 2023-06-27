//
//  SwiftUIView.swift
//  
//
//  Created by iOS on 2023/6/27.
//

import SwiftUI

extension Text {
    
    @_disfavoredOverload
    @inlinable
    public init<S: StringProtocol>(
        separator: S,
        @RichText blocks: () -> [Text]
    ) {
        self.init(separator: Text(separator), blocks: blocks)
    }
    
    @inlinable
    public init(
        separator: LocalizedStringKey,
        @RichText blocks: () -> [Text]
    ) {
        self.init(separator: Text(separator), blocks: blocks)
    }
    
    @inlinable
    public init(
        separator: Text,
        @RichText blocks: () -> [Text]
    ) {
        let blocks = blocks()
        switch blocks.count {
        case 0:
            self = Text(verbatim: "")
            
        case 1:
            self = blocks[0]
            
        default:
            self = blocks.dropFirst().reduce(into: blocks[0]) { result, text in
                result = result + separator + text
            }
        }
    }
}

@frozen
@resultBuilder
public struct RichText{
    
    @inlinable
    public static func buildBlock() -> [Optional<Text>] {
        []
    }
    
    @inlinable
    public static func buildPartialBlock(
        first: [Optional<Text>]
    ) -> [Optional<Text>] {
        first
    }
    
    @inlinable
    public static func buildPartialBlock(
        accumulated: [Optional<Text>],
        next: [Optional<Text>]
    ) -> [Optional<Text>] {
        accumulated + next
    }
    
    @inlinable
    public static func buildExpression(
        _ expression: Text
    ) -> [Optional<Text>] {
        [expression]
    }
    
    @inlinable
    public static func buildEither(
        first component: [Optional<Text>]
    ) -> [Optional<Text>] {
        component
    }
    
    @inlinable
    public static func buildEither(
        second component: [Optional<Text>]
    ) -> [Optional<Text>] {
        component
    }
    
    @inlinable
    public static func buildOptional(
        _ component: [Optional<Text>]?
    ) -> [Optional<Text>] {
        component ?? []
    }
    
    @inlinable
    public static func buildLimitedAvailability(
        _ component: [Optional<Text>]
    ) -> [Optional<Text>] {
        component
    }
    
    @inlinable
    public static func buildArray(
        _ components: [Optional<Text>]
    ) -> [Optional<Text>] {
        components
    }
    
    @inlinable
    public static func buildBlock(
        _ components: [Optional<Text>]...
    ) -> [Optional<Text>] {
        components.flatMap { $0 }
    }
    
    public static func buildFinalResult(
        _ component: [Optional<Text>]
    ) -> [Text] {
        component.compactMap { $0 }
    }
}

// MARK: - Previews

struct RichText_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
    
    struct Preview: View {
        @State var flag = false
        
        var body: some View {
            VStack {
                Toggle(isOn: $flag) { Text("Flag") }
                
                Text(separator: " ") {
                    if flag {
                        Text("~")
                    }
                    
                    Text("Hello")
                        .font(.headline)
                        .foregroundColor(.red)
                    
                    Text("World")
                        .fontWeight(.light)
                    
                    if flag {
                        Text("!")
                    } else {
                        Text(".")
                    }
                }
            }
        }
    }
}