//
//  ForthOnboardingView.swift
//  Interesnoitochka
//
//  Created by Алеся Афанасенкова on 12.02.2026.
//

import SwiftUI

struct ForthOnboardingView: View {
    var body: some View {
        ZStack {
            Image("Picture4")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 42)
            
            VStack {
                HStack{
                    Image("Star4")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Image("Star4Big")
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 406)
    }
}

#Preview {
    ForthOnboardingView()
}
