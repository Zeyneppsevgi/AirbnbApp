//
//  CustomTabbar.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 2.08.2023.
//

import SwiftUI

struct CustomTabbar: View {
    
    @State private var selection: String = "home"
    
    var body: some View {
        TabView(selection: $selection) {
            //ContentView()
            AirbnbView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Keşfedin")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoriler")
                }
            FirstPage()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profil")
                }
        }

        }
    }
struct FirstPage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    Image(systemName: "person.circle")
                        .foregroundColor(.pink)
                        .font(.system(size: 64))
                        .padding(.all)
                        .foregroundColor(Color(.label))
                    
                    Text("Profil Bilgisi")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Ad: ")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("Soyad: ")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("E-posta: ")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 20)
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Çıkış Yap")
                            .padding()
                            .padding(.horizontal, 20)
                            .foregroundColor(.white)
                            .background(Color.pink)
                            .cornerRadius(10)
                        
                    }
                }}
            
        }
    }
    
    
    struct CustomTabbar_Previews: PreviewProvider {
        static var previews: some View {
            CustomTabbar()
            
        }
    }
}
