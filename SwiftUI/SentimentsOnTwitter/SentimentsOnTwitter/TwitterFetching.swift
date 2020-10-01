//
//  TwitterFetching.swift
//  SentimentsOnTwitter
//
//  Created by jagjeet on 28/09/20.
//

import Foundation
import SwifteriOS
import SwiftyJSON

class TwitterAnalysis: ObservableObject {
    @Published var Tweets = [String]()
    @Published var Predictions = [String]()
    @Published var TweetScore = 0
    @Published var PosCount = 0
    @Published var NegCount = 0
    @Published var NeturalCount = 0
    @Published var ErrorFlag = false
    var TweetCount = 100
    
    let Sentiment = TwitterSentimentAnalysis()
    
    let swifter = Swifter(consumerKey: "3LxUmPn5jez3IOCw83FqwgSOp", consumerSecret: "xrgC0rEN4ry1eEvf6gjD7QrMIG9JbaqLQjTFRIw9y4WnBE8dOM")
    
    func getTweets(Search:String) {
        
        Tweets.removeAll()
        Predictions.removeAll()
        TweetScore = 0
        PosCount = 0
        NegCount = 0
        NegCount = 0
        
        swifter.searchTweet(using: Search, lang: "en",count:TweetCount,tweetMode: TweetMode.extended) { [self] (results, metadata) in
            for i in 0..<self.TweetCount{
                if let tweet = results[i]["full_text"].string {
                    self.Tweets.append(tweet)
                }
            }
            self.StatmentAnalysis(tweets: Tweets)
            
        } failure: { (error) in
            
                self.ErrorFlag = true
            print("Error Occured while Fetching Tweets")
            print("-- >\(self.ErrorFlag)")
            
        }

    }
    
    func StatmentAnalysis(tweets:[String]) {
        ErrorFlag = false
        for tweet in tweets {
            let pred = try? Sentiment.prediction(text: tweet)
            Predictions.append(pred!.label)
            if pred?.label == "Pos" {
                TweetScore = TweetScore + 1
                PosCount += 1
            }
            else if pred?.label == "Neg" {
                  TweetScore = TweetScore - 1
                NegCount += 1
            }
            else {
                NeturalCount += 1
            }
        }
    }
}

