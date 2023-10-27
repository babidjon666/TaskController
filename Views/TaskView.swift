//
//  TaskView.swift
//  TaskController
//
//  Created by Марк Поляков on 27.10.2023.
//

import SwiftUI

struct TaskView: View {
    
    @State private var name: String = ""
    
    @State private var minutes: String = ""
    
    @State private var image: Int = 1
    
    @Binding var tasks: [TaskModel]
    
    @Binding var isTuskShown: Bool
    
    var body: some View {
        ZStack{
            Color.init(hex: "#0E1438").edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Add task")
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                
                Spacer()
                
                if image == 1{
                    Image("1")
                        .resizable()
                        .frame(width: 90, height: 90)
                }
                if image == 2{
                    Image("2")
                        .resizable()
                        .frame(width: 90, height: 90)
                }
                if image == 3{
                    Image("3")
                        .resizable()
                        .frame(width: 90, height: 90)
                }
                if image == 4{
                    Image("4")
                        .resizable()
                        .frame(width: 90, height: 90)
                }
                if image == 5{
                    Image("5")
                        .resizable()
                        .frame(width: 90, height: 90)
                }
                
                TextField(text: $name, label: {
                    Text("Title")
                        .foregroundColor(Color.init(hex: "#66E0E4"))
                })
                .foregroundColor(Color.init(hex: "#66E0E4"))
                .padding()
                .border(Color.init(hex: "#66E0E4"))
                .cornerRadius(3)
                .padding()
                
                HStack{
                    TextField(text: $minutes, label: {
                        Text("Minutes")
                            .foregroundColor(.yellow)
                    })
                    .keyboardType(.numberPad)
                    .padding()
                    .foregroundColor(Color.init(hex: "#66E0E4"))
                    
                    Spacer()
                    
                    Image(systemName: "clock")
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                }
                .frame(width: 365)
                .border(Color.init(hex: "#66E0E4"))
                .cornerRadius(3)
                
                HStack{
                    Button(action: {
                        image = 1
                    }, label: {
                        Image("1")
                            .resizable()
                            .frame(width: 35,height: 35)
                            .padding()
                            .background(Color.init(hex: "#161C40"))
                            .cornerRadius(15)
                    })
                    Button(action: {
                        image = 2
                    }, label: {
                        Image("2")
                            .resizable()
                            .frame(width: 35,height: 35)
                            .padding()
                            .background(Color.init(hex: "#161C40"))
                            .cornerRadius(15)
                    })
                    Button(action: {
                        image = 3
                    }, label: {
                        Image("3")
                            .resizable()
                            .frame(width: 35,height: 35)
                            .padding()
                            .background(Color.init(hex: "#161C40"))
                            .cornerRadius(15)
                    })
                    Button(action: {
                        image = 4
                    }, label: {
                        Image("4")
                            .resizable()
                            .frame(width: 35,height: 35)
                            .padding()
                            .background(Color.init(hex: "#161C40"))
                            .cornerRadius(15)
                    })
                    Button(action: {
                        image = 5
                    }, label: {
                        Image("5")
                            .resizable()
                            .frame(width: 35,height: 35)
                            .padding()
                            .background(Color.init(hex: "#161C40"))
                            .cornerRadius(15)
                    })
                }
                .padding()
                
                Button(action: {
                    tasks.append(TaskModel(name: name, minutes: minutes, icon: image))
                    TaskDataStore.shared.saveTasks(tasks)
                    isTuskShown.toggle()
                }, label: {
                    Text("Add Task")
                        .foregroundColor(Color.init(hex: "#0E1438"))
                        .bold()
                        .font(.title2)
                        .frame(width: 350,height: 75)
                        .background(Color.init(hex: "#66E0E4"))
                        .cornerRadius(30)
                })
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    TaskView(tasks: .constant([TaskModel]()), isTuskShown: .constant(true))
}
