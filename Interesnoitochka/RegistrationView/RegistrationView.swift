//
//  RegistrationView.swift
//  Interesnoitochka
//
//  Created by Алеся Афанасенкова on 13.02.2026.
//

import SwiftUI

struct RegistrationView: View {
    var onFinish: () -> Void
    var body: some View {
        VStack {
            HelpView()
                .padding(.top, 150)
                .padding(.bottom, 30)
            Spacer()
            
            VStack(spacing: 8) {
                Text(
                    "Вход в учетную запись")
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundStyle(.white)
                .frame(height: 36)
                
                Text("Вход в приложение осуществляется через аккаунт Telegram")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(Color(.systemGray3))
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal, 50)
            .frame(height: 84)
            .padding(.bottom, 30)
            
            VStack(spacing: 8) {
                Button {
                    onFinish()
                } label: {
                    Text("Войти в приложение")
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 8))
                .controlSize(.large)
                
                Button {
                    onFinish()
                } label: {
                    Text( "Зарегистрироваться")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
                .background(Color(hex: "#54555B")
                )
                .cornerRadius(8)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .disabled(true)
            }
            .padding(16)
            
            Text("При входе или регистрации вы соглашаетесь с нашей Политикой использования")
                .font(.system(size: 12, weight: .regular))
                .frame(height: 56)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
                .foregroundStyle(Color(.systemGray3))
            
            Color.clear
                .frame(height: 34)
        }
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

#Preview {
    RegistrationView{ }
}
