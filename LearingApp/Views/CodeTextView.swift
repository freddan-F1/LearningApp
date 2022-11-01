//
//  CodeTextView.swift
//  LearingApp
//
//  Created by Fredrik Nilsson on 2022-11-01.
//

import SwiftUI

struct CodeTextView:UIViewRepresentable {
  
    @EnvironmentObject var model:LearningModel
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }
    
    func updateUIView(_ textView: UIViewType, context: Context) {
        
        //set the attributed text for the lesson
        textView.attributedText = model.lessonDescription
        //scroll back to the top
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
    
    
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
