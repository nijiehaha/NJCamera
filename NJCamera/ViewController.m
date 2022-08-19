#import "ViewController.h"
#import "lib/NJCamera.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NJCamera *camera = [[NJCamera alloc] initWithQuality:AVCaptureSessionPresetPhoto position:NJCameraPositionRear OutputType:NJCameraOutputTypeVideo];
    
    [camera nj_attachToViewController:self withFrame:self.view.frame];
    
    [camera start];
    
    camera.onCapture = ^(NJCamera * _Nonnull camera, UIImage * _Nonnull image) {
        NSLog(@"result:%@", image);
    };
    
}


@end
