import Foundation
import SwiftUI
/// Utilty for applying a transform to a value.
/// - Parameters:
///   - transform: The transform to apply.
///   - input: The value to be transformed.
/// - Returns: The transformed value.
func apply<T>(_ transform: (inout T) -> Void, to input: T) -> T {
    var transformed = input
    transform(&transformed)
    return transformed
}

class PathAppender: ObservableObject {
    var append: ((AnyHashable) -> Void)?
}


public protocol NavigatorScreen: Hashable {}

extension AnyHashable: NavigatorScreen {}

