//
//  ItemsListViewModel.swift
//  ListaPlus
//
//  Created by Murilo Castilho on 09/04/25.
//

import Foundation
import SwiftData

class ItemsListViewModel: ObservableObject {
	@Published var isPresented = false
	@Published var editingItem: ListItemModel? = nil
	@Published var searchText = ""
	
	func toggleIsChecked(item: ListItemModel) {
		item.isChecked = !item.isChecked
	}
	
	func deleteItem(item: ListItemModel, context: ModelContext) {
		context.delete(item)
	}
}
