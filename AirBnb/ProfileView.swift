//
//  ProfileView.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 8.08.2023.
//

import SwiftUI

struct ProfileView: View {

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.blue)
                    .frame(width: 100, height: 100)
                
                VStack (alignment: .leading) {
                    HStack {
                        Text("Name: ")
                        Text("Zeynep Sevgi")
                    }
                    HStack {
                        Text("Email: ")
                        Text("Zeynep Sevgi")
                    }
                    
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
