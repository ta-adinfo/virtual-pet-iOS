//
//  ContentView.swift
//  iPet
//
//  Created by emanuel primavera on 29/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var AudioPlayer = AudioPlayer_()
    /// con () chiamo l'init della classe AudioPlayer_
    var body: some View {
        GameView()
            .environmentObject(AudioPlayer)
    }
}

#Preview {
    ContentView()
}
