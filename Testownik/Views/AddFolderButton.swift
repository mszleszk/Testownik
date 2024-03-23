import UIKit

final class AddFolderButton: UIButton {
    private let cornerRadius: CGFloat = 20
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawBorder()
    }
    
    func setAsFolderAdded(withFolderName folderName: String) {
        configuration = makeFolderAddedConfiguration(withTitle: folderName)
    }
    
    private func setup() {
        configuration = makeAddFolderConfiguration()
        
        configurationUpdateHandler = { button in
            var config = button.configuration
            config?.background.backgroundColor = button.isHighlighted ? UIColor.black.withAlphaComponent(0.2) : .clear
            button.configuration = config
        }
    }
    
    private func makeFolderAddedConfiguration(withTitle title: String) -> UIButton.Configuration {
        guard var buttonConfig = configuration else { return makeAddFolderConfiguration() }
        
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 50)
        let imageConfig = UIImage.SymbolConfiguration(hierarchicalColor: Asset.Colors.systemGray.color).applying(sizeConfig)
        buttonConfig.image = UIImage(systemName: "folder.fill", withConfiguration: imageConfig)
        buttonConfig.imagePlacement = .top
        
        var attributedTitle = AttributedString(title)
        attributedTitle.font = UIFont.systemFont(ofSize: K.Text.secondaryTextSize, weight: .medium)
        attributedTitle.foregroundColor = Asset.Colors.primaryText.color
        buttonConfig.attributedTitle = attributedTitle
        
        return buttonConfig
    }
    
    private func makeAddFolderConfiguration() -> UIButton.Configuration {
        var buttonConfig = UIButton.Configuration.plain()
        
        let imageConfig = UIImage.SymbolConfiguration(paletteColors: [Asset.Colors.primaryText.color, Asset.Colors.systemBlue.color])
        buttonConfig.image = UIImage(systemName: "plus.circle.fill", withConfiguration: imageConfig)
        
        var attributedTitle = AttributedString(L10n.AddTest.addFolder)
        attributedTitle.font = UIFont.systemFont(ofSize: K.Text.primaryTextSize, weight: .bold)
        attributedTitle.foregroundColor =  Asset.Colors.primaryText.color
        buttonConfig.attributedTitle = attributedTitle
        
        buttonConfig.background.cornerRadius = cornerRadius
        buttonConfig.imagePadding = 5
        
        return buttonConfig
    }
    
    private func drawBorder() {
        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = 3
        dashBorder.strokeColor = Asset.Colors.systemGray.color.cgColor
        dashBorder.lineDashPattern = [6, 3] as [NSNumber]
        dashBorder.frame = bounds
        dashBorder.fillColor = nil
        dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.addSublayer(dashBorder)
    }
}
