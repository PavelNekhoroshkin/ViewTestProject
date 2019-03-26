//
//  ViewController.m
//  ViewTestProgect
//
//  Created by Павел Нехорошкин on 16.03.2019.
//  Copyright © 2019 Павел Нехорошкин. All rights reserved.
//

#import "ViewController.h"
#import "LCTCustomView.h"


@interface ViewController ()
@property (nonatomic, strong) LCTCustomView* customView;
@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@" --- View загружено --- ");

    [self prepareUI];
    
}



//подготовка интерфейса
- (void) prepareUI
{
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *buttonDeleteView = [UIButton buttonWithType:UIButtonTypeCustom];
    
    buttonDeleteView.frame = CGRectMake(10,20,310,40);
    
    buttonDeleteView.backgroundColor = [UIColor blueColor] ;
    
    [buttonDeleteView setTitle:@"Удалить UIView у rootViewController" forState:UIControlStateNormal];
    
    [buttonDeleteView addTarget:self action:@selector(deleteView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonDeleteView];
    self.view.backgroundColor = UIColor.cyanColor;
    
    
//    Создаем объект кастомного класса, реализующего интерфейс UIResponder
//    и способного обработать события нажатия экрана
    self.customView = [[LCTCustomView alloc] initWithFrame:CGRectMake(50,60,60,70)];
    self.customView.backgroundColor = UIColor.redColor;
    
    [self.view addSubview:self.customView];
    [self.view addSubview:buttonDeleteView];

    
//    красный квадрат на экране получает события о нажатии и перетягивании
//    центра квадрата двигается за точкой касания.

}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    NSLog(@"View появится");


}
-(void) viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    NSLog(@" --- View появилось --- ");
    
}

-(void) viewWillDisppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    NSLog(@" --- View будет убрано --- ");
    
}
-(void) viewDidDisappear:(BOOL)animated{
    [super viewWillAppear:animated];
//    NSLog(@" --- View убралось --- ");
    
}

-(void)deleteView  {
//    NSLog(@" --- Нажата кнопка --- ");
    
    self.view = nil;
    
    NSLog(@" --- Удалили self.view --- ");

//    Чтобы было можно повторно загрузить view, нужно в storyboard прописать ViewController
//    и назначить Storyboard ID, например как тут - MainStoriboard
//    затем создать новый контроллер, загрузить ему UIView по имени  - Main,
//    и указать с какой Storyboard ID связать контроллер
    UIViewController *viewController =
        [[UIStoryboard storyboardWithName:@"Main"bundle:NULL] instantiateViewControllerWithIdentifier:@"MainStoriboard"];
    
//после того как контроллер создан нужно его назначить корневым контроллером для главного окна приложения
    [[UIApplication sharedApplication].keyWindow setRootViewController:viewController];
//    NSLog(@" --- Новый контроллер назначен корневым для главного окна приложения --- ");
 
}
     

     
@end

//Домашнее задание
//сделать кнопку, которая будет тригерить повторный вызов viewDidLoad (view нужно сначала занилить, потом обратиться к той же вьюхе снова???)
