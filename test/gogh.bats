#!/usr/bin/env bats

GOGH_FIXTURE="${BATS_TEST_DIRNAME}/fixtures/gogh"

@test "gogh help" {
	run gogh --help
	[ "$status" -eq 0 ]
	[[ "$output" == *"Usage"* ]]
}

@test "gogh ls lists cached themes" {
	GOGH_CACHE="$GOGH_FIXTURE" run gogh ls
	[ "$status" -eq 0 ]
	[[ "$output" == *"Foo Dark"* ]]
	[[ "$output" == *"Foo Light"* ]]
}

@test "gogh ls with filter" {
	GOGH_CACHE="$GOGH_FIXTURE" run gogh ls light
	[ "$status" -eq 0 ]
	[[ "$output" == *"Foo Light"* ]]
	[[ "$output" != *"Foo Dark"* ]]
}

@test "gogh match resolves name with dashes" {
	GOGH_CACHE="$GOGH_FIXTURE" run gogh match foo-dark
	[ "$status" -eq 0 ]
	[[ "$output" == "Foo Dark" ]]
}

@test "gogh match fails on ambiguity" {
	GOGH_CACHE="$GOGH_FIXTURE" run gogh match foo
	[ "$status" -eq 1 ]
	[[ "$output" == *"Foo Dark"* ]]
	[[ "$output" == *"Foo Light"* ]]
}

@test "gogh match fails without cache" {
	GOGH_CACHE="${BATS_TEST_DIRNAME}/fixtures/nope" run gogh match foo-dark
	[ "$status" -eq 1 ]
	[[ "$output" == *"gogh update"* ]]
}

@test "gogh carousel rejects zero delay" {
	GOGH_CACHE="$GOGH_FIXTURE" run gogh carousel 0
	[ "$status" -eq 1 ]
	[[ "$output" == *"positive number"* ]]
}

@test "gogh carousel rejects unknown theme up front" {
	GOGH_CACHE="$GOGH_FIXTURE" run gogh carousel 3 not-a-theme
	[ "$status" -eq 1 ]
	[[ "$output" == *"not-a-theme"* ]]
}

@test "gogh render emits iTerm colors plist" {
	GOGH_CACHE="$GOGH_FIXTURE" run gogh render foo-dark
	[ "$status" -eq 0 ]
	[[ "$output" == *"<plist version=\"1.0\"><dict>"* ]]
	[[ "$output" == *"Ansi 0 Color"* ]]
	[[ "$output" == *"Ansi 15 Color"* ]]
	[[ "$output" == *"Background Color"* ]]
	[[ "$output" == *"Cursor Color"* ]]
}
