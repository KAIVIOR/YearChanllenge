//
//  PhotoView.swift
//  YearChanllenge
//
//  Created by 吳庭愷 on 2021/7/2.
//

import SwiftUI
import AVFoundation
struct PhotoView: View {
    @Binding var sceondView: Bool
    @State private var datePickerDate = Date()
    @State private var slider : Double = 2003
    @State private var autoplay = false
    @State private var Num = 0
    @State private var photo = 21
    var bgmPlayer: AVPlayer { AVPlayer.sharedSpinPlayer}
    var body: some View{
        ZStack{
            Color("Color-1")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Button(action:{
                        sceondView = false
                    }){
                        Image(systemName: "arrowshape.turn.up.left")
                            .resizable()
                            .scaledToFit()
                            .frame(height:30)
                            .foregroundColor(Color("Color"))
                    }
                    Spacer()
                    Text("Lebron James")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                    Spacer()
                }
                HStack(alignment: .center, spacing: nil, content: {
                    if !autoplay {
                        Text(String(Int(slider)))
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color"))
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        if(Num%2==0){
                            autoplay = true
                            bgmPlayer.playFromStart()
                        }
                        else{
                            autoplay = false
                            bgmPlayer.pause()
                        }
                        Num += 1
                    }, label: {
                        Text("自動播放")
                            .bold()
                            .foregroundColor(.white)
                        Image(systemName: "play.rectangle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height:30)
                            .foregroundColor(Color("Color"))
                        
                    })
                    .onChange(of: autoplay, perform: { value in
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                            if !autoplay {
                                timer.invalidate()
                            }
                            if(photo > 20 ){
                                photo = 3
                            }
                            else{
                                photo += 1
                            }
                            
                        }
                    })
                })

                HStack{
                    Image(String(photo))
                                    .resizable()
                                    .scaledToFit()
                                   // .frame(width: 400, height: 500, alignment: .center)

                }
                .padding(.horizontal, 20)
                .padding(.vertical, 25)
                .background(Color.white)
                .cornerRadius(20)
                .frame(width: 400, height: 540, alignment: .center)
                .padding(.top, 25)
                if !autoplay{
                    HStack{
                        
                        Text("照片年份"+String(Int(slider)))
                            .bold()
                            .foregroundColor(.white)
                        Slider(value:$slider, in:2003...2021,  step: 0.5)
                            .accentColor(.orange)
                            .onChange(of: slider, perform: { value in
                              
                                
                                if slider <= 2003 {
                                    photo = (Int(slider) - 2003) + 3
                                }else{
                                    photo = (Int(slider) - 2003) + 3
                                }
                            })
                            .padding(.vertical, 25)
                            .frame(width: 260, height: 40, alignment: .center)
                            .padding(.leading,10)
                            .padding(.trailing,10)
                            .background(Color.white)
                            .cornerRadius(20)
                            
                        
                    }.padding(.top,20)
                    .padding(.leading,10)
                    .padding(.trailing,10)
                }
             
                
            }
        }
    }
}
extension AVPlayer {
    static var bgQueuePlayer = AVQueuePlayer()

    static var bgPlayerLooper: AVPlayerLooper!

    static func setupBgMusic() {
    guard let url = Bundle.main.url(forResource: "music", withExtension:
    "mp3") else { fatalError("Failed to find sound file.") }
    let item = AVPlayerItem(url: url)
    bgPlayerLooper = AVPlayerLooper(player: bgQueuePlayer, templateItem: item)
    }

static let sharedSpinPlayer: AVPlayer = {
    guard let url = Bundle.main.url(forResource: "music", withExtension:
"mp3") else { fatalError("Failed to find sound file.") }
return AVPlayer(url: url)
}()

func playFromStart() {
    seek(to: .zero)
    play()
    }
}

func playFromStart() {
    //seek(to: .zero)
    pause()
    }


struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(sceondView: .constant(true))
    }
}
