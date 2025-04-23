//
//  ContentView.swift
//  ListaPlus
//
//  Created by Murilo Castilho on 08/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
			HomeView()
				.navigationTitle("Listas")
    }
}

#Preview {
	NavigationView {
		ContentView()
	}
}
