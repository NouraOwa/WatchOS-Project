//
//  TimerPage.swift
//  ForestProject Watch App
//
//  Created by Noura Alowayid on 06/11/1444 AH.
//

import SwiftUI

struct TimerPage: View {
    @State private var timer: Timer?
    @State var count = 40

    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text("You're Blooming!")
                        .bold()
                   
                        Image("bloom")
                            .resizable()
                            .frame(width: 120, height: 120)
                   

                    Button {

                        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {time in
                            if count > 0 {
                                count -= 1
                            }else {
                              timer?.invalidate()
                            }
                        }
                    }label: {
                        Text("\(count)")
                            .font(.system(size:30))
                    }
                    .buttonStyle(.borderless)

                    NavigationLink(destination: GiveUpPage()) {
                        Text("Give Up")
                            .frame(maxWidth: 100)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("greeen"))
                    .cornerRadius(30)
                    
                }
            }
        }
    }
}

struct TimerPage_Previews: PreviewProvider {
    static var previews: some View {
        TimerPage()
    }
}
