import SwiftUI

struct blobText: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.41122*width, y: 0.84819*height))
        path.addLine(to: CGPoint(x: 0.4117*width, y: 0.84918*height))
        path.addLine(to: CGPoint(x: 0.41226*width, y: 0.85007*height))
        path.addLine(to: CGPoint(x: 0.49058*width, y: 0.97505*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.9901*height))
        path.addLine(to: CGPoint(x: 0.50942*width, y: 0.97505*height))
        path.addLine(to: CGPoint(x: 0.58774*width, y: 0.85007*height))
        path.addLine(to: CGPoint(x: 0.5883*width, y: 0.84918*height))
        path.addLine(to: CGPoint(x: 0.58878*width, y: 0.84819*height))
        path.addCurve(to: CGPoint(x: 0.66201*width, y: 0.79245*height), control1: CGPoint(x: 0.6056*width, y: 0.81323*height), control2: CGPoint(x: 0.6329*width, y: 0.79245*height))
        path.addLine(to: CGPoint(x: 0.87179*width, y: 0.79245*height))
        path.addCurve(to: CGPoint(x: 0.98718*width, y: 0.62264*height), control1: CGPoint(x: 0.93552*width, y: 0.79245*height), control2: CGPoint(x: 0.98718*width, y: 0.71643*height))
        path.addLine(to: CGPoint(x: 0.98718*width, y: 0.18868*height))
        path.addCurve(to: CGPoint(x: 0.87179*width, y: 0.01887*height), control1: CGPoint(x: 0.98718*width, y: 0.0949*height), control2: CGPoint(x: 0.93552*width, y: 0.01887*height))
        path.addLine(to: CGPoint(x: 0.12821*width, y: 0.01887*height))
        path.addCurve(to: CGPoint(x: 0.01282*width, y: 0.18868*height), control1: CGPoint(x: 0.06448*width, y: 0.01887*height), control2: CGPoint(x: 0.01282*width, y: 0.0949*height))
        path.addLine(to: CGPoint(x: 0.01282*width, y: 0.62264*height))
        path.addCurve(to: CGPoint(x: 0.12821*width, y: 0.79245*height), control1: CGPoint(x: 0.01282*width, y: 0.71643*height), control2: CGPoint(x: 0.06448*width, y: 0.79245*height))
        path.addLine(to: CGPoint(x: 0.33799*width, y: 0.79245*height))
        path.addCurve(to: CGPoint(x: 0.41122*width, y: 0.84819*height), control1: CGPoint(x: 0.3671*width, y: 0.79245*height), control2: CGPoint(x: 0.3944*width, y: 0.81323*height))
        path.closeSubpath()
        return path
    }
}
