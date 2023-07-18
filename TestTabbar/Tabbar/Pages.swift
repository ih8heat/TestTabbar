//
//  Pages.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 18.07.2023.
//

import Foundation

enum Pages: String, CaseIterable {
    case page1 = "Page 1", page2 = "Page 2"
    
    var icon: String {
        switch self {
        case .page1:
            return "theatermasks"
        case .page2:
            return "star.fill"
        }
    }
}
