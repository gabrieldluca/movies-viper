protocol ViewRender: class {
    func setUp()
    func addConstraints()
    func addViewHierarchy()
}

extension ViewRender {
    func setUp() {
        addViewHierarchy()
        addConstraints()
    }
}
