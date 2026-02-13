//
//  HelpView.swift
//  Interesnoitochka
//
//  Created by Алеся Афанасенкова on 13.02.2026.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        ZStack{
            Image("StarRegistration")
                .resizable()
                .scaledToFit()
                .frame(width: 268, height: 277)
                .offset(x: 25, y: -15)
            
            Image("FlawerRegistration")
                .resizable()
                .scaledToFit()
                .frame(width: 68.28, height: 64.33)
                .offset(x: -55, y: -90)
            
            Image("Palm")
                .resizable()
                .scaledToFit()
                .frame(width: 60.89, height: 76.25)
                .offset(x: 50, y: -15)
            
            Image("SpeachBoth")
                .resizable()
                .scaledToFit()
                .offset(x: 15, y: -20)
                .frame(width: 82, height: 61.5)
                .offset(x: -115, y: 75)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 322)
    }
}

#Preview {
    HelpView()
}
