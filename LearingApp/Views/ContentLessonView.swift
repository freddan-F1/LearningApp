//
//  ContentLessonView.swift
//  LearingApp
//
//  Created by Fredrik Nilsson on 2022-10-31.
//

import SwiftUI
import AVKit

struct ContentLessonView: View {
    
    @EnvironmentObject var model:LearningModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        
        let url = URL(string: Constants.videoUrl + (lesson?.video ?? ""))
        
        VStack {
            if lesson != nil {
                VideoPlayer(player: AVPlayer(url: url!)).cornerRadius(10)
                
                //Description
                CodeTextView()
            }
            
            if model.HasNextLesson() {
             
                Button(action: {
                    model.NextLesson()
                }, label: {
                    ZStack {
                        Rectangle()
                            .frame(height:48)
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        Text("Next Lesson \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                })
                
            }
            
            
            
        }.padding()
            .navigationTitle(lesson?.title ?? "")
      
    }
}

struct ContentLessonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentLessonView()
    }
}
