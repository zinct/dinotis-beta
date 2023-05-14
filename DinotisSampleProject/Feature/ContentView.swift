
//
//  ContentView.swift
//  DinotisSampleProject
//
//  Created by Irham Naufal on 13/05/23.
//

import SwiftUI
import DinotisDesignSystem

struct ContentView: View {
    
    init() {
        FontInjector.registerFonts()
    }
    
    var body: some View {
        NavigationView {
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
