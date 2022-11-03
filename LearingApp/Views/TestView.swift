//
//  TestView.swift
//  LearingApp
//
//  Created by Fredrik Nilsson on 2022-11-02.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:LearningModel
    
    @State private var selectedAnsverIndex:Int?
    @State private var questionsCorrect = 0
    @State private var submitted = false
    
    @State private var buttonText = "Submit"
    
    var body: some View {
       
        if model.currentQuestion != nil {
            
            VStack (spacing: 20){
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule!.test.questions.count)")
                
                //Question text
                CodeTextView().padding(.horizontal)
                
                //Answer options
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            
                            Button {
                                selectedAnsverIndex = index
                                
                            } label: {
                                ZStack {
                                    //not submitted color gray if selected, otherwise white
                                    if !submitted {
                                        RectangleCard(color: index == selectedAnsverIndex ? .gray : .white).frame(height: 48)
                                    }
                                    else {
                                        //submitted and selected. Green if right, red if wrong
                                        if index == selectedAnsverIndex {
                                            RectangleCard(color: selectedAnsverIndex == model.currentQuestion!.correctIndex ? .green : .red).frame(height: 48)
                                        }
                                        else {
                                            //submitted and not selected. Green if right, white if wrong
                                            RectangleCard(color: index == model.currentQuestion!.correctIndex ? .green : .white).frame(height: 48)
                                        }
                                        
                                    }
                                    Text(model.currentQuestion!.answers[index])
                                }.padding()
                            }
                            .disabled(submitted)
                        }
                    }.font(.headline)
                }
                Button {
                    
                    submitted = true
                    //Check if answer is correct. Add to questionscorrect
                    if selectedAnsverIndex == model.currentQuestion!.correctIndex {
                        questionsCorrect += 1
                    }
                    if submitted {
                        buttonText = "Next Question"
                    }
                    
                    
                } label: {
                    ZStack {
                        RectangleCard(color: .green).frame(height:48)
                        Text(buttonText)
                    }.padding()
                }
                .disabled( selectedAnsverIndex == nil ? true : false)
            }.navigationTitle("\(model.currentModule!.category) Test")
        }
        else {
            ProgressView()
        }
       
        
        //Check if there is a question
        
        //Show current question
        
        //Show answers
        
        //Button to display submit and then next question. At end show result and then back to root
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
