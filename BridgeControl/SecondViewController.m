//
//  SecondViewController.m
//  BridgeControl
//
//  Created by dengwei on 16/1/14.
//  Copyright (c) 2016年 dengwei. All rights reserved.
//

#import "SecondViewController.h"
#import "Constants.h"

@interface SecondViewController ()

@property (nonatomic, strong) UISwitch *engineSwitch;
@property (nonatomic, strong) UISlider *warpFactorSlider;
@property (nonatomic, strong) UIButton *settingInfo;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupUI];
    [self refreshFields];
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
}

-(void)setupUI{
    UILabel *warpEngine = [[UILabel alloc] initWithFrame:CGRectMake(20, 86, 111, 21)];
    warpEngine.text = @"Warp Engines:";
    warpEngine.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:warpEngine];
    
    _engineSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(251, 81, 51, 31)];
    [_engineSwitch addTarget:self action:@selector(engineSwitchTapped) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_engineSwitch];
    
    UILabel *warpFactor = [[UILabel alloc] initWithFrame:CGRectMake(20, 126, 100, 21)];
    warpFactor.text = @"Warp Factor:";
    warpFactor.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:warpFactor];
    
    _warpFactorSlider = [[UISlider alloc] initWithFrame:CGRectMake(18, 155, 284, 34)];
    _warpFactorSlider.minimumValue = 1;
    _warpFactorSlider.maximumValue = 10;
    _warpFactorSlider.value = 5;
    _warpFactorSlider.maximumValueImage = [UIImage imageNamed:@"rabbit"];
    _warpFactorSlider.minimumValueImage = [UIImage imageNamed:@"turtle"];
    [_warpFactorSlider addTarget:self action:@selector(warpSliderTouched) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_warpFactorSlider];
    
    _settingInfo = [UIButton buttonWithType:UIButtonTypeInfoDark];
    _settingInfo.frame = CGRectMake(278, 36, 22, 22);
    [_settingInfo addTarget:self action:@selector(settingInfoClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_settingInfo];
}

-(void)refreshFields{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.engineSwitch.on = [defaults boolForKey:kWarpDriveKey];
    self.warpFactorSlider.value = [defaults floatForKey:kWarpFactorKey];
}

- (void)engineSwitchTapped {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.engineSwitch.on forKey:kWarpDriveKey];
    [defaults synchronize];
}

- (void)warpSliderTouched {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:self.warpFactorSlider.value forKey:kWarpFactorKey];
    [defaults synchronize];
}

-(void)settingInfoClicked{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

-(void)applicationWillEnterForeground:(NSNotification *)notification{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self refreshFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
