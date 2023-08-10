//
//  SplashView.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 10.08.2023.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        if self.isActive {
            ProfilePageView()
        } else {
            Image("airbnb_screen")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(
                    Circle()
                )
                .frame(width: 512, height: 512)
            
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {

                       withAnimation {
                           self.isActive = true
                       }
               }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
