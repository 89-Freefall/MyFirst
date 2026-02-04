//
//  WelcomeView.swift
//  MyFirst
//
//  Created by William Adam Wickham on 1/31/26.
//

import SwiftUI

struct WelcomeView: View {
  @State private var showHistory = false
  @Binding var selectedTab: Int

  var body: some View {
    VStack {
      HeaderView(
        selectedTab: $selectedTab,
        titleText: "Welcome")
      .containerRelativeFrame(.vertical) { length, _ in
        length * 0.2
      }
      ContainerView {
        ViewThatFits {
          VStack {
            WelcomeView.images
            WelcomeView.welcomeText
            getStartedButton
            Spacer()
            historyButton
          }
          VStack {
            WelcomeView.welcomeText
            getStartedButton
            Spacer()
            historyButton
          }
        }
      }
      .containerRelativeFrame(.vertical) { length, _ in
        length * 0.8
      }
    }
    .sheet(isPresented: $showHistory) {
      HistoryView(showHistory: $showHistory)
    }
  }

  var getStartedButton: some View {
    RaisedButton(buttonText: "Get Started") {
      selectedTab = 0
    }
    .padding()
  }

  var historyButton: some View {
    Button(
      action: {
        showHistory = true
      }, label: {
        Text("History")
          .fontWeight(.bold)
          .padding([.leading, .trailing], 5)
      })
      .padding(.bottom, 10)
      .buttonStyle(EmbossedButtonStyle())
  }
}

#Preview {
  WelcomeView(selectedTab: .constant(9))
}
