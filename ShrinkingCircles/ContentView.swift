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
        var path = Path()
        
        path.addEllipse(in: CGRect(origin: CGPoint(x: rect.midX + 25 * 0, y: 0), size: CGSize(width: rect.height - 50 * 0, height: rect.height - 50 * 0)))
        
        path.addEllipse(in: CGRect(origin: CGPoint(x: (rect.midX - rect.midY) + 25, y: 0 + 25), size: CGSize(width: rect.height - 50 * 1, height: rect.height - 50 * 1)))
        
        path.addEllipse(in: CGRect(origin: CGPoint(x: (rect.midX - rect.midY) + 25, y: 0 + 25), size: CGSize(width: rect.height - 50 * 2, height: rect.height - 50 * 2)))
        
        path.addEllipse(in: CGRect(origin: CGPoint(x: (rect.midX - rect.midY) + 25, y: 0 + 25), size: CGSize(width: rect.height - 50 * 3, height: rect.height - 50 * 3)))
        
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
