//
//  MainView.swift
//  SentimentsOnTwitter
//
//  Created by jagjeet on 29/09/20.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var Twitter:TwitterAnalysis
    @State var item1 = false
    @State var item2 = true
    @State var item3 = true
    var body: some View {
        TabView{
            ContentView()
                .onAppear(){
                    self.item1.toggle()
                    self.item2.toggle()
                    self.item3.toggle()
                   
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .font(self.item1 ? .system(size: 30):.system(size: 15))
                        .animation(.interpolatingSpring(stiffness: 200, damping: 10))
                }
                
            TweetsView()
                .onAppear(){
                    self.item1.toggle()
                    self.item2.toggle()
                    self.item3.toggle()
                }
                .tabItem{
                 Image(systemName: "text.bubble")
                    .font(self.item2 ? .system(size: 30):.system(size: 15))
                    .animation(.interpolatingSpring(stiffness: 200, damping: 10))
                }
                
            GraphView()
                .onAppear(){
                    self.item1.toggle()
                    self.item2.toggle()
                    self.item3.toggle()
                }
                .tabItem {
                    Image(systemName: "chart.bar")
                        .font(self.item3 ? .system(size: 30):.system(size: 15))
                        .animation(.interpolatingSpring(stiffness: 200, damping: 10))
                }
                
        }
        .transition(.scale)
    }
}

struct MainView_Previews: PreviewProvider {
   
    static var previews: some View {
        MainView().environmentObject(TwitterAnalysis())
    }
}
