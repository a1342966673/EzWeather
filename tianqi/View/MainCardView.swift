//
//  MainCardView.swift
//  tianqi
//
//  Created by RemiliaScarlet on 2021/1/18.
//

import SwiftUI

struct MainCardView: View {
    @ObservedObject var cyJsonRT = CaiYunJsonRealtime()
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(height: 400)
                .foregroundColor(.white)
                .cornerRadius(10)
            VStack{
                HStack{
                    Text("空气质量-\(cyJsonRT.airQuality)")
                        .font(.caption2)
                    Spacer()
                }
                Spacer()
                Text("\(cyJsonRT.nowTem)℃")
                    .fontWeight(.heavy)
                    .font(.custom("", size: 50))
                    .padding()
                HStack{
                    Group{
                        Text("\(cyJsonRT.skycon)")
                        Text("\(cyJsonRT.windDirection)")
                        Text("湿度\(cyJsonRT.humidity)%")
                    }.font(.caption)
                }
                Spacer()
            }
            .padding()
        }    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainCardView()
    }
}
