//
//  DeleteActionButton.swift
//  ListaPlus
//
//  Created by Murilo Castilho on 18/04/25.
//

import SwiftUI

struct DeleteActionButton: View {
	let onTap: () -> Void
	
	var body: some View {
		Button("Delete", systemImage: "trash", role: .destructive) {
			onTap()
		}
	}
}
