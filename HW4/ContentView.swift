//
//  ContentView.swift
//  HW4
//
//  Created by User08 on 2020/11/4.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddData = false
    @ObservedObject var thingData = ThingData()
    var body: some View {
        let redColor = Color(red: 200/255, green: 141/255, blue: 127/255)
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView{
                nowTimeView()
                    .tabItem{
                        Text("HOME")
                        Image(systemName: "house")
                    }
                doListView()
                    .tabItem {
                        Text("TODAY")
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    }
                Text("")
                    .tabItem {
                        Text("")
                    }
                CostChartView(thingData: self.thingData)
                    .tabItem {
                        Text("COST")
                        Image(systemName: "chart.pie")
                    }
                TimeHistView(thingData: self.thingData)
                    .tabItem {
                        Text("TIME")
                        Image(systemName: "timer")
                    }
            }
            .accentColor(redColor)
            .sheet(isPresented: $showAddData){
                addDataView(thingData: ThingData())
            }
            
            Button(action: {
                showAddData = true
            }, label:{
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .offset(x: 0, y: -13)
                    .accentColor(redColor)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
