//
//  Page2Configurator.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 15.07.2023.
//

import SwiftUI

final class Page2Configurator {
    public static func configure(_ selectedTab: Binding<Pages>, _ text: String) -> Page2View {
        let viewModel = Page2ViewModel(text: text)
        return Page2View(viewModel: viewModel, selectedTab: selectedTab)
    }
}
