//
//  ContentView.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 16.07.2023.
//

import SwiftUI

struct ContentView: View, AppNavigator {
    @ObservedObject var viewModel: MainViewModel
    @State private var shouldShowTabbarNatively: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                Button {
                    navigator.presentView(
                        view: ContentViewRouter.destinationTabbar(event: viewModel.events.first ?? Event.fakeData(id: "Cant find the event"))
                    )
                } label: {
                    Text("Show Tabbar")
                }
                
                Button {
                    shouldShowTabbarNatively.toggle()
                } label: {
                    Text("Show Tabbar Natively")
                }
                .fullScreenCover(isPresented: $shouldShowTabbarNatively) {
                    ContentViewRouter.destinationTabbar(event: viewModel.events.first ?? Event.fakeData(id: "Cant find the event"))
                }
            }
            .navigationTitle("Main")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
