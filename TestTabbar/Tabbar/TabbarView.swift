//
//  ContentView.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 15.07.2023.
//

import SwiftUI

struct TabbarView: View {
    @State private var selectedTab: String
    private let text: String
    
    init(
        selectedTab: String = Pages.page1.rawValue,
        text: String
    ) {
        self._selectedTab = State(initialValue: selectedTab)
        self.text = text
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TabbarRouter.destinationPage1($selectedTab, text: text)
            TabbarRouter.destinationPage2($selectedTab, text: text)
        }
        .onAppear {
            print(text)
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(selectedTab: Pages.page1.rawValue, text: "Hello")
    }
}
