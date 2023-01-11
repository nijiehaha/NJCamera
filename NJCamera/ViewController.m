#import "ViewController.h"
#import "lib/NJCamera.h"

@interface ViewController ()

@property (nonatomic, strong) NJCamera *camera;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.camera = [[NJCamera alloc] initWithQuality:AVCaptureSessionPresetPhoto position:NJCameraPositionRear OutputType:NJCameraOutputTypeVideo videoOrientation:(AVCaptureVideoOrientationPortrait) isSupportAutoVideorientation:YES];
    
    [self.camera nj_attachToViewController:self withFrame:self.view.bounds];
    
    [self.camera start];
    
    self.camera.onCapture = ^(NJCamera * _Nonnull camera, UIImage * _Nonnull image) {
        NSLog(@"result:%@", image);
    };
    
}

- (void)viewDidLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    [self.camera changeVideoOrientation:self.view.bounds];
    
}



@end


