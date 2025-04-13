//
//	MainView.swift
//	Copyright © 2025 GLEESH.
//

import SwiftUI
import UniformTypeIdentifiers

struct MainView: View {

	@State var selectedSegment: Int = 0

	var body: some View {
		NavigationSplitView {
			Picker("", selection: $selectedSegment) {
				Text("UTIs").tag(0)
				Text("Applications").tag(1)
			}
			.pickerStyle(.palette)
			.padding()

			List(UTType.allTypes, id: \.self) { item in
				NavigationLink(destination: DetailView(item: item)) {
					Text(item.identifier)
				}

			}
			.navigationTitle("Items")
		} detail: {
			Text("Select an item")
		}
	}
}

struct DetailView: View {
	let item: UTType

	var displayString: String {
		let url = NSWorkspace.shared.urlForApplication(toOpen: item)
		return url?.absoluteString ?? "Unknown"
	}

	var body: some View {
		VStack(alignment: .leading) {
			Text("\(item)")
				.font(.title)
				.padding(.vertical)

			Text("Identifier: \(item.identifier)")

			Text("Tags: \(item.tags)")

			Text("Supertypes: \(item.supertypes)")

			Text("Default Application: \(displayString)")

			Spacer()
		}
		.frame(maxWidth: .infinity, alignment: .leading)
		.padding()
	}
}
