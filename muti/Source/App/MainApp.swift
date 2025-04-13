//
//	MainApp.swift
//	Copyright © 2025 GLEESH.
//

import SwiftUI

@main
struct MainApp: App {

	@NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

	var body: some Scene {
		WindowGroup {
			MainView()
		}
	}
}
