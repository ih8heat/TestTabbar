//
//  ContentViewConfigurator.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 16.07.2023.
//

import SwiftUI

final class ContentViewConfigurator {
    public static func configure() -> ContentView {
        let viewModel = MainViewModel()
        return ContentView(viewModel: viewModel)
    }
}
