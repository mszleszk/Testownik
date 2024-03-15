// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum AddTest {
    /// Dodaj folder
    internal static let addFolder = L10n.tr("Localizable", "addTest.addFolder", fallback: "Dodaj folder")
    /// Wpisz nazwę
    internal static let inputName = L10n.tr("Localizable", "addTest.inputName", fallback: "Wpisz nazwę")
    internal enum Error {
      /// Dodaj emoji dla testu
      internal static let noEmoji = L10n.tr("Localizable", "addTest.error.noEmoji", fallback: "Dodaj emoji dla testu")
      /// Dodaj folder z bazą
      internal static let noFolder = L10n.tr("Localizable", "addTest.error.noFolder", fallback: "Dodaj folder z bazą")
      /// Wprowadź nazwę dla testu
      internal static let noName = L10n.tr("Localizable", "addTest.error.noName", fallback: "Wprowadź nazwę dla testu")
    }
  }
  internal enum General {
    /// Localizable.strings
    ///   Testownik
    /// 
    ///   Created by Michał Szleszkowski on 03/01/2024.
    internal static let appname = L10n.tr("Localizable", "general.appname", fallback: "testownik")
    /// Anuluj
    internal static let cancel = L10n.tr("Localizable", "general.cancel", fallback: "Anuluj")
    /// Delete
    internal static let delete = L10n.tr("Localizable", "general.delete", fallback: "Delete")
    /// Gotowe
    internal static let done = L10n.tr("Localizable", "general.done", fallback: "Gotowe")
    /// Coś poszło nie tak!
    internal static let somethingWentWrong = L10n.tr("Localizable", "general.somethingWentWrong", fallback: "Coś poszło nie tak!")
  }
  internal enum Tests {
    /// Dodaj test
    internal static let addTest = L10n.tr("Localizable", "tests.addTest", fallback: "Dodaj test")
    /// %d pytań
    internal static func numberOfQuestions(_ p1: Int) -> String {
      return L10n.tr("Localizable", "tests.number of questions", p1, fallback: "%d pytań")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
