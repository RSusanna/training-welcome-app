import UIKit

//  подписала эту вью на нашу базовую вью и на протокол покажи новую вью
final class RegisterView: BaseView {
    
    weak var delegate: ShowNewViewProtocol?
    
    
    private lazy var backgroundImage: UIImageView = {
        let logoImage = createImageView(imageName: "background")
        return logoImage
    }()
    
}
