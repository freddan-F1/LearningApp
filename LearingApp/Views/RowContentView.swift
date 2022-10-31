//
//  RowContentView.swift
//  LearingApp
//
//  Created by Fredrik Nilsson on 2022-10-30.
//

import SwiftUI

struct RowContentView: View {
    
    @EnvironmentObject var model:LearningModel
    var index:Int
    
    var body: some View {
        
        let lesson = model.currentModule!.content.lessons[index]
        ZStack(alignment: .leading) {
            Rectangle().frame(height: 100).foregroundColor(.white).cornerRadius(10).shadow(radius: 5)
            
            HStack {
                Text(String(index + 1)).font(.title2)
                VStack(alignment: .leading, spacing: 5) {
                    Text(lesson.title).bold()
                    Text(lesson.duration)
                        .font(Font.system(size: 14))
                }.padding(.leading,30)
            }.padding(30)
        }.padding(.horizontal)
            .padding(.bottom,5)
    }
}
