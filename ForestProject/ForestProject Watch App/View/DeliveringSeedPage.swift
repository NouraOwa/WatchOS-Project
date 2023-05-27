//
//  DeliveringSeedPage.swift
//  ForestProject Watch App
//
//  Created by Noura Alowayid on 06/11/1444 AH.
//

import SwiftUI

struct DeliveringSeedPage: View {
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text("Delivering Seed...")
                        .bold()
                    
                    Image("load")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding(.trailing,20)
                }
                NavigationLink(destination: TimerPage()) {
                    Text("SKIP")
                        .padding(.leading, 120)
                        .font(.caption)
                }.buttonStyle(.borderless)
            }
        }
    }
}
    struct DeliveringSeedPage_Previews: PreviewProvider {
        static var previews: some View {
            DeliveringSeedPage()
        }
    }
    
