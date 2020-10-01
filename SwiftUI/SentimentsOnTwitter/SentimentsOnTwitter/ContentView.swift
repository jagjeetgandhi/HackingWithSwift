//
//  ContentView.swift
//  SentimentsOnTwitter
//
//  Created by jagjeet on 28/09/20.
//

import SwiftUI

struct ContentView: View {
 //   @ObservedObject var Twitter = TwitterAnalysis()
    @EnvironmentObject var Twitter:TwitterAnalysis
    
    @State var TwitterHandle:String = ""
    @State var showTweets:Bool = false
    @State var showGraph:Bool = false
    @State var ErrorAlert:Bool = false
    
    
   
   
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name:"American Typewriter" , size: 24)!,.foregroundColor: UIColor.white]
        UINavigationBar.appearance().backgroundColor = .black
        
        
        
        
    }
    var body: some View {
        NavigationView{
            
            ZStack{
                Color.black
                    .edgesIgnoringSafeArea(.all)
                if self.showTweets{
                    TweetsView()
                }
                if self.showGraph {
                    GraphView()
                }
                
                VStack(alignment: .center){
                    ZStack(alignment: .center){
                        if TwitterHandle.isEmpty{Text("Twitter Handle").foregroundColor(.white) }
                        TextField("", text:$TwitterHandle)
                            .frame(width: 300, height:50,alignment: .center)
                            .border(Color.white, width: 2)
                            .foregroundColor(.white)
                            .padding(20)
                    }
                    Divider()
                    Button(action: {Twitter.getTweets(Search: TwitterHandle)
                        UIApplication.shared.endEditing()
                        if TwitterHandle.isEmpty{
                            self.ErrorAlert = true
                        }
                        else{
                            self.ErrorAlert = false
                        }
                        print("\(self.ErrorAlert)")
                        
                    }){
                        Text("Search")
                            .frame(width: 200, height: 50)
                            .background(Color.white)
                       
                        
                    }
                    .padding(10)
                    
                    Spacer()
                    Text("Tweet Score ->  \(Twitter.TweetScore)")
                        .foregroundColor(.white)
                    Spacer()
                    
                      
                    

                }
              
                .alert(isPresented:self.$ErrorAlert){
                    Alert(title: Text("Handle doest not Exist"), message: Text("Enter a Valid Handle/HashTag"), dismissButton: .default(Text("OK")))
                }
            }
            .navigationBarTitle("Tweet Sentiment Analysis")
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

