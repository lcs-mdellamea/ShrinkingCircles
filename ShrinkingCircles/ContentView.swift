//
//  ContentView.swift
//  ShrinkingCircles
//
//  Created by Madison Dellamea on 2022-11-18.
//

import SwiftUI
//"Shape" protocol
struct ShrinkingCircles: Shape {
    
    func path(in rect: CGRect) -> Path {
        //At start of function, return a path
        var i = 0...8 {
            
            let j = CGFloat(i)
            
            path.addEllipse(in: CGRect(origin: CGPoint(x: rect.midX - rect.midY + 25 * j, y: 0 + 25 * j),
                                       size: CGSize(width: rect.height - 50 * j,
                                                    height: rect.height - 50 * j)))
            
        }
        
        // At end of function, return path
        return path
        
    }
}

struct ContentView: View {
    var body: some View {
        ShrinkingCircles()
            .stroke()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
