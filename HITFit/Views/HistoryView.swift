//
//  HistoryView.swift
//  MyFirst
//
//  Created by William Adam Wickham on 1/31/26.
//

import SwiftUI

struct HistoryView: View {
  @Binding var showHistory: Bool
  @EnvironmentObject var history: HistoryStore

  var body: some View {
    ZStack(alignment: .topTrailing) {
      // swiftlint:disable:next multiple_closures_with_trailing_closure
      Button(action: { showHistory.toggle() }) {
        Image(systemName: "xmark.circle")
      }
      .font(.title)
      .padding()

      VStack {
        Text("History")
          .font(.title)
          .padding()
        Form {
          ForEach(history.exerciseDays) { day in
            Section(
              header:
                Text(day.date.formatted(as: "MMM d"))
                .font(.headline)) {
                  ForEach(day.exercises, id: \.self) { exercise in
                    Text(exercise)
                  }
                }
          }
        }
      }
    }
  }
}

#Preview {
  HistoryView(showHistory: .constant(true))
    .environmentObject(HistoryStore())
}

#Preview {
  HistoryView(showHistory: .constant(true))
    .environmentObject(HistoryStore())
}
