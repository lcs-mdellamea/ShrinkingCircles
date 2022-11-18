//
//  ContentView.swift
//  ShrinkingCircles
//
//  Created by Madison Dellamea on 2022-11-18.
//

import SwiftUI
//"Shape" protocol
//struct ShrinkingCircles: Shape {
//
//    func path(in rect: CGRect) -> Path {
//        //At start of function, return a path
//        var i = 0...8 {
//
//            let j = CGFloat(i)
//
//            path.addEllipse(in: CGRect(origin: CGPoint(x: rect.midX - rect.midY + 25 * j, y: 0 + 25 * j),
//                                       size: CGSize(width: rect.height - 50 * j,
//                                                    height: rect.height - 50 * j)))
//
//        }
//
//        // At end of function, return path
//        return path
//
//    }
//}

struct ShrinkingCirclesRecursively: Shape {
    
    // MARK: Stored Properties
    let desiredDepth: Int
    
    // MARK: Functions
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        
        // "INVOKE": Beging calling the recursive helper
        let allThePaths = recursiveHelper(currentDepth: 1, drawingIn: rect)
        path.addPath(allThePaths)
        
        return path
        
    }
    func recursiveHelper(currentDepth: Int,
                         drawingIn rect:CGRect) -> Path {
        
        // Make the path
        var path = Path()
        
        // Draw the circle for the current depth
        let j = CGFloat(currentDepth - 1)
        path.addEllipse(in: CGRect(origin: CGPoint(x: rect.midX - rect.midY + 25 * j, y: 0 + 25 * j),
                                              size: CGSize(width: rect.height - 50 * j,
                                                           height: rect.height - 50 * j)))
        
        // Decide whether to call the func again (recurse)
        if currentDepth < desiredDepth {
            //Call function                                   The plus 1 is important! ---V
            let pathForNextCircle = Path() = recursiveHelper(currentDepth: currentDepth + 1, drawingIn: rect)
            path.addPath(pathForNextCircle)
        }
        
        // return the path
        return path
    }
}

struct ContentView: View {
    var body: some View {
//        ShrinkingCircles()
//            .stroke()
        
        ShrinkingCirclesRecursively(desiredDepth: 4)
            .stroke()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
