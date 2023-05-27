//
//  CreateSeedPageViewModel.swift
//  ForestProject Watch App
//
//  Created by Noura Alowayid on 07/11/1444 AH.
//

import Foundation
import SwiftUI

extension CreateSeedPage{
    class CreateSeedPageViewModel: ObservableObject{
        @State private var timer: Timer?
        @State private var progress = 0.2
        //@EnvironmentObject var count: Count
        @State var count = 0
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
        func progressBar(){
            ProgressView(value: progress, total: 1.0)
                .progressViewStyle(GaugeProgressStyle())
                .frame(width: 90, height: 90)
                .contentShape(Rectangle())
                .onTapGesture {
                    if self.progress < 1.0 {
                        withAnimation {
                            self.progress += 0.2
                            self.count = self.count + 10
                        }
                    }
                    
                }
        }
        
        class Count: ObservableObject {
            @Published var count = 0
            
            init() {
                count = 0
            }
        }
    }
}
