
import SwiftUI

struct ArcView: View {
    
    let color: Color
    let startRadius: CGFloat
    let endRadius: CGFloat
    let startTrim: CGFloat
    let endTrim: CGFloat
    let rotate: CGFloat
    @State private var finalTrim: CGFloat = 0
    
    var lineWidth: CGFloat {    // 100 - 90
        endRadius - startRadius
    }
    var finalRadius: CGFloat {  // 100 - 10
        endRadius-lineWidth
    }
    
    var body: some View {
        Circle()
            .trim(from: startTrim, to: finalTrim)
            .stroke(
                color,
                style: StrokeStyle(
                    lineWidth: lineWidth,
                    lineCap: .round
                )
            )
            .rotationEffect(.degrees(rotate))
            .frame(width: endRadius-lineWidth,height: endRadius-lineWidth)
            .onAppear {
                withAnimation {
                    finalTrim = endTrim
                }
            }
    }
}

struct ArcView_Previews: PreviewProvider {
    static var previews: some View {
        
        /// change this values so you get better understanding how arc works
        
        ZStack {
            ArcView(
                color: .darkOrchid,
                startRadius: 90,
                endRadius: 100,
                startTrim: 0.25,
                endTrim: 0.75,
                rotate: 30
            )
            
            Circle()
                .stroke()
                .frame(width: 100,height: 100)
        }
    }
}
