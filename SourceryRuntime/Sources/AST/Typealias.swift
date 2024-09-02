import Foundation

// sourcery: skipJSExport
/// :nodoc:
@objcMembers public final class Typealias: NSObject, Typed, SourceryModel {
    // New typealias name
    public var aliasName: String {
        aliasTypeName.name
    }

    // New typealias name
    public let aliasTypeName: TypeName

    // Target name
    public let typeName: TypeName

    // sourcery: skipEquality, skipDescription
    public var type: Type?

    /// module in which this typealias was declared
    public var module: String?

    // sourcery: skipEquality, skipDescription
    public var parent: Type? {
        didSet {
            parentName = parent?.name
        }
    }

    /// Type access level, i.e. `internal`, `private`, `fileprivate`, `public`, `open`
    public let accessLevel: String

    var parentName: String?

    public var name: String {
        if let parentName = parent?.name {
            return "\(module != nil ? "\(module!)." : "")\(parentName).\(aliasName)"
        } else {
            return "\(module != nil ? "\(module!)." : "")\(aliasName)"
        }
    }

    public init(aliasTypeName: TypeName, typeName: TypeName, accessLevel: AccessLevel = .internal, parent: Type? = nil, module: String? = nil) {
        self.aliasTypeName = aliasTypeName
        self.typeName = typeName
        self.accessLevel = accessLevel.rawValue
        self.parent = parent
        self.parentName = parent?.name
        self.module = module
    }

    public convenience init(aliasName: String = "", typeName: TypeName, accessLevel: AccessLevel = .internal, parent: Type? = nil, module: String? = nil) {
        self.init(
            aliasTypeName: TypeName(name: aliasName),
            typeName: typeName,
            accessLevel: accessLevel,
            parent: parent,
            module: module
        )
    }

// sourcery:inline:Typealias.AutoCoding

        /// :nodoc:
        required public init?(coder aDecoder: NSCoder) {
            guard let aliasTypeName: TypeName = aDecoder.decode(forKey: "aliasTypeName") else { NSException.raise(NSExceptionName.parseErrorException, format: "Key '%@' not found.", arguments: getVaList(["aliasName"])); fatalError() }; self.aliasTypeName = aliasTypeName
            guard let typeName: TypeName = aDecoder.decode(forKey: "typeName") else { NSException.raise(NSExceptionName.parseErrorException, format: "Key '%@' not found.", arguments: getVaList(["typeName"])); fatalError() }; self.typeName = typeName
            self.type = aDecoder.decode(forKey: "type")
            self.module = aDecoder.decode(forKey: "module")
            self.parent = aDecoder.decode(forKey: "parent")
            guard let accessLevel: String = aDecoder.decode(forKey: "accessLevel") else { NSException.raise(NSExceptionName.parseErrorException, format: "Key '%@' not found.", arguments: getVaList(["accessLevel"])); fatalError() }; self.accessLevel = accessLevel
            self.parentName = aDecoder.decode(forKey: "parentName")
        }

        /// :nodoc:
        public func encode(with aCoder: NSCoder) {
            aCoder.encode(self.aliasTypeName, forKey: "aliasTypeName")
            aCoder.encode(self.typeName, forKey: "typeName")
            aCoder.encode(self.type, forKey: "type")
            aCoder.encode(self.module, forKey: "module")
            aCoder.encode(self.parent, forKey: "parent")
            aCoder.encode(self.accessLevel, forKey: "accessLevel")
            aCoder.encode(self.parentName, forKey: "parentName")
        }
// sourcery:end
}
