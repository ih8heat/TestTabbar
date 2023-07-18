//
//  ContentViewRouter.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 16.07.2023.
//

import SwiftUI

final class ContentViewRouter {
    static func destinationTabbar(Event: Event) -> some View {
        LazyView(
            TabbarView(event: Event)
        )
    }
}
