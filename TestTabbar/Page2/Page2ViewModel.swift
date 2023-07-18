//
//  Page2ViewModel.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 15.07.2023.
//

import Foundation

final class Page2ViewModel: ObservableObject {
    @Published var event: Event
    private var test: Bool = true
    
    init(event: Event) {
        self.event = event
        print("page 2 init")
    }
    
    deinit {
        print("page 2 deinit")
    }
}
