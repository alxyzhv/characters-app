.PHONY: init # Запускает установку зависимостей и генерацию проектного файла
init: deps project

.PHONY: deps # Устанавливает и подготавливает зависимости для работы проекта
deps:
	bundle install
	-xattr -rd com.apple.quarantine .scripts

.PHONY: project # Генерирует .xcodeproj с помощью xcodegen
project:
	.scripts/xcodegen/bin/xcodegen

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
