import Foundation
import UIKit

public protocol IRequestPerfomer {

    /// Выполнить запрос
    func perform<Model, Parser: IParser>(
        _ request: Request,
        use parser: Parser,
        completion: @escaping (Result<Model, Error>) -> Void
    ) where Model == Parser.Model
}
