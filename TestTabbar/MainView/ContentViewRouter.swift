//
//  ContentViewRouter.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 16.07.2023.
//

import SwiftUI

final class ContentViewRouter {
    static func destinationTabbar(event: Event) -> some View {
        LazyView(
            TabbarConfigurator.configure(event: event)
        )
    }
}
