//
//  TheardOnboardingView.swift
//  Interesnoitochka
//
//  Created by Алеся Афанасенкова on 12.02.2026.
//

import SwiftUI

struct ThirdOnboardingView: View {
    var body: some View {
        ZStack(alignment: .center){
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image("WaveBig")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 10)
                        .padding(.leading, 73)
                    Spacer()
                }
                Spacer()
            }
            
            Image("Picture3")
                .resizable()
                .scaledToFit()
                .frame(width: 291, height: 260)
            
            VStack {
                Spacer()
                HStack {
                    Image("Wave3")
                    Spacer()
                    Image("Star3")
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 406)
    }
}

#Preview {
    ThirdOnboardingView()
}
