import UIKit

@IBDesignable class GradientView: UIView {
    
    // 1 - Gradient properties will be viewable in IB
    @IBInspectable var startColor: UIColor = UIColor.red
    @IBInspectable var endColor: UIColor = UIColor.green
    
    override func draw(_ rect: CGRect) {
        
        // 2 - Get the context
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.cgColor, endColor.cgColor]
        
        // 3 - Set the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // 4 - Set the color stops
        let colorLocations: [CGFloat] = [0.0, 1.0]
        
        // 5 - Create the gradient
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: colorLocations)
        
        // 6 - Draw the gradient
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: self.bounds.height)
        
        context?.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: .drawsAfterEndLocation)
    }
}