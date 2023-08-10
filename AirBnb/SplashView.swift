//
//  SplashView.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 10.08.2023.
//

import SwiftUI
import Combine

struct SplashView: View {
    @ObservedObject var loginManager = LoginManager()
    @State private var isSplashFinished: Bool = false
    
    var body: some View {
        if self.isSplashFinished && !loginManager.isLogin {
            ProfilePageView()
        } else if self.isSplashFinished && loginManager.isLogin {
            CustomTabbar()
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
                           self.isSplashFinished = true
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
