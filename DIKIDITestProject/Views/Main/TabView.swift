//
//  TabView.swift
//  DIKIDITestProject
//
//  Created by Andrei Panasenko on 14.12.2022.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var responseVM: ResponseViewModel
    
    var body: some View {
        TabView {
            MainView(responseVM: responseVM)
                .tabItem {
                    VStack {
                        Image(systemName: "homekit")
                        Text("Главная")
                    }
                }
            
            Color.red
                .tabItem {
                    VStack{
                        Image(systemName: "percent")
                        Text("Акции")
                    }
                }
            
            Color.green
                .tabItem {
                    VStack{
                        Image(systemName: "book")
                        Text("Мои записи")
                    }
                }
            
            Color.blue
                .tabItem {
                    VStack{
                        Image(systemName: "chart.bar.doc.horizontal")
                        Text("Чаты")
                    }
                }
            
            Color.black
                .tabItem {
                    VStack{
                        Image(systemName: "ellipsis")
                        Text("Еще")
                    }
                }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass.circle")
                        .foregroundColor(.blue)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "paperplane.circle")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}
