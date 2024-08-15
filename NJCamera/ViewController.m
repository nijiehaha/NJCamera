#import "ViewController.h"
#import "lib/NJCamera.h"

@interface ViewController ()

@property (nonatomic, strong) NJCamera *camera;

@property (nonatomic, assign) BOOL isTorchOn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.camera = [[NJCamera alloc] initWithQuality:AVCaptureSessionPresetPhoto position:NJCameraPositionRear OutputType:NJCameraOutputTypePhotoVideo videoOrientation:(AVCaptureVideoOrientationPortrait) isSupportAutoVideorientation:YES];
    
    [self.camera nj_attachToViewController:self withFrame:self.view.bounds];
    
    [self.camera start];
    
    self.camera.onCapture = ^(NJCamera * _Nonnull camera, UIImage * _Nonnull image) {
        NSLog(@"result:%@", image);
    };
        
    UIButton *toggleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [toggleButton setTitle:@"Toggle Torch" forState:UIControlStateNormal];
    [toggleButton addTarget:self action:@selector(toggleTorchButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    toggleButton.frame = CGRectMake(200, 200, 200, 200);
    toggleButton.backgroundColor = [UIColor blueColor];
    toggleButton.center = self.view.center;
    
    [self.view addSubview:toggleButton];
    
}

- (void)toggleTorchButtonTapped {
    self.isTorchOn = !self.isTorchOn;
    [self.camera toggleTorch:self.isTorchOn];
    
    [self.camera startCapturePhotoAction:^(NJCamera * _Nonnull camera, UIImage * _Nonnull image) {
        NSLog(@"-----%@", image);
    }];
}

- (void)viewDidLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.camera changeVideoOrientation:self.view.bounds];
    
}



@end


