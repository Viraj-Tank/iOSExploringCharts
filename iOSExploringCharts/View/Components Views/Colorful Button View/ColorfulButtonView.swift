
import SwiftUI

struct ColorfulButtonView: View {
    
    @Binding var colors: [Color] // default colors - 7
    @State private var flip: Bool = false
    let dim: CGFloat // 180
    let offset: CGFloat // 10
    let action: () -> Void
    
    var lastColor: Color {
        colors.last ?? .whiteSmoke
//        colors[colors.count - 1]
    }
    var count: CGFloat { // 7.0
        CGFloat(colors.count)
    }
    var factor: CGFloat { //  180-10/7 = 24.28
        (dim - offset) / count
    }
    func minRadius(i: Int, offset: CGFloat) -> CGFloat {
//        return factor * CGFloat(i) + offset + factor
        return factor * CGFloat(i) + offset
    }
    func maxRadius(i: Int, offset: CGFloat) -> CGFloat {
        return factor * CGFloat(i + 1) + offset
    }
    
    var body: some View {
        ZStack {
            ForEach(0 ..< colors.count, id:\.self) { i in
                RandomArcFromColorListView(
                    colors: Color.defaultColors,
                    index: i,
                    minRadius: minRadius(i: i, offset: offset),
                    maxRadius: maxRadius(i: i, offset: offset),
                    opacity: 0.9
                )
            }
            Circle()
                .stroke(lastColor,lineWidth: factor)
                .frame(width: dim, height: dim)
        }
        .rotation3DEffect(
            flip ? .zero : .degrees(180),
            axis: (
                x:Double.random(in: -1...1),
                y:Double.random(in: -1...1),
                z:0
            )
        )
        .onTapGesture {
            colors = Color.randomColorsN(n: colors.count)
            withAnimation {
                flip.toggle()
            }
            action()
        }
    }
}

struct ColorfulButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ColorfulButtonView(
            colors: .constant(Color.defaultColors),
            dim: 180,
            offset: 10,
            action: {}
        )
    }
}
