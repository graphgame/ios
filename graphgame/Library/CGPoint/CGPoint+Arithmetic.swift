import CoreGraphics

infix operator +

func + (a: CGPoint, b: CGPoint) -> CGPoint {
	.init(x: a.x + b.x, y: a.y + b.y)
}

infix operator -

func - (a: CGPoint, b: CGPoint) -> CGPoint {
	.init(x: a.x - b.x, y: a.y - b.y)
}

infix operator *

func * (point: CGPoint, scale: CGFloat) -> CGPoint {
	.init(x: point.x * scale, y: point.y * scale)
}
