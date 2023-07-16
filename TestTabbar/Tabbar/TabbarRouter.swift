//
//  TabbarRouter.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 15.07.2023.
//

import SwiftUI

final class TabbarRouter {
    static func destinationPage1(_ selectedTab: Binding<String>, text: String) -> some View {
        LazyView(
            Page1Configurator.configure(selectedTab, text)
                .tabItem {
                    Image(systemName: "theatermasks")
                    Text("Page1")
                }
                .tag(Pages.page1.rawValue)
        )
    }
    
    static func destinationPage2(_ selectedTab: Binding<String>, text: String) -> some View {
        LazyView(
            Page2Configurator.configure(selectedTab, text)
                .tabItem {
                    Image(systemName: "theatermasks")
                    Text("Page2")
                }
                .tag(Pages.page2.rawValue)
        )
    }
}


enum Pages: String {
    case page1 = "Page 1", page2 = "Page 2"
}
