import SwiftUI

struct ItemListRow: View {
	var item: ListItemModel
	var toggleIsChecked: () -> Void
	
	var body: some View {
		HStack {
			CheckboxComponent(isChecked: item.isChecked)
				.onTapGesture {
					withAnimation() {
						toggleIsChecked()
					}
				}
			HStack {
				VStack(alignment: .leading) {
					Text(item.name)
					Text(String(format: "%.2f", item.quantity) + " \(item.quantityType)")
				}
				
				Spacer()
				
				if let value = item.value {
					Text("R$" + String(format: "%.2f", value) + "/\(item.quantityType)")
				}
			}
			
			.opacity(item.isChecked ? 0.5 : 1.0)
		}
	}
}

#Preview {
	//	var vm = ItemsListViewModel()
	//var item = ListItemModel(name: "Carne", quantity: 4.5, quantityType: .kilo, listId: UUID(), category: .butcher, value: 90, )
	//
	//	ItemListRow(item: item)
	//		.swipeActions {
	//			Button("Delete", role: .destructive) {
	//
	//			}
	//		}
	
	//	NavigationView {
	//		List {
	//			ForEach(vm.sortedItems, id: \.key) { category, items in
	//				Section(header: Text(category.description.capitalized())) {
	//					ForEach(items) { item in
	//
	//					}
	//				}
	//			}
	//		}
	//		.listStyle(.plain)
	//		.navigationTitle("Items")
	//	}
}
