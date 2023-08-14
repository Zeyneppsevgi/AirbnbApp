//
//  CustomTabbar.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 2.08.2023.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI
import Firebase

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
            Color.white
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
        @State private var showAlert = false
        
        func deleteAccount() {
                let user = Auth.auth().currentUser
                
                user?.delete { error in
                    if let error = error {
                        print("Error deleting account:", error.localizedDescription)
                    } else {
                        print("Account deleted successfully.")
                        loginManager.isLogin = false
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
       
        
        var body: some View {
            NavigationView {
                ZStack{
                    Image("image") 
                                        .resizable()
                                        .scaledToFill()
                                        .edgesIgnoringSafeArea(.all)
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
    //                        Spacer(minLength: 100)
    //                            .padding()
                            
                            Text("Kullanıcı adı: ")
                                .font(.system(size: 18, weight: .light))
                            Text("Kullanıcı soyadı: ")
                                .font(.system(size: 18, weight: .light))
                            Text("Email: ")
                                .font(.system(size: 18, weight: .light))
                            
                            Button(action: {
                                
                            }) {
                                Text("Şifreyi Değiştir")
                                    .font(.system(size: 18, weight: .light))
                                    .foregroundColor(.black)
                            }
                        
                            Spacer(minLength: 80)
                            
                          
                        }
                        Button {
                            loginManager.isLogin = false
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Çıkış Yap")
                                .multilineTextAlignment(.center)
                                .padding(.all, 15.0)
                            //.padding(.all)
                                .foregroundColor(.white)
                                .background(Color.pink)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            
                            showAlert = true
                        }) {
                            Text("Hesabımı Sil")
                                .multilineTextAlignment(.center)
                                .padding([.top, .leading, .trailing], 35.0)
                                .foregroundColor(.gray)
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Hesabınızı Silmek İstiyor Musunuz?"),
                                message: Text("Bu işlem geri alınamaz."),
                                primaryButton: .destructive(Text("Sil")) {
                                    deleteAccount() // Hesabı silme fonksiyonunu çağır
                                },
                                secondaryButton: .cancel(Text("Geri"))
                            )
                        }
                        Button {
                            
                        } label: {
                            Text("Bize geri bildirimde bulunun")
                                .multilineTextAlignment(.leading)
                                .lineLimit(nil)
                                .padding(.leading, -15.0)
                                .padding(.all)
                                .foregroundColor(.gray)
                        }
                        
                      
                }
                
                }
               

            }
        }
        
        struct CustomTabbar_Previews: PreviewProvider {
            static var previews: some View {
                CustomTabbar()
                
            }
        }
    }

