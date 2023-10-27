//
//  ButtonTaskView.swift
//  TaskController
//
//  Created by Марк Поляков on 28.10.2023.
//

import SwiftUI
import AVFoundation


struct ButtonTaskView: View {
    
    var task: TaskModel
    
    @Binding var tasks: [TaskModel]
    
    @State private var progressCount: CGFloat = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var isTimerOn: Bool = false
    
    @State private var isMusicOn: Bool = false
    

    
    var body: some View {
        
        ZStack {
            Color.init(hex: "#0E1438").edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack{
                    Circle()
                        .stroke(Color.init(hex: "#66E0E4"), lineWidth: 20)
                        .frame(width: 250)
                        .padding(100)
                    
                    Circle()
                        .trim(from: 0, to: progressCount)
                        .stroke(Color.yellow, lineWidth: 20)
                        .frame(width: 250)
                        .overlay(
                            VStack{
                                Text("\(task.minutes) Minutes")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .bold()
                                    .padding(5)
                                
                                Text("\(task.name)")
                                    .foregroundColor(.yellow)
                                    .bold()
                            }
                        )
                }
                .onReceive(timer){ _ in
                    if isTimerOn{
                        let totalMinutes = Double(task.minutes) ?? 0
                        if progressCount < 1 {
                            progressCount += 1.0 / (totalMinutes * 60.0)
                        }
                    }
            }
                buttons
            }
        }
    }
     
}

#Preview {
    ButtonTaskView(task: TaskModel(name: "Пример задачи", minutes: "1", icon: 1), tasks: .constant([]))
}

extension ButtonTaskView{
    
    var buttons: some View{
        HStack(spacing:50){
            Button(action: {
                isTimerOn.toggle()
            }, label: {
                Circle()
                    .frame(width: 70)
                    .foregroundColor(Color.init(hex: "161C40"))
                    .overlay(
                        Image(systemName: isTimerOn ? "pause.fill" : "play.fill")
                            .foregroundColor(Color.init(hex: "#BECDE8"))
                            .font(.title)
                    )
            })
            
            Button(action: {
                if !isMusicOn{
                    isMusicOn.toggle()
                    playSound()
                }else{
                    isMusicOn.toggle()
                    stopSound()
                }
            }, label: {
                Circle()
                    .frame(width: 70)
                    .foregroundColor(Color.init(hex: "161C40"))
                    .overlay(
                        Image(systemName: isMusicOn ? "stop.circle.fill" : "music.note")
                            .foregroundColor(Color.init(hex: "#BECDE8"))
                            .font(.title)
                    )
            })
            
            Button(action: {
                progressCount = 0
            }, label: {
                Circle()
                    .frame(width: 70)
                    .foregroundColor(Color.init(hex: "161C40"))
                    .overlay(
                        Image(systemName: "stop.fill")
                            .foregroundColor(Color.init(hex: "#BECDE8"))
                            .font(.title)
                    )
            })
        }
    }
}
