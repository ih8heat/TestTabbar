//
//  Page1View.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 15.07.2023.
//

import SwiftUI

struct Page1View: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: Page1ViewModel
    @Binding var selectedTab: Pages
    
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.text)
                
                Button {
                    viewModel.text = "Changed"
                } label: {
                    Text("Tap to change")
                }
                
                Button {
                    withAnimation(.spring()) {
                        selectedTab = Pages.page2
                    }
                } label: {
                    Text("Go to page 2")
                }
            }
            .navigationTitle(Pages.page1.rawValue)
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
