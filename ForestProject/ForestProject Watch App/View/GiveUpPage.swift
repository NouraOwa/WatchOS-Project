//
//  GiveUpPage.swift
//  ForestProject Watch App
//
//  Created by Noura Alowayid on 06/11/1444 AH.
//

import SwiftUI

struct GiveUpPage: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    Color("greeen2")
                        .ignoresSafeArea()
                    VStack{
                        Text("There will be 1 withered tree(s) in your forest :(")
                            .font(.footnote)
                            .foregroundColor(Color("yell"))
                        
                        Image("giveup")
                            .resizable()
                            .frame(width: 70, height: 70)
                        
                        NavigationLink(destination: StartPage()) {
                            Text("Give Up")
                                .frame(maxWidth: 100)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color.red)
                        .cornerRadius(30)
                        
                        NavigationLink(destination: TimerPage()) {
                            Text("Cancel")
                                .frame(maxWidth: 100)
                        }
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(30)
                    }.padding()
                }
            }
        }
    }
}
struct GiveUpPage_Previews: PreviewProvider {
    static var previews: some View {
        GiveUpPage()
    }
}
