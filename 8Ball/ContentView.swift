//
//  ContentView.swift
//  8Ball
//
//  Created by Vincent Cloutier on 2021-09-16.
//


import SwiftUI

struct ContentView: View {
    @State private var arrayNum = 0
    @State private var showingAlert = false
    @State private var alertMSG = ""
    @State private var question: String = ""
    var answers = ["It is certain", "It is decidedly so", "Without a doubt", "Yes, definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful"]

    var body: some View {
        ZStack  {
            LinearGradient(gradient: Gradient(colors: [.black, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                GroupBox(
                    label: Label("You", systemImage: "person.fill")
                        .foregroundColor(.black)
                ) {
                    TextField("Enter here", text: $question)
                    
                }.padding()
                
                
                Button(action: {
                    submit()
                }, label: {
                    Text("Ask 8 Ball")
                        .padding()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .background(Color.white)
                        .cornerRadius(10)
                })
                
                
                
            }
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text(alertMSG), dismissButton: .default(Text("Got it!")))
        }
    }
    func submit() {
        if !question.isEmpty {

        arrayNum = Int.random(in: 0...19)
        self.showingAlert = true
        alertMSG = answers[arrayNum]
        }
        else {
            self.showingAlert = true
            alertMSG = "Please enter a question"
        }
    }
}
