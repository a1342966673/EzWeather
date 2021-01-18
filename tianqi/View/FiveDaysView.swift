//
//  FiveDaysView.swift
//  tianqi
//
//  Created by RemiliaScarlet on 2021/1/18.
//

import SwiftUI

struct FiveDaysView: View {
    @ObservedObject var cyVDaysData = CaiYunJsonVDay()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(width: 200, height: 150)
                }
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(width: 200, height: 150)
                }
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(width: 200, height: 150)
                }
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(width: 200, height: 150)
                }
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(width: 200, height: 150)
                }
                
            }
        }
    }
}

struct FiveDaysView_Previews: PreviewProvider {
    static var previews: some View {
        FiveDaysView()
    }
}
