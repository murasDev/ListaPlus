//
//  AddListFormSheetViewModel.swift
//  ListaPlus
//
//  Created by Murilo Castilho on 15/04/25.
//

import Foundation
import SwiftData

class AddListFormSheetViewModel: ObservableObject {
	@Published var isSheetPresented = false
	@Published var addListNameInput = ""
	@Published var addListDescriptionInput = ""
	
	func clearFields() {
		addListNameInput = ""
		addListDescriptionInput = ""
	}
	
	func addList(context: ModelContext) {
		let newList = ListModel(name: addListNameInput, description: addListDescriptionInput)
		context.insert(newList)
		
		do {
			try context.save()
			print("saved list successfully: \(newList)")
		} catch let error {
			print("Failed to save list: \(error)")
		}
	}
}
