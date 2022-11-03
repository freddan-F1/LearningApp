//
//  HomeView.swift
//  LearingApp
//
//  Created by Fredrik Nilsson on 2022-10-30.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:LearningModel
    
    var body: some View {
    
        NavigationView {
            VStack(alignment: .leading) {
                Text("What do you want to do today?").padding()
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules) { module in
                            
                            
                            NavigationLink(tag: module.id, selection: $model.selectedContent, destination: {
                                ContentView().onAppear(perform: {
                                    model.setCurrentModule(moduleId: module.id)
                                })
                            },
                                           
                            label: {
                                //ModuleContentCard
                                RowHomeView(image: module.content.image, title: "Learn " + module.category, description: module.content.description, count: "\(module.content.lessons.count) lessons", time: module.content.time)
                                
                            })
                            
                            NavigationLink(tag: module.id, selection: $model.selectedTest) {
                                TestView().onAppear(perform: {
                                    model.BeginQuestion(moduleId: module.id)})
                                
                                
                            } label: {
                                //ModuleTestCard
                                RowHomeView(image: module.test.image, title: module.category + " Test", description: module.test.description, count: "\(module.test.questions.count) questions", time: module.test.time)
                            }
                            
                            NavigationLink(destination: EmptyView() ) {
                                EmptyView()
                            }

                            
                        }
                    }
                    
                    
                }
            }
            .navigationTitle("Get started").padding().padding(.bottom)
        }
        .navigationViewStyle(.stack)
        .accentColor(.black)
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(LearningModel())
    }
}
