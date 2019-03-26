//
//  LCTCustomView.m
//  ViewTestProgect
//
//  Created by Павел Нехорошкин on 16.03.2019.
//  Copyright © 2019 Павел Нехорошкин. All rights reserved.
//

#import "LCTCustomView.h"


//реализуем интерфейс UIResponder (родитель UIView) ,
//чтобы объект класса мог получать события
//о нажатии экрана в месте разсмещения объекта
@implementation LCTCustomView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)even{
    UITouch * touch = touches.anyObject;
    CGPoint  point = [touch locationInView:self];
//    NSLog(@"Касание %.0f %.0f", point.x, point.y);
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
    {
    UITouch * touch = touches.anyObject;
    CGPoint  point = [touch locationInView:self];
//    NSLog(@"Перетаскивание %.0f %.0f", point.x, point.y);
        
        point.x =  point.x +  self.frame.origin.x;
        if (point.x < 0) {point.x = 0;}
        if (point.x > CGRectGetMaxX(self.frame)) {point.x = CGRectGetMaxX(self.frame);}
        
        point.y =  point.y +  self.frame.origin.y;
        if (point.y < 0) {point.y = 0;}
        if (point.y > CGRectGetMaxY(self.frame)) {point.x = CGRectGetMaxY(self.frame);}
        self.center = point;
        NSLog(@" %.0f %.0f", point.x, point.y);

}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = touches.anyObject;
    CGPoint  point = [touch locationInView:self];
//    NSLog(@"Конец %.0f %.0f", point.x, point.y);
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)even{
//    NSLog(@"Касание отменено");
}


/*
 
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
