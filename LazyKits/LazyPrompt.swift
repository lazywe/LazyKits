//
//  Pods
//
//  Created by apple on 2016/11/8.
//
//
import UIKit
public class LazyPrompt{

    
    //
    // window对象
    //
    let window: UIWindow = UIApplication.shared.keyWindow!
    var mainview = UIView();
    let debug = true
    // 默认主题
    var theme = "yjzx"
    var confirmAction:((_ e:UIButton) -> Void)? = nil
    var closeAction:((_ e:UIButton) -> Void)? = nil
    
    //
    // 遮罩
    //
    fileprivate func showMask() -> UIView{
        let maskview = UIView();
        maskview.frame = UIScreen.main.bounds
        maskview.backgroundColor = self.lazyTheme.maskBackground
        self.window.addSubview(maskview)
        return maskview
    }
    
    
    //
    // 视图创建
    //
     fileprivate func views() -> UIView{
        let view = UIView();
        let bounds = self.lazyTheme.alertBounds
        view.frame.size = CGSize(width: bounds.width, height: bounds.height)
        view.center = CGPoint(x:bounds.x,y:bounds.y)
        //圆角
        if let radius = self.lazyTheme.alertBounds.radius {
            view.layer.cornerRadius = radius
        }
        
        view.backgroundColor = self.lazyTheme.alertBackground
        return view
    }
    
