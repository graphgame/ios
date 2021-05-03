func clamp<Value: Comparable>(_ a: Value, _ b: Value, _ c: Value) -> Value {
	min(max(a, b), c)
}
