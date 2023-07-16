//
//  Page1ViewModel.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 15.07.2023.
//

import Foundation

final class Page1ViewModel: ObservableObject {
    @Published var text: String = ""
    private var test: Bool = true
    
    init(text: String) {
        self.text = text
        print("page 1 init")
    }
    
    deinit {
        print("page 1 deinit")
    }
}
