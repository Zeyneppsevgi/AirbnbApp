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
            
            Color.black
                .tabItem {
                    Image(systemName: "car.2")
                    Text("Seyahatler")
                }
            Color.pink
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profil")
                }
        }

        }
    }


struct CustomTabbar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabbar()
    }
}
