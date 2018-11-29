//
//  UIImageExtension.swift
//  zeroEn
//
//  Created by sbc on 2018/11/19.
//  Copyright © 2018年 cpi. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
//    //水印位置枚举
//    enum WaterMarkCorner{
//        case TopLeft
//        case TopRight
//        case BottomLeft
//        case BottomRight
//    }
//    //添加图片水印方法
//    func waterMarkedImage(waterMarkImage:UIImage, corner:WaterMarkCorner = .BottomRight,
//                          margin:CGPoint = CGPoint(x: 20, y: 20), alpha:CGFloat = 1) -> UIImage{
//
//        var markFrame = CGRect.init(x:0, y:0, width:waterMarkImage.size.width, height:waterMarkImage.size.height)
//        let imageSize = self.size
//
//        switch corner{
//        case .TopLeft:
//            markFrame.origin = margin
//        case .TopRight:
//            markFrame.origin = CGPoint(x: imageSize.width - waterMarkImage.size.width - margin.x,
//                                       y: margin.y)
//        case .BottomLeft:
//            markFrame.origin = CGPoint(x: margin.x,
//                                       y: imageSize.height - waterMarkImage.size.height - margin.y)
//        case .BottomRight:
//            markFrame.origin = CGPoint(x: imageSize.width - waterMarkImage.size.width - margin.x,
//                                       y: imageSize.height - waterMarkImage.size.height - margin.y)
//        }
//
//        // 开始给图片添加图片
//        UIGraphicsBeginImageContext(imageSize)
//        self.draw(in:CGRect(x:0, y:0, width:imageSize.width, height:imageSize.height))
//        waterMarkImage.draw(markFrame, blendMode: .Normal, alpha: alpha)
//        let waterMarkedImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        return waterMarkedImage
//    }
    func drawTextInImage(image : UIImage, width : CGFloat, height : CGFloat)-> UIImage!{
        // 改行して２行で表示
        let text = "sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp sharp"
        
        let font = UIFont.boldSystemFont(ofSize: 20)
        
        // 描画領域を生成
        let rect = CGRect(x:0, y:0, width:width, height:height)
        
        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        // Context 開始
        // 一番大きい画像サイズでContextを開く
        UIGraphicsBeginImageContext(image.size)
        print("image width:",image.size.width,"/image height:",image.size.height)
        // Retinaで画像が粗い場合
        //UIGraphicsBeginImageContextWithOptions(imageEmmy.size, false, 0)
        
        // EmmyをUIImageのdrawInRectメソッドでレンダリング
        image.draw(in: rect)
        
        // テキストの描画領域
        let textRect  = CGRect(x:0, y:0, width:width, height:height)
        
        let textStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        
        let textFontAttributes = [
            NSAttributedStringKey.font: font,
            NSAttributedStringKey.foregroundColor: UIColor.gray,
            NSAttributedStringKey.paragraphStyle: textStyle
        ]
        
        // テキストをdrawInRectメソッドでレンダリング
        text.draw(in: textRect, withAttributes: textFontAttributes)
        
        // Context に描画された画像を新しく設定
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // Context 終了
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /*
     画像をResizeするクラスメソッド.
     */
    class func ResizeUIImage(image : UIImage, width : CGFloat, height : CGFloat)-> UIImage!{
        
        // 指定された画像の大きさのコンテキストを用意.
        UIGraphicsBeginImageContext(image.size)

        // コンテキストに画像を描画する.
        image.draw(in:CGRect(x: 0, y: 28, width: width, height: height))
        
        // コンテキストからUIImageを作る.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // コンテキストを閉じる.
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /*
     画像を合成するクラスメソッド.
     */
    class func ComposeUIImage(UIImageArray : [UIImage], width: CGFloat, height : CGFloat)->UIImage!{
        
        // 指定された画像の大きさのコンテキストを用意.
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        
        // UIImageのある分回す.
        for image : UIImage in UIImageArray {
            
            // コンテキストに画像を描画する.
            image.draw(in:CGRect.init(x:0, y:0,width:image.size.width, height:image.size.height))
        }
        
        // コンテキストからUIImageを作る.
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // コンテキストを閉じる.
        UIGraphicsEndImageContext()
        
        return newImage
    }

    
    func synthesizeImage(UIImageArray : [UIImage], size: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
        for image : UIImage in UIImageArray {
            image.draw(in:CGRect.init(x:0, y:0, width:image.size.width, height:image.size.height))
        }
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage!
    }
}
