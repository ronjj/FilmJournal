//
//  InfoPage.swift
//  FilmJournalFirebase
//
//  Created by Ronald Jabouin on 10/25/21.
//

import SwiftUI

struct GuidingQuestion {
    let id = UUID()
    let question: String
}


struct InfoPage: View {
    @Environment(\.presentationMode) private var presentationMode
    let guidingQuestions = [
        GuidingQuestion(question: "What was your intended focus of the shot?"),
        GuidingQuestion(question: "What was the purpose of the shot?"),
        GuidingQuestion(question: "Where were you when you took the shot?"),
        GuidingQuestion(question: "What was the time?"),
        GuidingQuestion(question: "What was the weather like?"),
        
    ]
    
    var cancelButton: some View {
        Button(action: { self.handleCancelTapped() }) {
            Text("Cancel")
        }
    }
    
    var body: some View {
        
        NavigationView{
            List {
                Section(header: Text("Guiding Questions For Notes")) {
                    ForEach(guidingQuestions, id: \.id) { guidingQuestion in
                        Text(guidingQuestion.question)
                    }
                    .frame(height: 50)
                    
                }
            }
            .navigationBarItems(
                leading: cancelButton
            )
            .navigationTitle("Extra Information")
            
        }
    }
    func handleCancelTapped() {
        self.dismiss()
    }
    
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

//MARK: About Me Skeleton

//        VStack(alignment: .center, spacing: 20 ){
//
//            //Image("pfp")
//
//            Text("Hey, I'm the Developer 💻")
//                .font(.title)
//                .multilineTextAlignment(.center)
//
//            Text("Theres no huge company or team behind the app, it's just me, a 17 year old interested in film photography and coding.")
//                .font(.headline)
//                .multilineTextAlignment(.center)
//
//
//            Text("If you have suggestions for the app, find bugs, or help code, contact me at ronaldjabouinj@gmail.com")
//                .font(.subheadline)
//                .multilineTextAlignment(.center)
//
//
//
//        }
//        .padding(20)

