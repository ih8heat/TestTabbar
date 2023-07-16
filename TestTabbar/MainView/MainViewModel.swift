//
//  MainViewModel.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 16.07.2023.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var events: [Event] = [Event.fakeData()]
    let text = "World"
}
