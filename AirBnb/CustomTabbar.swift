//
//  CustomTabbar.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 2.08.2023.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI

struct CustomTabbar: View {
    @State private var selection: String = "home"
    @State private var userEmail : String = ""
    @State private var isFavorite = [Bool]()
    @State private var imageURLs = [URL]()
   
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
        @ObservedObject var loginManager = LoginManager()
        
        
        var body: some View {
            
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Spacer()
                        Image(systemName: "person.circle")
                            .foregroundColor(.pink)
                            .font(.system(size: 64))
                            .padding(.horizontal, 80.0)
                            .foregroundColor(Color(.label))
                        
                        Text("Profil Ayarları")
                            .font(.title)
                            .fontWeight(.bold)
                        
                       
                        
                        Spacer(minLength: 100)
                            .padding()
                        Button {
                            loginManager.isLogin = false
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Çıkış Yap")
                                .multilineTextAlignment(.center)
                                .padding(.all, 20.0)
                            //.padding(.all)
                                .foregroundColor(.white)
                                .background(Color.pink)
                                .cornerRadius(10)
                            
                        }
                        Button {
                            // Geri bildirim gönderme işlemi burada gerçekleştirilebilir
                        } label: {
                            Text("Bize geri bildirimde bulunun")
                                .multilineTextAlignment(.leading)
                                .lineLimit(nil)
                                .padding(.leading, -15.0)
                                .padding(.all)
                                .foregroundColor(.gray)
                            
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

