//
//  HomeViewModel.swift
//  ListaPlus
//
//  Created by Murilo Castilho on 08/04/25.
//

import Foundation
import SwiftData

class HomeViewModel: ObservableObject {
	@Published var searchText = ""
	@Published var lists: [ListModel] = []
	@Published var loading = false
	@Published var isSheetPresented = false
	
	func deleteList(modelContext context: ModelContext, list: ListModel) {
		context.delete(list)
	}
	
	func handleGetLists() {
		loading = true
		Task {
			try? await Task.sleep(for: .seconds(1.5))
			
			await MainActor.run {
//				self.lists = InMemoryDB.shared.getLists()
				self.loading = false
			}
		}
		
	}
}
