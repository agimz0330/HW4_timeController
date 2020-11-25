//
//  todayFoodList.swift
//  HW4
//
//  Created by User08 on 2020/11/4.
//

import SwiftUI

struct todayFoodList: View {
    var body: some View {
        NavigationView{
            List{
                
            }
            .navigationTitle("\(1)Date")
            .navigationBarItems(leading: EditButton().accentColor(.purple))
        }
    }
}

struct todayFoodList_Previews: PreviewProvider {
    static var previews: some View {
        todayFoodList()
    }
}
