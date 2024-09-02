import Foundation
import SourceryRuntime
import SwiftSyntax

extension GenericType {
    convenience init(name: String, node: GenericArgumentClauseSyntax) {
        let parameters = node.arguments.map { argument in
            GenericTypeParameter(typeName: TypeName(argument.argumentType))
        }

        self.init(name: name, typeParameters: parameters)
    }

    convenience init(name: String, node: GenericParameterClauseSyntax) {
        let parameters = node.genericParameterList.map { parameter in
            GenericTypeParameter(typeName: TypeName(name: parameter.sourcerySafeTypeIdentifier))
        }

        self.init(name: name, typeParameters: parameters)
    }
}
