//
//  ProfilePageView.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 9.08.2023.
//

import SwiftUI
import Firebase


class FirebaseManager: NSObject {
    let auth: Auth
    
    static let shared = FirebaseManager()
    override init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()

        super.init()
    }
}

struct ProfilePageView: View {
    @State private var isloginMode = false
    @State private var email = ""
    @State private var password = ""
    @State private var image: UIImage?
    @State private var isLoggedSuccessfully = false
    @State private var loginStatusMessage = ""
    @State private var shouldShowImagePicker = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack (spacing: 20){
                    
                    Picker(selection: $isloginMode, label:
                    Text("Picker here")) {
                        Text("Login🔒 ")
                            .tag(true)
                        Text("Create Account✍🏻")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding()
                    
                    if !isloginMode {
                        Button {
                            shouldShowImagePicker.toggle()
                        } label: {
                            
                            VStack {
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 128, height: 128)
                                        .cornerRadius(64)
                                } else {
                                    Image(systemName: "person.fill")
                                        .foregroundColor(.pink)
                                        .font(.system(size: 64))
                                        .padding()
                                        .foregroundColor(Color(.label))
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 64)
                                .stroke(Color.pink, lineWidth:3)
                            )
                        }
                    }
                    
                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)

                        
                        SecureField("Password", text: $password)
                          
                    }  .padding(12)
                        .background(Color.white)
                
                    Button {
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isloginMode ? "Log In" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                            Spacer()
                        }.background(Color.pink)
                    }
                    Text(self.loginStatusMessage)
                        .foregroundColor(.red)
                    
                }.padding()
                 .fullScreenCover(isPresented: $isLoggedSuccessfully) {
                                CustomTabbar()
                            }
               // NavigationLink(destination: CustomTabbar(), isActive: $isLoggedSuccessfully, label: { EmptyView() })

            }
            .navigationTitle(isloginMode ? "Log in" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05))
            .ignoresSafeArea())
            .font(.system(size: 14, weight: .semibold))
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
    
    private func handleAction() {
        if isloginMode {
            //print("aaaaa")
            loginUser()
        } else {
            CreateNewAccount()
           //print("bbb")
        }
    }
    
    private func loginUser() {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) {
            result, err in
            if let err = err {
                print("Failed to login user:" ,err)
                self.loginStatusMessage = " Failed to login user: \(err)"
                return
            }
            
            print("Successfully logged in as user: \(result!.user.uid)")
            self.isLoggedSuccessfully = true
            self.loginStatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
        }
    }
    
    
  
    private func  CreateNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) {
            result, err in
            if let err = err {
                print("Failed to create user:" ,err)
                self.loginStatusMessage = " Failed to create user: \(err)"
                return
            }
            
            print("Successfully created user: \(result!.user.uid)")
                
            
            self.loginStatusMessage = "Successfuly created user: \(result?.user.uid ?? "")"
            self.isloginMode = true
          
        }
    }
   
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
