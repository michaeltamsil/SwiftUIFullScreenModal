//
//  ContentView.swift
//  SwiftUIFullScreenModal
//
//  Created by michael tamsil on 23/09/20.
//  Copyright © 2020 michael tamsil. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isFullScreen = false
    @State private var isNotFullScreen = false
    
    var body: some View {
        HStack {
            Text("Hello, Not full screen!")
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .onTapGesture {
                self.isNotFullScreen.toggle()
            }
            .sheet(isPresented: $isNotFullScreen){
                NotFullScreen(isNotFullScreen: self.$isNotFullScreen)
            }
            
            Text("Hello, full screen!")
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .fullScreenCover(item: $isFullScreen){
                FullScreen(isFullScreen: $isFullScreen)
            }
            .onTapGesture {
                self.isFullScreen.toggle()
            }
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: - New .swift file.
struct NotFullScreen: View {
    @Binding var isNotFullScreen: Bool
    
    var body: some View {
        Text("This is not full screen.")
            .onTapGesture {
                self.isNotFullScreen.toggle()
        }
    }
}

//MARK: - New .swift file.
struct FullScreen: View {
    @Binding var isFullScreen: Bool
    
    var body: some View {
        Text("This is full screen!!")
            .onTapGesture {
                self.isFullScreen.toggle()
            }
    }
}
