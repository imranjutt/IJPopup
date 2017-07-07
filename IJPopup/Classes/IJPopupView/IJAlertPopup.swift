//
//  IJAlertPopup.swift
//  Pods
//
//  Created by M Imran on 07/07/2017.
//
//

import UIKit

public class IJAlertPopup: UIView {
    
    
    // MARK: properties
    
    var customView:IJCustomView?
    var callBack: ((_ sender: AnyObject) -> Void)?
    
    
    // MARK: initializer
    
    public init(withTitle:String, message:String, topBarColor:UIColor = UIColor(red:25.0/255.0, green:189.0/255.0, blue:72.0/255.0, alpha:1.0), buttonColor:UIColor = UIColor(red:25.0/255.0, green:189.0/255.0, blue:72.0/255.0, alpha:1.0), completionBlock:@escaping (AnyObject)->Void) {
        
        super.init(frame: CGRect.zero)
        
        self.loadCustomView()
        customView!.titleLabel.text = withTitle
        customView!.messageLabel.text = message
        customView!.okayButton.addTarget(self, action: #selector(hideView(button:)), for: .touchUpInside)
        customView!.okayButton.backgroundColor = buttonColor
        customView!.topBarView.backgroundColor = topBarColor
        self.callBack = completionBlock
        
    }
    
    // MARK: private methods
    
    
    private func loadCustomView() {
        
        customView = Bundle(for: IJAlertPopup.self).loadNibNamed(String(describing: IJCustomView.self), owner: nil, options: nil)?.first as? IJCustomView
        self.addSubview(customView!)
        customView?.translatesAutoresizingMaskIntoConstraints = false
        
        let left = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: customView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: customView, attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0)
        let top = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: customView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: customView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        self.addConstraints([left, right, top, bottom])
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //MARK: public methods
    
    public func showInView(_ superView:UIView) {
        
        self.frame = superView.frame;
        superView.addSubview(self)
        self.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.alpha = 1
        }
    }
    
    func hideView(button:UIButton) {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
        }) { (true) in
            
            self.removeFromSuperview()
            if let completionBlock = self.callBack {
                completionBlock(self)
            }
        }
    }
    
}
