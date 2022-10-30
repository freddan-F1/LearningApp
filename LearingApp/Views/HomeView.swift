//
//  HomeView.swift
//  LearingApp
//
//  Created by Fredrik Nilsson on 2022-10-30.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
    
        ScrollView {
            LazyVStack {
                ForEach(model.modules) { model in
                    
                    RowHomeView(image: model.content.image, title: "Learn " + model.category, description: model.content.description, count: "\(model.content.lessons.count) lessons", time: model.content.time)
                    
                    RowHomeView(image: model.test.image, title: model.category + " Test", description: model.test.description, count: "\(model.test.questions.count) questions", time: model.test.time)
                }
            }
            
            
        }
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
