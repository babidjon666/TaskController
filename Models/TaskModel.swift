//
//  TaskModel.swift
//  TaskController
//
//  Created by Марк Поляков on 27.10.2023.
//

import Foundation

struct TaskModel: Identifiable, Codable{
    var id = UUID()
    var name: String
    var minutes: String
    var icon: Int
}
