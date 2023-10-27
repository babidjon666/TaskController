//
//  ContentView.swift
//  TaskController
//
//  Created by Марк Поляков on 27.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isTuskShown: Bool = false
    
    @State var isButtonTuskShown: Bool = false
    
    @State private var tasks: [TaskModel] {
            didSet {
                TaskDataStore.shared.saveTasks(tasks)
            }
        }

        init() {
            _tasks = State(initialValue: TaskDataStore.shared.loadTasks())
        }
    
    @State private var selectedTask: TaskModel?
    
    var body: some View {
        ZStack{
            Color.init(hex: "#0E1438").edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Spacer()
                    
                    Text("Tasks")
                    
                    Spacer()
                    
                    Button(action: {
                        print(tasks)
                        isTuskShown.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .sheet(isPresented: $isTuskShown, content: {
                        TaskView(tasks: $tasks, isTuskShown: $isTuskShown)
                    })
                }
                .foregroundColor(.white)
                .bold()
                .font(.title2)
                .padding()
                
                ForEach(tasks) { task in
                    
                    Button(action: {
                        selectedTask = task
                        isButtonTuskShown.toggle()
                    }, label: {
                        HStack{
                            if task.icon==1{
                                Image("1")
                                     .resizable()
                                     .frame(width: 50,height: 50)
                                     .padding()
                                     .background(Color.init(hex: "#0E1438"))
                                     .cornerRadius(15)
                                     .padding()
                            }
                            if task.icon==2{
                                Image("2")
                                     .resizable()
                                     .frame(width: 50,height: 50)
                                     .padding()
                                     .background(Color.init(hex: "#0E1438"))
                                     .cornerRadius(15)
                                     .padding()
                            }
                            if task.icon==3{
                                Image("3")
                                     .resizable()
                                     .frame(width: 50,height: 50)
                                     .padding()
                                     .background(Color.init(hex: "#0E1438"))
                                     .cornerRadius(15)
                                     .padding()
                            }
                            if task.icon==4{
                                Image("4")
                                     .resizable()
                                     .frame(width: 50,height: 50)
                                     .padding()
                                     .background(Color.init(hex: "#0E1438"))
                                     .cornerRadius(15)
                                     .padding()
                            }
                            if task.icon==5{
                                Image("5")
                                     .resizable()
                                     .frame(width: 50,height: 50)
                                     .padding()
                                     .background(Color.init(hex: "#0E1438"))
                                     .cornerRadius(15)
                                     .padding()
                            }
                            VStack{
                                Text(task.name)
                                    .foregroundColor(.white)
                                    .bold()
                                    
                                Text("\(task.minutes) minutes")
                                    .foregroundColor(.yellow)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                tasks.removeAll { $0.id == task.id }
                                TaskDataStore.shared.saveTasks(tasks)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .padding()
                        }
                        .frame(width: 350,height: 100)
                        .background(Color.init(hex: "#161C40"))
                        .cornerRadius(15)
                    })
                    .sheet(item: $selectedTask) { task in
                        ButtonTaskView(task: task, tasks: $tasks)
                    }
                }
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
