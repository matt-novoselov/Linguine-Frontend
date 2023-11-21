import SwiftUI

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


#Preview {
    LightningIcon()
        .frame(width: 15,height: 18)
        .foregroundColor(.lgPinkButton)
}
