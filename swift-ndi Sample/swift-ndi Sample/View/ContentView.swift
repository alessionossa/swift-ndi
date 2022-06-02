//
//  ContentView.swift
//  swift-ndi Sample
//
//  Created by Alessio Nossa on 02/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var model = ContentViewModel()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
