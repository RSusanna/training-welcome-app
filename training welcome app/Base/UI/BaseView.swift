import UIKit

class BaseView: UIView {
    
    func createMainButton(title: String,
                          titleColor: UIColor,
                          font: UIFont,
                          backgroundColor: UIColor,
                          radius: CGFloat = 8) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = font
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = radius
        return button
    }
    
    func createImageButton(imageName: String, borderColor: UIColor, radius: CGFloat = 8) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = borderColor.cgColor
        button.layer.cornerRadius = radius
        return button
    }
    
    func toStackView(subviews: [UIView],
                     axis: NSLayoutConstraint.Axis, spacing: CGFloat,
                     alignment: UIStackView.Alignment,
                     distribution: UIStackView.Distribution) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.axis = axis
        stack.spacing = spacing
        stack.alignment = alignment
        stack.distribution = distribution
        return stack
    }
}
