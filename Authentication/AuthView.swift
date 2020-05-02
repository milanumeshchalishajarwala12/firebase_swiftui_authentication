//
//  AuthView.swift
//  Authentication
//
//  Created by Milan Chalishajarwala on 5/2/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI
struct SignInView: View{
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore

    
    func signIn(){
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error{
                self.error = error.localizedDescription
            }
            else{
                self.email = ""
                self.password = ""
            }
            
        }
    }

    var body: some View{
        VStack{
            Text("Welcome Back!")
                .font(.system(size: 18, weight: .heavy))
            Text("Sign In to Continue")
                .font(.system(size: 18, weight: . medium))
                .foregroundColor(.gray)
            
            VStack(spacing: 18){
                TextField("Email address", text: $email)
                    .font(.system(size: 14))
                .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray),
                                                                               lineWidth: 1))
                SecureField("Password", text: $password)
                    .font(.system(size: 14))
                .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray),
                                                                               lineWidth: 1))
            }
            .padding(.vertical, 64)
            Button(action: signIn){
                Text("Sign In")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(LinearGradient(gradient: Gradient(colors:[Color(.black), Color(.black)]), startPoint: .leading, endPoint: .trailing
                    ))
                .cornerRadius(5)
            }
            if(error != ""){
                Text(error)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.red)
                .padding()
                
            }
            Spacer()
            
            NavigationLink(destination: signUpView()){
                HStack{
                    Text("I'm a New User.")
                        .font(.system(size:14, weight: .light))
                        .foregroundColor(.primary)
                    
                    Text("Create an account")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(.horizontal, 32)
    }
}

struct signUpView: View{
    @State var email:  String = ""
    @State var password:  String = ""
   
    @State var error:  String = ""
    @EnvironmentObject var session: SessionStore
    
    func signUp(){
        session.signUp(email: email, password: password) {(result, error) in
            if let error = error {
                self.error = error.localizedDescription
            }else{
                self.email = ""
                self.password = ""
               
            }
        }
    }

    var body: some View{
        VStack{
        Text("Create Account")
            .font(.system(size: 32, weight: .heavy))
            
            Text("Sign up to get started")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.gray)
            
            VStack(spacing: 18){
                TextField("Email Address", text:$email)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray),
                                                                               lineWidth: 1))
               
                SecureField("Password", text:$password)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color(.gray),
                                                                               lineWidth: 1))
            }
            
        
        .padding(.vertical, 64)
        
        Button(action: signUp){
            Text("Create Account")
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(.white)
                .font(.system(size:14, weight: .bold))
               .background(LinearGradient(gradient: Gradient(colors:[Color(.black), Color(.black)]), startPoint: .leading, endPoint: .trailing
                ))
            .cornerRadius(5)
        }
            if(error != ""){
                Text(error)
                .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.red)
                .padding()
            }
            Spacer()
        }.padding(.horizontal, 32)
}
}


struct AuthView: View {
    var body: some View {
        NavigationView(){
            SignInView()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
