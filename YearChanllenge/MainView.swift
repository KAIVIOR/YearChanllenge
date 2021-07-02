//
//  MainView.swift
//  YearChanllenge
//
//  Created by 吳庭愷 on 2021/7/2.
//

import SwiftUI

struct MainView: View {
    @State private var sceondView = false
    var body: some View {
        ZStack{
        Image("screen")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                
            VStack{
                Button(action: {
                     sceondView = true
                }, label: {
                   
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("Color"), lineWidth: 5)
                    .frame(width: 300, height:50)
                        .background(Color("Color"))
                           .cornerRadius(10)
                        .overlay(
                            Text("Lebron 10 Year Chanllenge")
                                .bold()
                                .foregroundColor(.white)
                                .font(.system(size: 23))
                                .frame(width: 300, height: 100)
                        )
                }).offset(x: 0, y: 150)
                    .fullScreenCover(isPresented: $sceondView, content: {
                        PhotoView(sceondView: $sceondView)
                    })
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
