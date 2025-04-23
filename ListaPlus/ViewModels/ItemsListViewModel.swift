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
	
	
	func deleteItem(item: ListItemModel, context: ModelContext) {
		context.delete(item)
	}
}
