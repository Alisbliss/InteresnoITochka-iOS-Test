//
//  FirstOnboardingView.swift
//  Interesnoitochka
//
//  Created by Алеся Афанасенкова on 12.02.2026.
//

import SwiftUI

struct FirstOnboardingView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("Star1")
                .resizable()
                .scaledToFit()
                .frame(width: 268, height: 277)
                .padding(.top, 52)
                .padding(.bottom, 77)
                .padding(.leading, 150)
            
            Image("Earphones")
                .resizable()
                .scaledToFit()
                .frame(width: 152.65, height: 168.91)
                .padding(.top, 19)
                .padding(.leading, 75)
            
            Image("Flower")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 60)
                .padding(.top, 9)
                .padding(.leading, 170)
            
            Image("Speach")
                .resizable()
                .scaledToFit()
                .frame(width: 91.6, height: 29.98)
                .padding(.top, 215.74)
                .padding(.leading, 140)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 406)
    }
}

#Preview {
    FirstOnboardingView()
}
