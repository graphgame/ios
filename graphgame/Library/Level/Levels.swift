let levels: [Level] = [
	.init(1) {
		"a" -- (0, 0)
		"b" -- (100, 0)
		"c" -- (50, 50)
		"x" -- (0, 100)
		"y" -- (100, 100)
		
		"a" --> "x"
		"a" --> "b"
		"b" --> "y"
		"c" --> "y"
		"x" --> "c"
		"x" --> "y"
	},
	.init(2) {
		"a" -- (0, 0)
		"b" -- (100, 0)
		"c" -- (50, 50)
		"x" -- (0, 100)
		"y" -- (100, 100)
		
		"a" --> "x"
		"a" --> "c"
		"b" --> "c"
		"b" --> "y"
		"c" --> "x"
		"c" --> "y"
		"x" --> "y"
	},
	.init(3) {
		"x" -- (0, 50)
		"y" -- (100, 50)
		
		"x" --> "y"
	},
	.init(4) {
		"x" -- (0, 50)
		"y" -- (100, 50)
		
		"x" --> "y"
	},
	.init(5) {
		"x" -- (0, 50)
		"y" -- (100, 50)
		
		"x" --> "y"
	}
]
