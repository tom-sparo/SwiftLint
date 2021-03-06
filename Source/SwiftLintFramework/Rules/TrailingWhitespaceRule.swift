//
//  TrailingWhitespaceRule.swift
//  SwiftLint
//
//  Created by JP Simard on 2015-05-16.
//  Copyright (c) 2015 Realm. All rights reserved.
//

import SourceKittenFramework

public struct TrailingWhitespaceRule: Rule {
    public init() {}

    public let identifier = "trailing_whitespace"

    public func validateFile(file: File) -> [StyleViolation] {
        return file.lines.filter {
            $0.content.hasTrailingWhitespace()
        }.map {
            StyleViolation(type: .TrailingWhitespace,
                location: Location(file: file.path, line: $0.index),
                severity: .Warning,
                reason: "Line #\($0.index) should have no trailing whitespace")
        }
    }

    public let example = RuleExample(
        ruleName: "Trailing Whitespace Rule",
        ruleDescription: "This rule checks whether you don't have any trailing whitespace.",
        nonTriggeringExamples: [ "//\n" ],
        triggeringExamples: [ "// \n" ],
        showExamples: false
    )
}
