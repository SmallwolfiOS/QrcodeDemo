//
//  ViewController3.m
//  QrcodeDemo
//
//  Created by Jason on 15/4/7.
//  Copyright (c) 2015年 ___KKEYE___. All rights reserved.
//

#import "ViewController3.h"
#import "QRCodeGenerator.h"
@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage * image =[QRCodeGenerator qrImageForString:@"123" imageSize:200];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.center = self.view.center;
    imageView.image = image;
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
