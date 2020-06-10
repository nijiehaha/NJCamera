#import "ViewController.h"
#import "lib/NJCamera.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NJCamera *camera = [[NJCamera alloc] initWithQuality:AVCaptureSessionPresetPhoto position:NJCameraPositionRear OutputType:NJCameraOutputTypPhoto];
    
    [camera nj_attachToViewController:self withFrame:self.view.frame];
    
    [camera start];
    
}


@end
