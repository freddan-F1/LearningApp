//
//  ResultsView.swift
//  LearingApp
//
//  Created by Fredrik Nilsson on 2022-11-03.
//

import SwiftUI

struct ResultsView: View {
    
    @EnvironmentObject var model:LearningModel
    var numCorrectQuestions:Int
    
    var text: String {
        let percentage = Double(numCorrectQuestions) / Double(model.currentModule!.test.questions.count)
        
        
        if percentage > 0.6 {
            return "Awesome"
        }
        else if percentage > 0.4 {
                return "Doing great"
            }
            else {
                return "Keep trying"
            }
    }
    
    var body: some View {
        
        
        VStack {
            Divider()
            Text(text).font(.title)
            Divider()
            Text("You´ve got \(numCorrectQuestions) out of \(model.currentModule!.test.questions.count) correct answers")
            Spacer()
            Button {
                //Set navigation selection back to nil
                model.selectedTest = nil
                
            } label: {
                ZStack {
                    RectangleCard(color: .green).frame(height: 48)
                    Text("Back to home screen").foregroundColor(.white).font(.headline).bold()
                }
                
            }
        }.padding().padding(.top,60)
        
        
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(numCorrectQuestions: 3)
    }
}
