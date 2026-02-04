//
//  ContainerView.swift
//  HITFit
//
//  Created by William Adam Wickham on 2/4/26.
//

import SwiftUI

struct ContainerView<Content: View>: View {
  var content: Content

  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 25.0)
        .fill(Color.background)
      VStack {
        Spacer()
        Rectangle()
          .fill(Color.background)
          .frame(height: 25)
      }
      content
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  ContainerView {
    VStack {
      RaisedButton(buttonText: "Hello World") {}
        .padding(50)
      Button("Tap me!") {}
        .buttonStyle(EmbossedButtonStyle(buttonShape: .circle))
    }
  }
  .padding(50)
}

