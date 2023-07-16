//
//  LazyView.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 16.07.2023.
//

import SwiftUI

struct LazyView<Content: View>: View {
    private let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content ) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
