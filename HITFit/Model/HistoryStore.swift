//
//  HistoryStore.swift
//  MyFirst
//
//  Created by William Adam Wickham on 1/31/26.
//

import Foundation

struct ExerciseDay: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [String] = []
}

struct HistoryStore {
    var exerciseDays: [ExerciseDay] = []
    
    init() {
        #if DEBUG
        createDevData()
        #endif
    }
}
