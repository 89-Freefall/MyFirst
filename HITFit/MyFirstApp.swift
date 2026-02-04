//
//  MyFirstApp.swift
//  MyFirst
//
//  Created by William Adam Wickham on 1/31/26.
//

import SwiftUI

@main
struct HIITFitApp: App {
  @StateObject private var historyStore = HistoryStore()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(historyStore)
        .onAppear {
          print(URL.documentsDirectory)
        }
        .alert(
          "History",
          isPresented: $historyStore.loadingError) {
            Button("OK") { }
          } message: {
            Text(
              """
                Unfortunately we can't load your past history.
                Email support:
                support@xyz.com
                """)
          }
    }
  }
}
