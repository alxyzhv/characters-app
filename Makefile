.PHONY: init
init:
	bundle install --path .bundle
	xattr -d com.apple.quarantine .scripts/*

.PHONY: clean
clean:
	rm -rf DerivedData

.PHONY: swiftlint
swiftlint:
	.scripts/swiftlint/swiftlint

.PHONY: swiftgen
swiftgen:
	.scripts/swiftgen/bin/swiftgen

.PHONY: tests
tests:
	bundle exec fastlane tests

.PHONY: unit-tests
unit-tests:
	bundle exec fastlane unit_tests

.PHONY: ui-tests
ui-tests:
	bundle exec fastlane ui_tests
