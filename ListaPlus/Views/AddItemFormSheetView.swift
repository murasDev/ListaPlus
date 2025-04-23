//
//  AddItemFormSheetView.swift
//  ListaPlus
//
//  Created by Murilo Castilho on 22/04/25.
//

import SwiftUI

struct AddItemFormSheetView: View {
	@StateObject var viewModel = AddItemFormSheetViewModel()
	@Environment(\.modelContext) var modelContext
	@Environment(\.dismiss) var dismiss
	var editingItem: ListItemModel?
	var selectedList: ListModel
	
	var navigationTitle: String {
		editingItem != nil ? "Editar item" : "Adicionar um item a lista"
	}
	
	var saveButtonTitle: String {
		editingItem != nil ? "Salvar" : "Criar"
	}
	
	var body: some View {
		NavigationStack {
			Form {
				TextField("Nome do item", text: $viewModel.addItemName)
				TextField("Quantidade", text: $viewModel.addItemQuantity)
					.keyboardType(.numberPad)
				Picker("Selecione um tipo de quantidade", selection: $viewModel.addItemQuantityType) {
					ForEach(ListItemModel.QuantityType.allCases, id: \.self) { item in
						Text(item.rawValue)
					}
				}.pickerStyle(.palette)
				
				Picker("Selecione uma categoria", selection: $viewModel.addItemCategory) {
					ForEach(ListItemModel.CategoryType.allCases, id: \.self) { item in
						Text(item.rawValue)
					}
				}
				TextField("Valor (Opcional)", text: $viewModel.addItemValue)
					.keyboardType(.numberPad)
			}
			.toolbarBackgroundVisibility(.visible, for: .navigationBar)
			.navigationTitle(navigationTitle)
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				toolbar
			}
			.onAppear {
				if let editingItem {
					viewModel.fillEditingFields(editingItem: editingItem)
				}
			}
		}
	}
}

extension AddItemFormSheetView {
	private var toolbar: some ToolbarContent {
		Group {
			ToolbarItem(placement: .confirmationAction) {
				Button {
					viewModel.addItemToList(to: selectedList, context: modelContext)
					
					viewModel.clearFields()
					
					dismiss()
				} label: {
					Text(saveButtonTitle)
				}
			}
			
			ToolbarItem(placement: .cancellationAction) {
				Button {
					dismiss()
				} label: {
					Text("Cancelar")
				}
			}
		}
	}
}

#Preview {
	AddItemFormSheetView(selectedList: ListModel(name: "ALOALOA", description: "ALOALO"))
}
