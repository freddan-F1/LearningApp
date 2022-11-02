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
                        RectangleCard(color: Color.green)
                            .frame(height:48)
                        
                        Text("Next Lesson \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                })
                
            }
            else {
                
                //Show button "complete"
                Button(action: {
                    //Return back to home screen
                    model.selectedContent = nil
                }, label: {
                    ZStack {
                        RectangleCard(color: Color.green)
                            .frame(height:48)
                        Text("Complete")
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
