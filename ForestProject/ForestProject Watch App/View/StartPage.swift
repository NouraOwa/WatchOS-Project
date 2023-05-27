//
//  StartPage.swift
//  ForestProject Watch App
//
//  Created by Noura Alowayid on 06/11/1444 AH.
//

import SwiftUI

struct StartPage: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Start Planting!")
                    .bold()
                    .padding(.bottom,80)
                
                NavigationLink (destination: CreateSeedPage()) {
                    Image("forest")
                        .resizable()
                        .frame(width: 220, height: 150)
                        .padding(.bottom,50)
                }
                
                Text("0 mins")
                    .padding(.leading, 120)
                    .font(.caption)
            }
        }
    }
}
struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
