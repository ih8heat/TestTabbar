//
//  Page2ViewModel.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 15.07.2023.
//

import Foundation

final class Page2ViewModel: ObservableObject {
    @Published var text: String = ""
    private var test: Bool = true
    
    init(text: String) {
        self.text = text
        print("page 2 init")
    }
    
    deinit {
        print("page 2 deinit")
    }
}
