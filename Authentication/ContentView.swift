//
//  ContentView.swift
//  Authentication
//
//  Created by Milan Chalishajarwala on 5/2/20.
//  Copyright © 2020 Milan Chalishajarwala. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    func getUser(){
        session.listen()
    }
    
    var body: some View {
        Group{
            if(session.session != nil){
                Text("Welcome Back User!")
                Button(action: session.signOut){
                    Text("Sign Out")
                }
            }else{
               AuthView()
            }
        }.onAppear(perform:getUser)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
