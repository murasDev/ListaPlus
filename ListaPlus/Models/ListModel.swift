import Foundation
import SwiftData

@Model
class ListModel: Identifiable {
	var id: UUID
	var name: String
	var listDescription: String
	@Relationship(deleteRule: .cascade, inverse: \ListItemModel.parentList) var listItems: [ListItemModel]? = []
	
	init(id: UUID = UUID(), name: String, description: String) {
		self.id = id
		self.name = name
		self.listDescription = description
	}
}
