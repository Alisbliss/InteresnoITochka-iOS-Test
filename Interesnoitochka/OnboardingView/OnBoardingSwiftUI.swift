//
//  OnBoardingSwiftUI.swift
//  Interesnoitochka
//
//  Created by Алеся Афанасенкова on 12.02.2026.
//

import SwiftUI

struct OnBoardingSwiftUI: View {
    @State private var activeStep: Int = 0
    let totalSteps = 4
    
    let onboardingData = [
        OnboardingStep(title: "Смотрите ваших блогеров", subtitle: "Тут какое-то описание в пару строчек как классно можно делать что-то"),
        OnboardingStep(title: "Общайтесь с друзьями", subtitle: "Тут какое-то описание в пару строчек как классно можно делать что-то"),
        OnboardingStep(title: "Делайте покупки в маркете", subtitle: "Тут какое-то описание в пару строчек как классно можно делать что-то"),
        OnboardingStep(title: "Участвуйте в акциях", subtitle: "Тут какое-то описание в пару строчек как классно можно делать что-то")
    ]
    
    var onFinish: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Group {
                switch activeStep {
                case 0: FirstOnboardingView()
                case 1: SecondOnboardingView()
                case 2: ThirdOnboardingView()
                case 3: ForthOnboardingView()
                default: EmptyView()
                }
            }
            .padding(.top, 104)
            .animation(.easeInOut, value: activeStep)
            
            HStack(spacing: 8) {
                ForEach(0..<totalSteps, id: \.self) { index in
                    Capsule()
                        .fill(activeStep == index ? Color.gray : Color.gray.opacity(0.3))
                        .frame(width: 16, height: 4)
                        .animation(.easeInOut, value: activeStep)
                }
            }
            
            VStack(spacing: 8) {
                Text(onboardingData[activeStep].title)
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .frame(height: 36)
                
                Text(onboardingData[activeStep].subtitle)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(Color(.systemGray3))
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal, 50)
            .frame(height: 84)
            
            VStack(spacing: 8) {
                Button {
                    activeStep += 1
                    if activeStep == 4 {
                        activeStep = 0
                    }
                } label: {
                    Text("Далее")
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 8))
                .controlSize(.large)
                .opacity(activeStep == 3 ? 0 : 1)
                
                Button {
                    onFinish()
                } label: {
                    Text(activeStep == 3 ? "Зарегистрироваться" : "Пропустить")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
                .background(
                    activeStep == 3 ? Color.blue : Color(hex: "#54555B")
                )
                .cornerRadius(8)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .disabled(!(activeStep == 3))
            }
            .padding(16)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct OnboardingStep {
    let title: String
    let subtitle: String
}

#Preview {
    OnBoardingSwiftUI() {
        print("hfgh")
    }
}
