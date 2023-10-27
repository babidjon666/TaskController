//
//  TaskDataStore.swift
//  TaskController
//
//  Created by Марк Поляков on 28.10.2023.
//

import Foundation

struct TaskDataStore {
    static let shared = TaskDataStore()

    private let key = "tasksKey"
    
    func saveTasks(_ tasks: [TaskModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    func loadTasks() -> [TaskModel] {
        if let data = UserDefaults.standard.data(forKey: key) {
            let decoder = JSONDecoder()
            if let tasks = try? decoder.decode([TaskModel].self, from: data) {
                return tasks
            }
        }
        return []
    }
}

