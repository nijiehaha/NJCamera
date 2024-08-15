#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum: NSUInteger {
    
    NJCameraOutputTypPhoto, // 照片输出
    NJCameraOutputTypeQRCode, // 二维码
    NJCameraOutputTypeVideo,  // 实时视频流
    
    NJCameraOutputTypePhotoVideo // 视频流和照片输出
    
} NJCameraOutputType;

// 摄像头位置
typedef enum: NSUInteger {
    
    NJCameraPositionRear,
    NJCameraPositionFront
    
} NJCameraPosition;

// 闪光灯开关
typedef enum: NSUInteger {
    
    NJCameraFlashOff,
    NJCameraFlashOn,
    NJCameraFlashAuto
    
} NJCameraFlash;

// 镜像开关
typedef enum: NSUInteger {
    
    NJCameraMirrorOff,
    NJCameraMirrorOn,
    NJCameraMirrorAuto
    
} NJCameraMirror;

extern NSString *const NJCameraErrorDomain;
typedef enum: NSUInteger {
    
    NJCameraErrorCodeCameraPermission = 10,
    NJCameraErrorCodeUNKownPermission = 11,
    NJCameraErrorCodeSession = 12,
    
} NJCameraErrorCode;

@interface NJCamera : UIViewController

- (instancetype)initWithQuality:(NSString *)quality position:(NJCameraPosition)position OutputType:(NJCameraOutputType)type videoOrientation:(AVCaptureVideoOrientation)orientation isSupportAutoVideorientation:(BOOL)isSupportAutoVideorientation;

// 把NJCamera附到一个VCs上
- (void)nj_attachToViewController:(UIViewController *)vc withFrame:(CGRect)frame;

- (void)start;

- (void)stop;

@property (nonatomic, copy) void (^onError)(NJCamera *camera, NSError *error);

@property (nonatomic, copy) void (^onCapture)(NJCamera *camera, UIImage *image);

@property (nonatomic, copy) void (^onQRCode)(NJCamera *camera, NSString *result);

/// 捕获照片
- (void)startCapturePhotoAction:(void (^)(NJCamera *camera, UIImage *image))onCapture;

/// 获取二维码内容
- (void)getQRCodeWith:(void (^)(NJCamera *camera, NSString *result))onQRCode;

/// 更改前后置
- (void)changePosition;

/// 修改摄像头方向
- (void)changeVideoOrientation:(CGRect)frame;

/// 切换闪光灯
- (void)updateFlashMode:(NJCameraFlash)cameraFlash;
- (BOOL)isFlashAvailable;

- (BOOL)statusCheck;

/// 手电筒开关
- (void)toggleTorch:(BOOL)on;

@end

NS_ASSUME_NONNULL_END
