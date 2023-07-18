//
//  TabbarRouter.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 15.07.2023.
//

import SwiftUI

final class TabbarRouter {
    static func destinationPage1(_ selectedTab: Binding<Pages>, event: Event) -> some View {
        LazyView(
            Page1Configurator.configure(selectedTab, event)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background {
                    Color.black.opacity(0.04)
                        .ignoresSafeArea()
                }
                .tag(Pages.page1)
        )
    }
    
    static func destinationPage2(_ selectedTab: Binding<Pages>, event: Event) -> some View {
        LazyView(
            Page2Configurator.configure(selectedTab, event)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background {
                    Color.black.opacity(0.04)
                        .ignoresSafeArea()
                }
                .tag(Pages.page2)
        )
    }
}
