//
//  OneDayView.swift
//  tianqi
//
//  Created by RemiliaScarlet on 2021/1/18.
//

import SwiftUI
import SwiftUICharts

struct OneDayView: View {
    
    @ObservedObject var cyJson = CaiyunJsonXXIV()
    
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
                LineChartView(data: cyJson.highTem, title: "",form: ChartForm.extraLarge, dropShadow: false)
            }
        }
    }
}

struct OneDayView_Previews: PreviewProvider {
    static var previews: some View {
        OneDayView()
    }
}
