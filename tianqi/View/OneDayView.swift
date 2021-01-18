//
//  OneDayView.swift
//  tianqi
//
//  Created by RemiliaScarlet on 2021/1/18.
//

import SwiftUI
import SwiftUICharts

struct OneDayView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .frame(height: 300)
            VStack{
                HStack{
                    Text("24小时温度")
                        .font(.subheadline)
                    Spacer()
                }
                .padding(.horizontal)
                LineChartView(data: [90,99,78,111,70,60,77], title: "",form: ChartForm.extraLarge, dropShadow: false)
            }
        }
    }
}

struct OneDayView_Previews: PreviewProvider {
    static var previews: some View {
        OneDayView()
    }
}
