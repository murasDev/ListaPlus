import SwiftUI
import SwiftData

struct ItemsListView: View {
	let selectedList: ListModel
	@StateObject var viewModel = ItemsListViewModel()
	@Environment(\.modelContext) private var modelContext
	@Query var items: [ListItemModel]
	@Environment(\.dismiss) var dismiss
	
	init(selectedList: ListModel) {
		self.selectedList = selectedList
		
		let selectedID = selectedList.id
		
		//filter items by selectedList id (which is the parentList in ListItemModel)
		_items = Query(filter: #Predicate<ListItemModel> { $0.parentList.id == selectedID })
	}
	
	var groupedItemsByCategory: [String: [ListItemModel]] {
		Dictionary(grouping: items, by: \.category)
	}
	
	var searchGroupedItem: [String: [ListItemModel]] {
		if viewModel.searchText.isEmpty {
			return groupedItemsByCategory
		} else {
			//should have searchText string in key of each groupedItem or in name of each value
			return groupedItemsByCategory.filter { $0.key.localizedCaseInsensitiveContains(viewModel.searchText) }
		}
	}
	
	var progressViewPercentage: Double {
		let totalItems = items.count
		let checkedItems = items.filter({ $0.isChecked }).count
		
		let percentage = totalItems > 0 ? Double(checkedItems) / Double(totalItems) : 0.00
		
		return (Double(percentage) * 100).rounded() / 100
	}
	
	var body: some View {
		ZStack {
			VStack {
				if !items.isEmpty {
					ProgressView(value: progressViewPercentage) { Text("\(progressViewPercentage.formatted(.percent)) de itens no carrinho 🛒")
					}
					.padding()
					.transition(.scale)
				}
				
				sectionedList
			}
			.padding(.top, 10)
			
			if items.isEmpty {
				emptyListView
					.padding()
			}
		}
		.navigationTitle(selectedList.name)
		.searchable(text: $viewModel.searchText, prompt: "Digite o nome do item ou da categoria")
		.toolbar {
			ToolbarItem(placement: .topBarTrailing) {
				Image(systemName: "plus")
					.onTapGesture {
						viewModel.editingItem = nil
						viewModel.isPresented = true
					}
			}
		}
		.sheet(isPresented: $viewModel.isPresented) {
			AddItemFormSheetView(editingItem: viewModel.editingItem, selectedList: selectedList)
		}
	}
}

extension ItemsListView {
	private var sectionedList: some View {
		List {
			ForEach(searchGroupedItem.sorted(by: { $0.key < $1.key }), id: \.key) { key, items in
				Section(header: Text(key)) {
					ForEach(items) { item in
						ItemListRow(item: item, toggleIsChecked: {
							viewModel.toggleIsChecked(item: item)
						})
						.transition(.move(edge: .leading))
						.animation(.easeOut.delay(Double(index) * 0.05), value: searchGroupedItem)
						.swipeActions {
							DeleteActionButton {
								viewModel.deleteItem(item: item, context: modelContext)
							}
							Button("Edit", systemImage: "pencil.line") {
								viewModel.editingItem = item
								viewModel.isPresented = true
							}
						}
					}
				}
			}
		}
	}
	
	private var emptyListView: some View {
		VStack {
			Text("Nenhum item na lista ainda =(")
			Image(systemName: "list.bullet.rectangle")
				.resizable()
				.frame(width: 32, height: 28)
		}
		.font(.headline)
		.foregroundStyle(.placeholder)
		.padding()
	}
}

#Preview {
	NavigationStack {
		ItemsListView(selectedList: ListModel(name: "ALOALOA", description: "ALOALO"))
	}
}
