//
//  ViewController2.m
//  QrcodeDemo
//
//  Created by Jason on 15/1/26.
//  Copyright (c) 2015年 ___KKEYE___. All rights reserved.
//

#import "ViewController2.h"
#import <AVFoundation/AVFoundation.h>


#define ScreenHigh [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController2 ()<AVCaptureMetadataOutputObjectsDelegate>
@property ( strong , nonatomic ) AVCaptureDevice * device;
@property ( strong , nonatomic ) AVCaptureDeviceInput * input;
@property ( strong , nonatomic ) AVCaptureMetadataOutput * output;
@property ( strong , nonatomic ) AVCaptureSession * session;
@property ( strong , nonatomic ) AVCaptureVideoPreviewLayer * preview;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self action];
    [ _output setRectOfInterest : CGRectMake (( 124 )/ ScreenHigh ,(( ScreenWidth - 220 )/ 2 )/ ScreenWidth , 220 / ScreenHigh , 220 / ScreenWidth )];
    
}

-(void)action
{
//    下面分别创建他们
    // Device
    _device = [ AVCaptureDevice defaultDeviceWithMediaType : AVMediaTypeVideo ];
    // Input
    _input = [ AVCaptureDeviceInput deviceInputWithDevice : self . device error : nil ];
    // Output
    _output = [[ AVCaptureMetadataOutput alloc ] init ];
    [ _output setMetadataObjectsDelegate : self queue : dispatch_get_main_queue ()];
    
    // Session
    _session = [[ AVCaptureSession alloc ] init ];
    [ _session setSessionPreset : AVCaptureSessionPresetHigh ];
    if ([ _session canAddInput : self . input ])
    {
        [ _session addInput : self . input ];
    }
    if ([ _session canAddOutput : self . output ])
    {
        [ _session addOutput : self . output ];
    }
    // 条码类型 AVMetadataObjectTypeQRCode
    _output . metadataObjectTypes = @[ AVMetadataObjectTypeQRCode ] ;
    // Preview
    _preview =[ AVCaptureVideoPreviewLayer layerWithSession : _session ];
    _preview . videoGravity = AVLayerVideoGravityResizeAspectFill ;
    _preview . frame = self . view . layer . bounds ;
    [ self . view . layer insertSublayer : _preview atIndex : 0 ];
    // Start
    [ _session startRunning ];
}

#pragma mark AVCaptureMetadataOutputObjectsDelegate
- ( void )captureOutput:( AVCaptureOutput *)captureOutput didOutputMetadataObjects:( NSArray *)metadataObjects fromConnection:( AVCaptureConnection *)connection
{
    NSString *stringValue;
    if ([metadataObjects count ] > 0 )
    {
        // 停止扫描
        [ _session stopRunning ];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex : 0 ];
        stringValue = metadataObject. stringValue ;
        NSLog(@"%@",stringValue);
    }
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
