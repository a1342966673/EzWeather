//
//  ContentView.swift
//  tianqi
//
//  Created by RemiliaScarlet on 2021/1/1.
//

import SwiftUI
import SwiftUICharts
import Alamofire

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}//滋磁16进制色

struct ContentView: View {
    
    @ObservedObject var localArea = LocationViewModel()
    @ObservedObject var cyJsonRT = CaiYunJsonRealtime()
    @ObservedObject var cyJsonVDay = CaiYunJsonVDay()
    
    
    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    Text("天气-\(localArea.myLocalArea)")
                        .font(.headline)
                    HStack{
                        Button(action: {}, label: {
                            Image(systemName: "pencil")
                        })
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "list.dash")
                        })
                    }
                }
                .padding(.horizontal)//tab栏
                ScrollView {
                    MainCardView()
                    .padding([.top, .leading, .trailing])
                    .cornerRadius(3)
                    //主要天气卡片d
                    FiveDaysView()
                    .padding(.horizontal)
                    //横像滚动卡片（5天天气预报）
                    OneDayView()
                    .padding(.horizontal)
                    //24小时图表卡片
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .frame(height: 150)
                        VStack{
                            HStack{
                                Text("生活指数")
                                    .font(.subheadline)
                                Spacer()
                            }
                            .padding([.top, .leading, .trailing])
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    //高级数据卡片
                }
                .background(Color.init(hex: 0xf5f5f5))
            }
        }.onAppear(perform: {
            cyJsonRT.cyNetworkStart()
            cyJsonVDay.cyNetworkStart()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
