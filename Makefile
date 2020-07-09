.PHONY: init # Запускает инициализацию проекта
init:
	bundle install --path .bundle
	xattr -d com.apple.quarantine .scripts/*

.PHONY: clean # Удаляет DerivedData
clean:
	rm -rf DerivedData

.PHONY: swiftlint # Запускает swiftlint
swiftlint:
	.scripts/swiftlint/swiftlint

.PHONY: swiftgen # Запускает swiftgen
swiftgen:
	.scripts/swiftgen/bin/swiftgen

.PHONY: tests # Запускает тесты с помощью fastlane
tests:
	bundle exec fastlane tests

.PHONY: unit-tests # Запускает unit-тесты с помощью fastlane
unit-tests:
	bundle exec fastlane unit_tests

.PHONY: ui-tests # Запускает ui-тесты с помощью fastlane
ui-tests:
	bundle exec fastlane ui_tests

.PHONY: help # Выводит список доступных команд
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1	\2/' | expand -t20
