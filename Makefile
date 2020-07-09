.PHONY: init
init:
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
