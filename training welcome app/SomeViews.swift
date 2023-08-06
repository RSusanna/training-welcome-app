
import UIKit


final class SomeViews: UIView {
    
    private let firstView: UIView = {
        let view  = UIView()
        view.backgroundColor = .red
        return view
    }()
    private let secondView: UIView = {
        let view  = UIView()
        view.backgroundColor = .blue
        return view
    }()
    private let thirdView: UIView = {
        let view  = UIView()
        view.backgroundColor = .green
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .brown
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .darkGray
        makeLayout()
        addSubview()
    }
}

private extension SomeViews {
    func  addSubview() {
        [firstView, secondView, thirdView].forEach({self.addSubview($0) })
    }
    func makeLayout() {
        let high = self.frame.height / 3
        let widht = self.frame.width
        
        firstView.frame = CGRect(x: 0, y: 0, width: widht, height: high)
        secondView.frame = CGRect(x: 0, y: high, width: widht, height: high)
        thirdView.frame = CGRect(x: 0, y: high * 2, width: widht, height: high)

    }
    
}
