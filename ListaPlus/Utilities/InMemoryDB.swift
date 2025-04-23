//
//  InMemoryDB.swift
//  ListaPlus
//
//  Created by Murilo Castilho on 08/04/25.
//

import Foundation

final class InMemoryDB {
	static let shared = InMemoryDB()
	
	private init() {}
	
	private(set) var listTable: [ListModel] = []
	private(set) var listItemTable: [ListItemModel] = []

//	//MARK - ListModel CRUD
//	func addList(_ list: ListModel) {
//		listTable.append(list)
//	}
//	
//	func getLists() -> [ListModel] {
//		return listTable
//	}
//	
//	func updateList(_ list: ListModel) {
//		guard let index = listTable.firstIndex(where: { $0.id == list.id }) else { return }
//		
//		listTable[index] = list
//	}
//	
//	func deleteList(id: UUID) {
//		listTable.removeAll { $0.id == id }
//		listItemTable.removeAll { $0.listId == id }
//	}
//	
//	//MARK - ListItemModel CRUD
//	
//	func addListItem(_ listItem: ListItemModel) {
//		listItemTable.append(listItem)
//	}
//	
//	func getListItemsByListId(listId: UUID) -> [ListItemModel] {
//		return listItemTable.filter { $0.listId.uuidString == listId.uuidString }
//	}
//	
//	func updateListItem(_ listItem: ListItemModel) {
//		guard let index = listItemTable.firstIndex(where: { $0.id == listItem.id }) else { return }
//		
//		listItemTable[index] = listItem
//	}
//	
//	func deleteListItem(id: UUID) {
//		listItemTable.removeAll { $0.listId == id }
//	}
}
