//
//  ContentView.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 15.07.2023.
//

import SwiftUI

struct TabbarView: View {
    @State private var selectedTab: Pages
    @Namespace private var animation
    private let event: Event
    
    init(
        selectedTab: Pages = Pages.page1,
        event: Event
    ) {
        self._selectedTab = State(initialValue: selectedTab)
        self.event = event
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    TabbarRouter.destinationPage1($selectedTab, event: event)
                    TabbarRouter.destinationPage2($selectedTab, event: event)
                }
                .onAppear {
                    print(event)
                }
                
                CustomTabbar(currentTab: $selectedTab, animation: animation, size: proxy.size, bottomEdge: proxy.safeAreaInsets.bottom)
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}


struct CustomTabbar: View {
    @State private var startAnimation: Bool = false
    @Binding var currentTab: Pages
    var animation: Namespace.ID
    var size: CGSize
    var bottomEdge: CGFloat
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Pages.allCases, id: \.rawValue) { tab in
                TabbarButtons(currentTab: $currentTab, tab: tab, animation: animation) { pressedTab in
                    withAnimation(
                        .interactiveSpring(
                            response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)
                    ) {
                        startAnimation = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        withAnimation(
                            .interactiveSpring(
                                response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)
                        ) {
                            currentTab = pressedTab
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                        withAnimation(
                            .interactiveSpring(
                                response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)
                        ) {
                            startAnimation = false
                        }
                    }
                }
            }
        }
        .background(alignment: .leading) {
            ZStack {
                let animationOffset: CGFloat =
                (startAnimation ? (startAnimation ? 15 : 18) : (bottomEdge == 0 ? 26 : 27))
                let offset: CGSize = bottomEdge == 0
                ? CGSize(width: animationOffset, height: 31)
                : CGSize(width: animationOffset, height: 36)
                
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: 45, height: 45)
                    .offset(y: 40)
                
                Circle()
                    .fill(.white)
                    .frame(width: 45, height: 45)
                    .scaleEffect(bottomEdge == 0 ? 0.8 : 1)
                    .offset(x: offset.width, y: offset.height)
                
                Circle()
                    .fill(.white)
                    .frame(width: 45, height: 45)
                    .scaleEffect(bottomEdge == 0 ? 0.8 : 1)
                    .offset(x: -offset.width, y: offset.height)
            }
            .offset(x: getStartOffset())
            .offset(x: getOffset())
        }
        .padding(.horizontal, 15)
        .padding(.top, 7)
        .padding(.bottom, bottomEdge == 0 ? 15 : bottomEdge)
    }
    
    private func getStartOffset() -> CGFloat {
        let paddings: CGFloat = 30
        let tabCount: CGFloat = 2
        let buttonSize: CGFloat = 45
        let reduced = (size.width - paddings) / tabCount
        let center = (reduced - buttonSize) / 2
        return center
    }
    
    private func getOffset() -> CGFloat {
        let paddings: CGFloat = 30
        let tabCount: CGFloat = 2
        let reduced = (size.width - paddings) / tabCount
        let index = Pages.allCases.firstIndex(where: { $0 == currentTab }) ?? 0
        return reduced * CGFloat(index)
    }
}

struct TabbarButtons: View {
    @Binding var currentTab: Pages
    var tab: Pages
    var animation: Namespace.ID
    var onTap: (Pages) -> Void
    
    var body: some View {
        Image(systemName: tab.icon)
            .foregroundColor(currentTab == tab ? .white : .gray)
            .frame(width: 45, height: 45)
            .background {
                ZStack {
                    if currentTab == tab {
                        Circle()
                            .fill(Color.purple)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
            .onTapGesture {
                if currentTab != tab {
                    onTap(tab)
                }
                
//                onTap(tab)
            }
    }
}


struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(selectedTab: Pages.page1, event: Event.fakeData())
    }
}
