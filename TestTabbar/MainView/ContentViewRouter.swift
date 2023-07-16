//
//  ContentViewRouter.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 16.07.2023.
//

import SwiftUI

final class ContentViewRouter {
    static func destinationTabbar(text: String) -> some View {
        LazyView(
            TabbarView(text: text)
        )
    }
}
