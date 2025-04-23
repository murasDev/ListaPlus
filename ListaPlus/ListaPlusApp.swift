//
//  ListaPlusApp.swift
//  ListaPlus
//
//  Created by Murilo Castilho on 08/04/25.
//

import SwiftUI
import SwiftData

@main
struct ListaPlusApp: App {
	var body: some Scene {
		WindowGroup {
			NavigationStack {
				ContentView()
			}
			.modelContainer(for: [ListModel.self, ListItemModel.self])
		}
	}
}