    //
    // 创建按钮
    //
    fileprivate func button(subtitle:String,view:UIView) -> UIButton{
        let Button = UIButton();
        let bounds = self.lazyTheme.confirmButtonBounds
        let color  = self.lazyTheme.ButtonColor
        Button.frame = CGRect(x: bounds.x , y: bounds.y, width: bounds.width, height: bounds.height)
        Button.backgroundColor = color.background
        Button.setTitleColor(color.color, for: .normal)
        Button.setTitle(subtitle, for: .normal)
        Button.addTarget(self, action: #selector(triggerConfirmMethod(_ :)), for: .touchUpInside)
        //圆角
        if let radius = bounds.radius {
            Button.layer.cornerRadius = radius
        }
        view.addSubview(Button)
        return Button
    }
    
    // 头部信息
    fileprivate func title(subtitle:String,view:UIView){
        
        
        let option = self.lazyTheme.titleOption
        //头部view
        let titleview = UIView();
        titleview.frame = CGRect(x: 0, y: 0, width: (option.size?.width)!, height: (option.size?.height)!)
        
        //头部label
        let label = UILabel()
        label.sizeToFit()
        label.frame = CGRect(x: (option.point?.x)!, y: (option.point?.y)!, width: (titleview.frame.width - titleview.frame.height - (option.point?.x)!), height: titleview.frame.height)
        label.text = subtitle
        label.textColor = option.color.color
        label.font = UIFont.systemFont(ofSize: option.fontsize)
        titleview.addSubview(label)
        
        //头部下边框
        let layer:CALayer = CALayer()
        layer.backgroundColor = UIColor(red: 56/255, green: 59/255, blue: 73/255, alpha: 1).cgColor
        let size:CGFloat = 1.0;
        layer.frame = CGRect(x:0, y:titleview.frame.height - size, width:titleview.frame.width, height:size)
        titleview.layer.addSublayer(layer)
        
        //关闭按钮
        let closeButton = UIButton();
        let closeButtonMargin:CGFloat = 3
        let closeButtonWidth = titleview.frame.height - (2 * closeButtonMargin);
        let closeButtonHeight = titleview.frame.height - (2 * closeButtonMargin);
        closeButton.addTarget(self, action: #selector(triggerCloseMethod(_ :)), for: .touchUpInside)
        
        closeButton.frame = CGRect(x: (titleview.frame.width - closeButtonWidth - closeButtonMargin), y: closeButtonMargin, width: closeButtonWidth, height: closeButtonHeight)
        closeButton.setTitle("X", for: .normal)
        closeButton.setTitleColor(self.lazyTheme.closeButtonColor.color, for: .normal)
        closeButton.backgroundColor = self.lazyTheme.closeButtonColor.background
        closeButton.layer.cornerRadius = closeButtonWidth / 2
        titleview.addSubview(closeButton)
        
        //插入头部视图
        view.addSubview(titleview)
        
        
    }
    
    //
    // 确认
    //
    @objc fileprivate func triggerConfirmMethod(_ btn:UIButton){
        if debug == true{
            NSLog("点击了确认")
        }
        self.mainview.removeFromSuperview()
        if self.confirmAction != nil {
            self.confirmAction!(btn)
        }
    }
    
    
    //
    // 取消
    //
    @objc fileprivate func triggerCloseMethod(_ btn:UIButton){
        if debug == true{
             NSLog("点击了关闭")
        }
        self.mainview.removeFromSuperview()
        if self.closeAction != nil {
            self.closeAction!(btn)
        }
    }
    
    //
    // 内容区域
    //
    fileprivate func info(info:String,view:UIView){
        let option = self.lazyTheme.infoOption
        let label = UILabel();
        label.frame.size = CGSize(width: (option.size?.width)!, height: (option.size?.height)!)
        label.center = CGPoint(x: (option.point?.x)!, y: (option.point?.y)!)
        
        label.text = info
        label.textAlignment = .center
        label.textColor = option.color.color
        label.font = UIFont.systemFont(ofSize: option.fontsize)
        label.numberOfLines = 2;
        view.addSubview(label)
    }
    
    //
    // 内容input
    //
    fileprivate func infoInput(info:String,view:UIView){
        let option = self.lazyTheme.infoOption
        let label = UILabel();
        label.frame.size = CGSize(width: (option.size?.width)!, height: (option.size?.height)!)
        label.center = CGPoint(x: (option.point?.x)!, y: (option.point?.y)!)
        
        label.text = info
        label.textAlignment = .center
        label.textColor = option.color.color
        label.font = UIFont.systemFont(ofSize: option.fontsize)
        label.numberOfLines = 2;
        view.addSubview(label)
    }
    
    //
    // 单利访问
    //
    public class var getInstance: LazyPrompt {
        get {
            struct SingletonStruct {
                static let singleton: LazyPrompt = LazyPrompt()
            }
            return SingletonStruct.singleton
        }
    }
    
    
    //
    // 动态加载模版
    //
   fileprivate var lazyTheme:CustomTheme{
        let CustomTheme = NSClassFromString("LazyKits."+theme) as! CustomTheme.Type
        return CustomTheme.init()
   }

    //
    // 默认弹出
    //
    fileprivate func alert(_ title: String,info:String){
        self.mainview = self.showMask()
        //展示view
        let mainview = self.views()
        self.mainview.addSubview(mainview)
        //确认按钮
        let button = self.button(subtitle:"确 认",view: mainview)
        //头部信息
        self.title(subtitle: title, view: mainview)
        //提示信息
        self.info(info: info, view: mainview)
        
        self.window.addSubview(self.mainview)
        self.window.bringSubview(toFront: self.mainview)
    }
    
    
    //
    // 默认提示框
    //
    fileprivate func confirm(title:String,info:String){
        self.mainview = self.showMask()
        //展示view
        let mainview = self.views()
        self.mainview.addSubview(mainview)
        //确认按钮
        self.confirmButton(subtitle:"确认",view: mainview)
        //确认按钮
        self.cancelButton(subtitle:"取消",view: mainview)
        //头部信息
        self.title(subtitle: title, view: mainview)
        //提示信息
        self.infoInput(info: info, view: mainview)
        
        self.window.addSubview(self.mainview)
        self.window.bringSubview(toFront: self.mainview)
    }

}

// 扩展弹出
extension LazyPrompt {
    
    //
    // 无提示弹出框
    //
    public func alert(title:String,info:String){
        self.confirmAction  = nil
        self.alert(title, info: info)
    }
    
    //
    // 有提示弹出框
    //
    public func alert(title:String,info:String,ok:@escaping (_ e:UIButton) -> Void){
        self.confirmAction  = ok
        self.alert(title, info: info)
    }
    
}


// 扩展confirm
extension LazyPrompt {
    
    //
    // 创建按钮
    //
    fileprivate func confirmButton(subtitle:String,view:UIView){
        let Button = UIButton();
        let bounds = self.lazyTheme.confirmButtonBounds
        let color  = self.lazyTheme.ButtonColor
        Button.frame = CGRect(x: bounds.x , y: bounds.y, width: bounds.width / 2 - 5, height: bounds.height)
        Button.backgroundColor = color.background
        Button.setTitleColor(color.color, for: .normal)
        Button.setTitle(subtitle, for: .normal)
        Button.addTarget(self, action: #selector(triggerConfirmMethod(_ :)), for: .touchUpInside)
        //圆角
        if let radius = bounds.radius {
            Button.layer.cornerRadius = radius
        }
        view.addSubview(Button)
    }
    
    //
    // 创建按钮
    //
    fileprivate func cancelButton(subtitle:String,view:UIView){
        let Button = UIButton();
        let bounds = self.lazyTheme.confirmButtonBounds
        let color  = self.lazyTheme.ButtonColor
        Button.frame = CGRect(x: bounds.width/2 + 10  , y: bounds.y, width: bounds.width / 2 - 5, height: bounds.height)
        Button.backgroundColor = color.background
        Button.setTitleColor(color.color, for: .normal)
        Button.setTitle(subtitle, for: .normal)
        Button.addTarget(self, action: #selector(triggerCloseMethod(_ :)), for: .touchUpInside)
        //圆角
        if let radius = bounds.radius {
            Button.layer.cornerRadius = radius
        }
        view.addSubview(Button)
    }
    
    //
    // 自定义确认函数和取消函数
    //
    public func confirm(title:String,info:String,ok:@escaping (_ e:UIButton) -> Void,cancel:@escaping (_ e:UIButton) -> Void){
        self.confirmAction  = ok
        self.closeAction  = cancel
        self.confirm(title: title, info: info)
    }
    
    
    //
    // 自定义确认函数
    //
    public func confirm(title:String,info:String,ok:@escaping (_ e:UIButton) -> Void){
        self.confirmAction  = ok
        self.closeAction  = nil
        self.confirm(title: title, info: info)
    }
    
    //
    // 自定义取消函数
    //
    public func confirm(title:String,info:String,cancel:@escaping (_ e:UIButton) -> Void){
        self.confirmAction  = nil
        self.closeAction  = cancel
        self.confirm(title: title, info: info)
    }
    
}
