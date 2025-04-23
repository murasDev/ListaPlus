import Foundation

struct ListModel: Identifiable {
	let id = UUID()
	
	let name: String
	let description: String
	let items: [ListItemModel]
}

struct ListItemModel: Identifiable {
	let id = UUID()
	
	let name: String
	let quantity: Double
	let quantityType: QuantityType
	let value: Double?
	
	init(name: String, quantity: Double, quantityType: QuantityType, value: Double? = nil) {
		self.name = name
		self.quantity = quantity
		self.quantityType = quantityType
		self.value = value
	}
	
	enum QuantityType: String, CaseIterable, Identifiable {
		case unity = "unidade"
		case kilo = "kg"
		case portion = "porção"
		
		var id: String { rawValue }
	}
}
