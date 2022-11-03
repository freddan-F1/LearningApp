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
                    VStack(spacing:10) {
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            
                            Button {
                                selectedAnsverIndex = index
                                
                            } label: {
                                ZStack {
                                    //not submitted color gray if selected, otherwise white
                                    if !submitted {
                                        RectangleCard(color: index == selectedAnsverIndex ? .gray : .white).frame(height: 48)
                                        Text(model.currentQuestion!.answers[index])
                                    }
                                    else {
                                        //submitted and selected. Green if right, red if wrong
                                        if index == selectedAnsverIndex {
                                            RectangleCard(color: selectedAnsverIndex == model.currentQuestion!.correctIndex ? .green : .red).frame(height: 48)
                                            Text(model.currentQuestion!.answers[index]).foregroundColor(.white)
                                        }
                                        else {
                                            //submitted and not selected. Green if right, white if wrong
                                            if index == model.currentQuestion!.correctIndex {
                                                RectangleCard(color:.green).frame(height: 48)
                                                Text(model.currentQuestion!.answers[index]).foregroundColor(.white)
                                            }
                                            else {
                                                RectangleCard(color:.white).frame(height: 48)
                                                Text(model.currentQuestion!.answers[index])
                                            }
                                            
                                        }
                                        
                                    }
                                }.padding(.horizontal).font(.headline)
                            }
                            .disabled(submitted)
                        }
                    }.font(.headline)
                }
                Button {
                    //If not submitted: Submit and show new text
                    if !submitted {
                        submitted = true
                        //If there are more questions, show next question, otherwize show results
                        if model.currentQuestionIndex + 1 < model.currentModule!.test.questions.count {
                            buttonText = "Next question"
                        }
                        else {
                            buttonText = "Show results"
                        }
                    }
                    else {
                        //Submitted. Act on buttonText
                        if buttonText == "Next question" {
                            model.NextQuestion()
                            //clear propertys
                            submitted = false
                            selectedAnsverIndex = nil
                        }
                        else {
                            //show results
                        }
                    }
                    
                    
                } label: {
                    ZStack {
                        RectangleCard(color: .green).frame(height:48)
                        Text(buttonText).foregroundColor(.white).bold().font(.headline)
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
