
//
//  yjzx.swift
//  Pods
//
//  Created by apple on 2016/11/8.
//
//

class yjzx:CustomTheme{

    
    required init() {}
    
    //弹出窗口作用域
    internal var mainBounds:Bounds{
        let bounds = UIScreen.main.bounds;
        return Bounds(x:bounds.minX,y:bounds.minY,width: bounds.width, height:bounds.height,radius:nil)
    }
    
    
    /****************************颜色区************************/
    // 模版遮罩背景颜色
    internal var maskBackground:UIColor{
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
    }

    // alert背景颜色
    internal var alertBackground:UIColor{
        return UIColor(red: 46/255, green: 49/255, blue: 61/255, alpha: 1)
    }
    
    //默认按钮颜色，背景颜色
    internal var ButtonColor:LazyColor {
        get{
            let color = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1);
            let bacoground =  UIColor(red: 195/255, green: 81/255, blue: 81/255, alpha: 1)
            return LazyColor(color: color, background: bacoground)
        }
    }
    
    //确认按钮颜色，背景颜色
    internal var confirmButtonColor:LazyColor {
        get{
            let color = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1);
            let bacoground =  UIColor(red: 195/255, green: 81/255, blue: 81/255, alpha: 1)
            return LazyColor(color: color, background: bacoground)
        }
    }
    
    //顶部关闭按钮颜色
    internal var closeButtonColor:LazyColor{
        get{
            let color = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1);
            let bacoground =  UIColor(red: 87/255, green: 92/255, blue: 105/255, alpha: 1)
            return LazyColor(color: color, background: bacoground)
        }
    }
    

    
    
    
    /****************************容器区************************/
    
    //alert 容器
    internal var alertBounds:Bounds{
        get{
            var width = self.mainBounds.width - 60
            var height = width/2+20
            var x = self.mainBounds.width/2
            var y = self.mainBounds.height/2
            return Bounds(x:x,y:y,width: width, height: height,radius:5)
        }
    }
    
    // 头部标题位置和颜色信息
    internal var titleOption:LazyOption{
        get{
            let color =  LazyColor(color: UIColor.white, background: UIColor(red: 244/255, green: 200/255, blue: 61/255, alpha: 1));
            let point = Point(x: 15, y: 0)
            let size = Size(width: self.alertBounds.width, height: self.alertBounds.height/4)
            return LazyOption(fontsize: 18, color:color,point:point,size:size)
        }
    }
    
    // 内容容器
    internal var infoOption:LazyOption{
        get{
            let color =  LazyColor(color: UIColor.white, background: UIColor(red: 244/255, green: 200/255, blue: 61/255, alpha: 1));
            let point = Point(x: self.alertBounds.width/2, y: self.alertBounds.height/2 - 5)
            let size = Size(width: self.alertBounds.width*0.8, height: self.alertBounds.height/2 - 10)
            return LazyOption(fontsize: 18, color:color,point:point,size:size)
        }
    }
    
    /****************************按钮区************************/
    
    //默认按钮
    internal var ButtonBounds:Bounds{
        get{
            var x:CGFloat = 5.0
            var height = self.alertBounds.height/3 - 10
            var y = self.alertBounds.height - height - x
            var width = self.alertBounds.width - 2*x
            return Bounds(x: x, y: y, width: width, height: height, radius: 5)
        }
    }
    
    //确认按钮
    internal var confirmButtonBounds:Bounds{
        get{
            var x:CGFloat = 5.0
            var height = self.alertBounds.height/3 - 10
            var y = self.alertBounds.height - height - x
            var width = self.alertBounds.width - 2*x
            return Bounds(x: x, y: y, width: width, height: height, radius: 5)
        }
    }
    
    // 顶部关闭按钮样式
    internal var closeButtonBounds:Bounds{
        get{
            var x:CGFloat = 5.0
            var height = self.alertBounds.height/3
            var y = self.alertBounds.height - height - x
            var width = self.alertBounds.width - 2*x
            return Bounds(x: x, y: y, width: width, height: height, radius: 5)
        }
    }
    
     // 取消按钮样式
    internal var cancelButtonBounds:Bounds {
        get{
            var x:CGFloat = 5.0
            var height = self.alertBounds.height/3
            var y = self.alertBounds.height - height - x
            var width = self.alertBounds.width - 2*x
            return Bounds(x: x, y: y, width: width, height: height, radius: 5)
        }
    }
    
}
