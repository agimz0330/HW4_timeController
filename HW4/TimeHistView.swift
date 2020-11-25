//
//  TimeHistView.swift
//  HW4
//
//  Created by User09 on 2020/11/24.
//

import SwiftUI

struct TimeHistView: View {
    @ObservedObject var thingData = ThingData()
    @State private var h: CGFloat = 0
    
    var totalTime: Double = 0
    var dododo = ["吃飯","睡覺","逛街","讀書","通勤","遊戲","上課","寫作業","聊天","梳洗","耍廢"]
    var countTime: [Double] = [0,0,0,0,0,0,0,0,0,0,0]

    init(thingData: ThingData){
        for data in thingData.things{
            let time = data.finishTime.timeIntervalSince(data.startTime)
            
            for i in 0 ..< dododo.count{
                if (data.activity == dododo[i]){
                    countTime[i] += time
                    totalTime += time
                }
            }
        }
    }

    var body: some View {
        let bgColor = Color(red: 246/255, green: 234/255, blue: 224/255)
        let redColor = Color(red: 200/255, green: 141/255, blue: 127/255)
        let red:  [Double] = [210,200,190,180,170,160,150,140,130,120,110,100]
        let green:[Double] = [150,140,130,120,110,100, 90, 80, 70, 60, 50, 40]
        let blue: [Double] = [130,120,110,100, 90, 80, 70, 60, 50, 40, 30, 20]
        ZStack{
            bgColor
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                HStack(alignment: .bottom){
                    ForEach(0 ..< countTime.count){(i) in
                        if countTime[i] >= 10{
                            VStack{
                                ZStack(alignment: .bottom){
                                    Rectangle()
                                        .fill(Color(red: 120/255, green: 180/255, blue: 130/255))
                                        .frame(width: 25, height: h)
                                        .cornerRadius(.infinity)
                                    Rectangle()
                                        .fill(Color(red: red[i]/255, green: green[i]/255, blue: blue[i]/255))
                                        .frame(width: 25, height: CGFloat(countTime[i]/200))
                                        .cornerRadius(.infinity)
                                        .animation(.linear(duration: 2))
                                        .onAppear{
                                            h = CGFloat(totalTime/200)
                                        }
                                }
                                Text("\(dododo[i])")
                                    .font(.custom("HanyiSentyChalkOriginal", size: 15))
                                    .foregroundColor(redColor)
                            }
                        }
                    }
                }
                Text("\n花費時間長條圖")
                    .font(.custom("HanyiSentyCrayon", size: 60))
            }
        }
        
    }
}

struct TimeHistView_Previews: PreviewProvider {
    static var previews: some View {
        TimeHistView(thingData: ThingData())
    }
}
