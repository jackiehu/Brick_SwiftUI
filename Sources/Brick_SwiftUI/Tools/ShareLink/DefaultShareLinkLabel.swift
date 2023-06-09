import SwiftUI
public struct DefaultShareLinkLabel: View {
    let text: Text
    private static let shareIcon = "square.and.arrow.up"
    
    init() {
        text = .init("Share")
    }
    
    init<S: StringProtocol>(_ title: S) {
        text = .init(title)
    }
    
    init(_ titleKey: LocalizedStringKey) {
        text = .init(titleKey)
    }
    
    init(_ title: Text) {
        text = title
    }
    
    public var body: some View {
        Label {
            text
        } icon: {
            Image(systemName: Self.shareIcon)
        }
    }
}
