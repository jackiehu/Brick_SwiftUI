//
//  DemoView.swift
//  BrickBrickDemo
//
//  Created by 狄烨 on 2023/7/11.
//

import SwiftUI
import Brick_SwiftUI
struct DemoView: View {
    @State private var showSheet = false
    
    var body: some View {
        Brick.NavigationStack {
            DemoStackView()
            .ss.tabBar(.visible)
            .navigationTitle("Brick_SwiftUI")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        showSheet.toggle()
                    } label: {
                        Text("Sheet")
                    }
                }
            }
            .ss.navigationDestination(for: DemoStack.self) { caseItem in
                switch caseItem{
                case .navigationStack:
                    NavigationStackTView()
                case .openURLView:
                    OpenURLView()
                case .shareLinkView:
                    ShareLinkView()
                case .asyncImageView:
                    AsyncImageView()
                case .scrollsView:
                    ScrollsView()
                case .bannerView:
                    BannerView()
                case .loading:
                    Loading()
                        .environmentObject(LoadingManager())
                case .toast:
                    Toast()
                        .environmentObject(ToastManager())
                case .refresh:
                    Refresh()
                
                case .tTextFieldDemoView:
                    TTextFieldDemoView()
                case .badgeView:
                    BadgeView()
                case .safeAreaPaddingView:
                    SafeAreaPaddingView()
                case .presentationView:
                    PresentationView()
                case .animationCompleted:
                    AnimationCompleted()
                case .scrollStackView:
                    ScrollStackView()
                case .photoPickerView:
                    PhotoPickerView()
                case .focusStateView:
                    FocusStateView()
                case .darkModelView:
                    DarkModelView()
//                case .customTabbar:
//                    CustomTabbarView()
                }
            }
            .sheet(isPresented: $showSheet) {
                SwiftUIView()
            }
//            .ss.bottomSafeAreaInset {
//                VStack{
//                    Button {
//
//                    } label: {
//                        Text("BottomSafeAreaInset")
//                            .frame(width: 100, height: 50)
//                            .background {
//                                Color.orange
//                            }
//                    }
//
//                    Spacer.height(50)
//                }
//            }

        }
        
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}


struct DemoStackView: View {
 
    var body: some View {
        List{
            Section {
                Brick.NavigationLink(value: DemoStack.navigationStack) {
                    Text("NavigationStack")
                }
 
                
                Brick.NavigationLink("OpenURL", value:  DemoStack.openURLView)
                
                Brick.NavigationLink("ShareLink", value: DemoStack.shareLinkView)

                Brick.NavigationLink("AsyncImage", value: DemoStack.asyncImageView)
                
                Brick.NavigationLink("ScrollView", value: DemoStack.scrollsView)
                
                Brick.NavigationLink("BannerView", value: DemoStack.bannerView)
                
                Brick.NavigationLink("Loading", value: DemoStack.loading)
                
                Brick.NavigationLink("Toast", value: DemoStack.toast)
                
                Brick.NavigationLink("Refresh", value: DemoStack.refresh)
            }
            
            Section {

//                        NavigationLink("Quicklook", destination: QuicklookView())
                
                Brick.NavigationLink("TTextField", value: DemoStack.tTextFieldDemoView)
                
                Brick.NavigationLink("BadgeView + Tarbar", value: DemoStack.badgeView)
                
                Brick.NavigationLink("SafeAreaPadding", value: DemoStack.safeAreaPaddingView)
                
                Brick.NavigationLink("Presentation", value: DemoStack.presentationView)
                
                
                Brick.NavigationLink("AnimationCompleted", value: DemoStack.animationCompleted)
                
                Brick.NavigationLink("ScrollStackView", value: DemoStack.scrollStackView)
                
//                Brick.NavigationLink("CustomTabbar", value: DemoStack.customTabbar)
#if os(iOS)
                
                Brick.NavigationLink("Photo", value: DemoStack.photoPickerView)
                
                
                Brick.NavigationLink("FocusState", value: DemoStack.focusStateView)

                Brick.NavigationLink("DrrkModelView", value: DemoStack.darkModelView)
#endif
            }
            
        }
    }
    

}

struct DemoStackView_Previews: PreviewProvider {
    static var previews: some View {
        DemoStackView()
    }
}


enum DemoStack: NavigatorScreen, CaseIterable {
    case navigationStack
    case openURLView
    case shareLinkView
    case asyncImageView
    case scrollsView
    case bannerView
    case loading
    case toast
    case refresh
    
    case tTextFieldDemoView
    case badgeView
    case safeAreaPaddingView
    case presentationView
    case animationCompleted
    case scrollStackView
    case photoPickerView
    case focusStateView
    case darkModelView
//    case customTabbar
}
