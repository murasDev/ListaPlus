//
//  AddItemFormSheeViewModel.swift
//  ListaPlus
//
//  Created by Murilo Castilho on 22/04/25.
//

import Foundation
import SwiftData

class AddItemFormSheetViewModel: ObservableObject {
	@Published var addItemName = ""
	@Published var addItemQuantity = ""
	@Published var addItemValue = ""
	@Published var addItemCategory: ListItemModel.CategoryType = ListItemModel.CategoryType.others
	@Published var addItemQuantityType: ListItemModel.QuantityType = ListItemModel.QuantityType.unity
	
	func addItemToList(to parentList: ListModel, context: ModelContext) {
		let quantityType = addItemQuantityType
		let category = addItemCategory
		
		let newItem = ListItemModel(
			parentList: parentList,
			name: addItemName,
			quantity: Double(addItemQuantity)!,
			quantityType: quantityType,
			category: category,
			value: Double(addItemValue) ?? nil,
		)
		
		context.insert(newItem)
		
		do {
			try context.save()
			print("saved successfully!!!")
		} catch let error {
			print("Error saving item: \(newItem.name) // \(error)")
		}
	}
	
	func clearFields() {
		addItemName = ""
		addItemQuantity = ""
		addItemValue = ""
		addItemCategory = ListItemModel.CategoryType.others
		addItemQuantityType = ListItemModel.QuantityType.unity
	}
	
	func fillEditingFields(editingItem: ListItemModel) {
		addItemName = editingItem.name
		addItemValue = editingItem.value != nil ? String(editingItem.value ?? 0) : ""
		addItemCategory = ListItemModel.CategoryType(rawValue: editingItem.category) ?? ListItemModel.CategoryType.others
		addItemQuantity = String(editingItem.quantity)
		addItemQuantityType = ListItemModel.QuantityType(rawValue: editingItem.quantityType) ?? ListItemModel.QuantityType.unity
	}
}
