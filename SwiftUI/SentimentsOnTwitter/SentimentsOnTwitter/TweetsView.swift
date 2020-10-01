//
//  TweetsView.swift
//  SentimentsOnTwitter
//
//  Created by jagjeet on 28/09/20.
//

import SwiftUI

struct TweetsView: View {
 //   @ObservedObject var Twitter:TwitterAnalysis
    @EnvironmentObject var Twitter:TwitterAnalysis
    
    
    
    var body: some View {
        VStack{
            List{
                ForEach(Twitter.Tweets,id:\.self) {
                    Text($0)
                }
            }
        }
        .navigationBarTitle("Recent Tweets",displayMode: .inline)
    }
}

struct TweetsView_Previews: PreviewProvider {
  //  static let twitter = TwitterAnalysis()
    static var previews: some View {
        TweetsView()
    }
}
