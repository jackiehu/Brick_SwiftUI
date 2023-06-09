//
// Copyright (c) Vatsal Manot
//

import SwiftUI

extension GridItem {
    public static func flexible(
        spacing: CGFloat? = nil,
        alignment: Alignment? = nil
    ) -> Self {
        GridItem(.flexible(), spacing: spacing, alignment: alignment)
    }
}
