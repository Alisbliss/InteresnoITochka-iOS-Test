//
//  SecondOnboardingView.swift
//  Interesnoitochka
//
//  Created by Алеся Афанасенкова on 12.02.2026.
//

import SwiftUI

struct SecondOnboardingView: View {
    var body: some View {
        ZStack {
            Image("Stroke")
                .resizable()
                .scaledToFill()
                .offset(y: 75)
            
            Image("Picture2")
                .resizable()
                .scaledToFit()
                .padding(.top, 73)
                .padding(.horizontal, 42)
            
            VStack {
                HStack {
                    Image("HeartBig")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 84)
                        .padding(.leading, 11)
                        .offset(y: 28)
                    Spacer()
                    
                    ZStack {
                        Image("Speach1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 146)
                            .padding(.top, 11)
                            .padding()
                            .padding(.trailing, -11)
                        
                        Image("Speach2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 88.31)
                    }
                }
                
                HStack {
                    Image("HeartLittle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 38)
                        .padding(.leading, 15)
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 406)
    }
}

#Preview {
    SecondOnboardingView()
}
