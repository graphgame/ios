let levels: [Level] = [
	.init(1) {
		"a" -- (10, 10)
		"b" -- (50, 10)
		"c" -- (10, 50)
		
		"a" --> "b"
		"a" --> "c"
		"b" --> "c"
	},
	.init(2) {
		
	},
	.init(3) {
		
	},
	.init(4) {
		
	},
	.init(5) {
		
	}
]
