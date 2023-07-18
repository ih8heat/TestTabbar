//
//  TabbarConfigurator.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 18.07.2023.
//

import Foundation

final class TabbarConfigurator {
    public static func configure(event: Event, _ selectedTab: Pages = .page1) -> TabbarView {
        return TabbarView(selectedTab: selectedTab, event: event)
    }
}
