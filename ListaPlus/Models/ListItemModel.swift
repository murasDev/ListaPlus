import Foundation
import SwiftData

@Model
class ListItemModel: Identifiable {
	var id: UUID
	var parentList: ListModel
	var name: String
	var quantity: Double
	var quantityType: String
	var isChecked: Bool
	var category: String
	var value: Double?
	
	init(id: UUID = UUID(), parentList: ListModel, name: String, quantity: Double, quantityType: QuantityType, isChecked: Bool = false, category: CategoryType, value: Double? = nil) {
		self.name = name
		self.quantity = quantity
		self.quantityType = quantityType.rawValue
		self.isChecked = isChecked
		self.value = value
		self.category = category.rawValue
		self.parentList = parentList
		self.id = id
	}
	
	enum QuantityType: String, CaseIterable, Identifiable {
		case unity = "unidade"
		case kilo = "kg"
		case portion = "porção"
		
		var label: String {
			switch self {
			case .unity: return "Unidade"
			case .kilo: return "Quilo"
			case .portion: return "Porção"
			}
		}
		
		var id: String { rawValue }
	}
	
	enum CategoryType: String, CaseIterable, Identifiable {
		case butcher = "Açougue"
		case bakery = "Padaria"
		case produce = "Hortifruti"
		case dairy = "Laticínios"
		case beverages = "Bebidas"
		case frozen = "Congelados"
		case cleaning = "Produtos de Limpeza"
		case hygiene = "Higiene Pessoal"
		case grocery = "Mercearia"
		case pet = "Petshop"
		case pharmacy = "Farmácia"
		case household = "Utilidades Domésticas"
		case others = "Outros"
		
		var id: String { self.rawValue }
	}
}
