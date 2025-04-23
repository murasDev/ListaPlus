//
//  HomeView.swift
//  ListaPlus
//
//  Created by Murilo Castilho on 08/04/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
	@StateObject var vm = HomeViewModel()
	@Environment(\.modelContext) private var context
	@Query var lists: [ListModel] = []
	
	var filteredList: [ListModel] {
		if vm.searchText.isEmpty {
			return lists
		} else {
			return lists.filter { $0.name.localizedCaseInsensitiveContains(vm.searchText) }
		}
	}
	
	var body: some View {
		let showEmptyListView = lists.isEmpty
		
		ZStack(alignment: .top) {
			List {
				ForEach(filteredList, id: \.self) { list in
					NavigationLink(destination: ItemsListView(selectedList: list)) {
						Text(list.name)
							.swipeActions {
								DeleteActionButton {
									vm.deleteList(modelContext: context, list: list)
								}
							}
					}
				}
			}
			.padding(.vertical)
			
			if showEmptyListView {
				emptyListView
					.padding()
			}
		}
		.toolbarBackground(.visible, for: .navigationBar)
		.searchable(text: $vm.searchText, prompt: "Pesquise pelo nome da lista")
		.navigationTitle("Listas")
		.toolbar {
			ToolbarItem {
				Button {
					withAnimation {
						vm.isSheetPresented = true
					}
				} label: {
					Image(systemName: "plus")
				}
			}
		}
		.sheet(isPresented: $vm.isSheetPresented) {
			AddListFormSheetView(isSheetPresented: $vm.isSheetPresented)
			
		}
	}
}

extension HomeView {
	private var emptyListView: some View {
		VStack {
			Text("Nenhuma lista ainda =(")
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
		HomeView()
	}
}
