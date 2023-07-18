//
//  Page2View.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 15.07.2023.
//

import SwiftUI

struct Page2View: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: Page2ViewModel
    @Binding var selectedTab: Pages
    
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.text)
                
                Button {
                    viewModel.text = "Page 2 changed"
                } label: {
                    Text("Tap to change text on page 2")
                }
                
                Button {
                    withAnimation(.spring()) {
                        selectedTab = Pages.page1
                    }
                } label: {
                    Text("Go to page 1")
                }
            }
            .navigationTitle(Pages.page2.rawValue)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Dismiss")
                    }
                }
            }
        }
    }
}
