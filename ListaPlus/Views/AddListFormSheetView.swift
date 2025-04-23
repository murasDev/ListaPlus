//
//  AddListFormSheetView.swift
//  ListaPlus
//
//  Created by Murilo Castilho on 09/04/25.
//

import SwiftUI

struct AddListFormSheetView: View {
	@StateObject var viewModel = AddListFormSheetViewModel()
	@Binding var isSheetPresented: Bool
	@Environment(\.modelContext) var modelContext
	
	var body: some View {
		NavigationView {
			VStack(alignment: .leading) {
				Form {
					TextField(text: $viewModel.addListNameInput) {
						Text("Nome da lista")
					}
					
					TextField(text: $viewModel.addListDescriptionInput) {
						Text("Descrição da lista")
					}
					
				}
			}
			.navigationBarTitleDisplayMode(.inline)
			.navigationTitle("Criar lista")
			.toolbarBackground(.visible, for: .navigationBar)
			.toolbar {
				toolbarItems
			}
		}
	}
}

extension AddListFormSheetView {
	private var toolbarItems: ToolbarItem<(), some View> {
		ToolbarItem(placement: .confirmationAction) {
			Button(action: {
				withAnimation {
					viewModel.addList(context: modelContext)
					
					viewModel.clearFields()
					
					isSheetPresented = false
				}
			}) {
				Text("Criar")
			}
			.disabled(viewModel.addListNameInput.isEmpty)
		}
	}
}

#Preview {
	AddListFormSheetView(isSheetPresented: .constant(true))
}
