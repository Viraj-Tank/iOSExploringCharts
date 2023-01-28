
import SwiftUI

struct TestColorButtonView: View {
    
    @State var colors: [Color]
    @State private var rotateBar: Bool = false
    @State private var tilt: CGFloat = 0.0
    
    var count: CGFloat {
        CGFloat(colors.count)
    }
    var barWidth: CGFloat {
        (UIScreen.main.bounds.width / count) - 5
    }
    
    
    var body: some View {
        NavigationStack {
            HStack(alignment: .bottom,spacing: 4) {
            
                ForEach(colors, id: \.self) { color in
                    
                    let height = Double.random(in: 50...200)
                        BorderedRectangle(
                            color: color,
                            barWidth: barWidth,
                            height: height
                        )
                }
            }
        }
        
    }
}
struct BorderedRectangle: View {
    
    let color: Color
    let barWidth: CGFloat
    let height: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(color)
            .frame(width: barWidth,height: height)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 0.7)
            )
    }
}

struct TestColorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TestColorButtonView(colors: Color.defaultColors)
    }
}
