//
//  CreateSeedPage.swift
//  ForestProject Watch App
//
//  Created by Noura Alowayid on 06/11/1444 AH.
//

import SwiftUI
struct GaugeProgressStyle: ProgressViewStyle {
    var strokeColor = Color("greeen")
    var strokeWidth = 9.0
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return ZStack {
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}

class Count: ObservableObject {
    @Published var count = 0
    
    init() {
        count = 0
    }
}
struct CreateSeedPage: View {
    @State private var timer: Timer?
    @State private var progress = 0.2
    //@EnvironmentObject var count: Count
    @State var count = 0
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text("Create Your Seed!")
                        .bold()
                    ZStack{
                        Image("seed")
                            .resizable()
                            .frame(width: 100, height: 100)
                        ProgressView(value: progress, total: 1.0)
                            .progressViewStyle(GaugeProgressStyle())
                            .frame(width: 90, height: 90)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if progress < 1.0 {
                                    withAnimation {
                                        progress += 0.2
                                        count = count + 10
                                    }
                                }
                                
                            }
                    }
                    
                    Text("\(count)")
                        .font(.system(size:40))
                    
                    VStack{
                        NavigationLink(destination: DeliveringSeedPage()) {
                            Text("Work")
                                .frame(maxWidth: 70)
                        }
                        .buttonStyle(.bordered)
                        .cornerRadius(30)
                        
                        NavigationLink(destination: DeliveringSeedPage()) {
                            Text("Create Seed")
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
}
struct CreateSeedPage_Previews: PreviewProvider {
    static var previews: some View {
        CreateSeedPage()
    }
}
