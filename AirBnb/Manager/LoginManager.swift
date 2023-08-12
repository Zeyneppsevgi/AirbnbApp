//
//  LoginManager.swift
//  AirBnb
//
//  Created by Zeynep Sevgi on 10.08.2023.
//

import Foundation
import Combine

class LoginManager: ObservableObject {
    @Published var userEmail = ""
    @Published var isLogin: Bool {
        didSet {
            UserDefaults.standard.set(isLogin, forKey: "isLogin")
        }
    }

    init() {
        self.isLogin = UserDefaults.standard.object(forKey: "isLogin") as? Bool ?? false
    }
}




