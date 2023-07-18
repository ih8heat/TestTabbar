//
//  Page1Configurator.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 15.07.2023.
//

import SwiftUI

final class Page1Configurator {
    public static func configure(_ selectedTab: Binding<Pages>, _ event: Event) -> Page1View {
        let viewModel = Page1ViewModel(event: event)
        return Page1View(viewModel: viewModel, selectedTab: selectedTab)
    }
}
