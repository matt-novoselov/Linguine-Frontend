//
//
//
//
//
//

import SwiftUI

// The path that describes Lightning Icon SVG
struct LightningIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.64174*width, y: 0.06746*height))
        path.addCurve(to: CGPoint(x: 0.47074*width, y: 0.03119*height), control1: CGPoint(x: 0.63293*width, y: -0.00112*height), control2: CGPoint(x: 0.52169*width, y: -0.02472*height))
        path.addLine(to: CGPoint(x: 0.05142*width, y: 0.49136*height))
        path.addCurve(to: CGPoint(x: 0.1037*width, y: 0.60762*height), control1: CGPoint(x: 0.01264*width, y: 0.53392*height), control2: CGPoint(x: 0.03967*width, y: 0.59404*height))
        path.addLine(to: CGPoint(x: 0.34224*width, y: 0.65822*height))
        path.addLine(to: CGPoint(x: 0.37748*width, y: 0.93254*height))
        path.addCurve(to: CGPoint(x: 0.54847*width, y: 0.96881*height), control1: CGPoint(x: 0.38629*width, y: 1.00112*height), control2: CGPoint(x: 0.49752*width, y: 1.02472*height))
        path.addLine(to: CGPoint(x: 0.96779*width, y: 0.50864*height))
        path.addCurve(to: CGPoint(x: 0.91551*width, y: 0.39238*height), control1: CGPoint(x: 1.00658*width, y: 0.46608*height), control2: CGPoint(x: 0.97954*width, y: 0.40596*height))
        path.addLine(to: CGPoint(x: 0.67697*width, y: 0.34178*height))
        path.addLine(to: CGPoint(x: 0.64174*width, y: 0.06746*height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    LightningIcon()
        .frame(width: 15,height: 18)
        .foregroundColor(.lgPinkButton)
}
