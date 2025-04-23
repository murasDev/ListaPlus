//
//  CheckboxComponent.swift
//  ListaPlus
//
//  Created by Murilo Castilho on 08/04/25.
//

import SwiftUI

struct CheckboxComponent: View {
	var isChecked: Bool
			
	var body: some View {
		ZStack {
			if isChecked {
				Color(.green)
				
				Image(systemName: "checkmark")
					.resizable()
					.scaledToFit()
					.fontWeight(.bold)
					.foregroundStyle(.white)
					.frame(width: 12, height: 12)
			}
		}
		.frame(width: 25, height: 25)
		.clipShape(.circle)
		.overlay {
			Circle()
				.strokeBorder(.gray, lineWidth: 2)
		}
	}
}

#Preview {
	CheckboxComponent(isChecked: true)
}
