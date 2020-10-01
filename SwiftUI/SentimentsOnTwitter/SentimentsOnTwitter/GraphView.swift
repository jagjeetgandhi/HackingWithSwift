//
//  GraphView.swift
//  SentimentsOnTwitter
//
//  Created by jagjeet on 29/09/20.
//

import SwiftUI

struct GraphView: View {
    var Labels = ["Postive","Negative","Netural"]
  //  @ObservedObject var Twitter:TwitterAnalysis
    @EnvironmentObject var Twitter:TwitterAnalysis
    
  
    var body: some View {
        var Figures = [Twitter.PosCount,Twitter.NegCount,Twitter.NeturalCount]
        
        HStack(alignment: .lastTextBaseline){
            ForEach(0..<3){ i in
            VStack{
                Text("\(Figures[i])")
                .foregroundColor(.white)
            Rectangle()
                .fill(Color.white)
                .frame(width: 50, height: CGFloat(Figures[i]*2))
                Text("\(Labels[i])")
                    .foregroundColor(.white)
            }
            }
            
        }
        .frame(maxWidth:.infinity,maxHeight:.infinity)
        .background(Color.black)
        .cornerRadius(20)
        .padding(10)
            
    }
}


struct GraphView_Previews: PreviewProvider {
   // static let twitter = TwitterAnalysis()
    static var previews: some View {
        
        GraphView()
    }
}

struct Graph:Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
    
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        return path
    }
    
}
