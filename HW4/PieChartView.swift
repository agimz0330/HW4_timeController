//
//  PieChartView.swift
//  HW4
//
//  Created by User09 on 2020/11/24.
//

import SwiftUI

struct PieChartView: View {
    var startAngle: [Angle]
    
    var body: some View {
        let red:  [Double] = [210,200,190,180,170,160,150,140,130,120,110,100]
        let green:[Double] = [150,140,130,120,110,100, 90, 80, 70, 60, 50, 40]
        let blue: [Double] = [130,120,110,100, 90, 80, 70, 60, 50, 40, 30, 20]
        let iii = startAngle.count-1
        VStack{
            ZStack {
                ForEach(0 ..< startAngle.count-1){(i) in
                    PieChart(startAngle: self.startAngle[i], endAngle: self.startAngle[i+1])
                        .fill(Color(red: red[i]/255, green: green[i]/255, blue: blue[i]/255))
                }
                if startAngle.count != 0{
                    PieChart(startAngle: self.startAngle[iii], endAngle: .degrees(360))
                        .fill(Color(red: red[iii]/255, green: green[iii]/255, blue: blue[iii]/255))
                }
            }
        }
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(startAngle: [.degrees(0), .degrees(100), .degrees(200), .degrees(300), .degrees(360)])
            .frame(width: 200, height: 200)
    }
}

struct PieChart: Shape{
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        Path{(path) in
            let center = CGPoint(x: rect.midX, y:rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
