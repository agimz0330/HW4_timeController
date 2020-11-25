//
//  CostChartView.swift
//  HW4
//
//  Created by User09 on 2020/11/24.
//

import SwiftUI

struct CostChartView: View {
    @ObservedObject var thingData = ThingData()
    
    var totalCost: Double = 0
    var dododo = ["吃飯","睡覺","逛街","讀書","通勤","遊戲","上課","寫作業","聊天","梳洗","耍廢"]
    var countCost: [Double] = [0,0,0,0,0,0,0,0,0,0,0]
    var angles = [Angle]()
    var startDegree = 0.0
    
    init(thingData: ThingData){
        for data in thingData.things{
            for i in 0 ..< dododo.count{
                if (data.activity == dododo[i]) && (data.costMoney){
                    countCost[i] += data.money
                    totalCost += data.money
                }
            }
        }
        for cost in countCost{
            angles.append(.degrees(startDegree))
            startDegree += 360*(cost/totalCost)
        }
    }
    
    var body: some View {
        let red:  [Double] = [210,200,190,180,170,160,150,140,130,120,110,100]
        let green:[Double] = [150,140,130,120,110,100, 90, 80, 70, 60, 50, 40]
        let blue: [Double] = [130,120,110,100, 90, 80, 70, 60, 50, 40, 30, 20]
        let bgColor = Color(red: 246/255, green: 234/255, blue: 224/255)
        let redColor = Color(red: 200/255, green: 141/255, blue: 127/255)
        ZStack{
            bgColor
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("總支出: $ \(totalCost, specifier: "%.0f")元")
                    .font(.custom("HanyiSentyFingerPainting", size: 40))
                    .foregroundColor(redColor)
                PieChartView(startAngle: angles)
                    .frame(width: 200, height: 200)
                Group{
                    ForEach(0 ..< angles.count){(i) in
                        if countCost[i] != 0{
                            HStack{
                                Color(red: red[i]/255, green: green[i]/255, blue: blue[i]/255)
                                    .frame(width:100, height: 20)
                                    .cornerRadius(25)
                                Text("\(dododo[i]) ")
                                    .font(.custom("HanyiSentyChalkOriginal", size: 20))
                                    .foregroundColor(redColor)
                                Text("(\(countCost[i]/totalCost*100, specifier: "%.0f")%)")
                                    .font(.custom("WildySansRegular", size: 25))
                                    .foregroundColor(redColor)
                            }
                        }
                    }
                }
                Text("")
                Text("開銷圓餅圖")
                    .font(.custom("HanyiSentyCrayon", size: 60))
            }
        }
    }
}

struct CostChartView_Previews: PreviewProvider {
    static var previews: some View {
        CostChartView(thingData: ThingData())
    }
}
