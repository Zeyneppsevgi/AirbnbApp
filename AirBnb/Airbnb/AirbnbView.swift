//
//  ContentView.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 31.07.2023.
// 

import SwiftUI

struct AirbnbView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                Color(.init(white: 0.95, alpha: 1))
                    .offset(y:200)
                ScrollView {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                        Spacer()
                    }.font(.system(size: 14,weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.3)))
                        .cornerRadius(15)
                        .padding(8)
                    AirbnbCategoriesView()
                    VStack {
                        PopularPlaceView()
                        
                    }.background(Color.white)
                        .cornerRadius(20)
                        .padding(.top, 80)
                    
                }
            }
            .navigationTitle("Airbnb")
            
        }
        
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AirbnbView()
    }
}





