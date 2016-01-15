//
//  FirstViewController.m
//  BridgeControl
//
//  Created by dengwei on 16/1/14.
//  Copyright (c) 2016年 dengwei. All rights reserved.
//

#import "FirstViewController.h"
#import "Constants.h"

@interface FirstViewController ()

@property (nonatomic, strong) UILabel *officerLabel;
@property (nonatomic, strong) UILabel *authorizationCodeLabel;
@property (nonatomic, strong) UILabel *rankLabel;
@property (nonatomic, strong) UILabel *warpDriveLabel;
@property (nonatomic, strong) UILabel *warpFactorLabel;
@property (nonatomic, strong) UILabel *favoriteTeaLabel;
@property (nonatomic, strong) UILabel *favoriteCaptainLabel;
@property (nonatomic, strong) UILabel *favoriteGadgetLabel;
@property (nonatomic, strong) UILabel *favoriteAlienLabel;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupUI];
    [self refreshFields];
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
}

-(void)setupUI{
    UILabel *officer = [[UILabel alloc] initWithFrame:CGRectMake(20, 43, 151, 21)];
    officer.textAlignment = NSTextAlignmentRight;
    officer.font = [UIFont systemFontOfSize:15];
    officer.text = @"Officer:";
    [self.view addSubview:officer];
    
    _officerLabel = [[UILabel alloc] initWithFrame:CGRectMake(179, 43, 121, 21)];
    _officerLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_officerLabel];
    
    UILabel *authorizationCode = [[UILabel alloc] initWithFrame:CGRectMake(20, 72, 151, 21)];
    authorizationCode.textAlignment = NSTextAlignmentRight;
    authorizationCode.font = [UIFont systemFontOfSize:15];
    authorizationCode.text = @"Authorization Code:";
    [self.view addSubview:authorizationCode];
    
    _authorizationCodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(179, 72, 121, 21)];
    _authorizationCodeLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_authorizationCodeLabel];
    
    UILabel *rank = [[UILabel alloc] initWithFrame:CGRectMake(20, 101, 151, 21)];
    rank.textAlignment = NSTextAlignmentRight;
    rank.font = [UIFont systemFontOfSize:15];
    rank.text = @"Rank:";
    [self.view addSubview:rank];
    
    _rankLabel = [[UILabel alloc] initWithFrame:CGRectMake(179, 101, 121, 21)];
    _rankLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_rankLabel];
    
    UILabel *warpDrive = [[UILabel alloc] initWithFrame:CGRectMake(20, 130, 151, 21)];
    warpDrive.textAlignment = NSTextAlignmentRight;
    warpDrive.font = [UIFont systemFontOfSize:15];
    warpDrive.text = @"Warp Drive:";
    [self.view addSubview:warpDrive];
    
    _warpDriveLabel = [[UILabel alloc] initWithFrame:CGRectMake(179, 130, 121, 21)];
    _warpDriveLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_warpDriveLabel];
    
    UILabel *warpFactor = [[UILabel alloc] initWithFrame:CGRectMake(20, 159, 151, 21)];
    warpFactor.textAlignment = NSTextAlignmentRight;
    warpFactor.font = [UIFont systemFontOfSize:15];
    warpFactor.text = @"Warp Factor:";
    [self.view addSubview:warpFactor];
    
    _warpFactorLabel = [[UILabel alloc] initWithFrame:CGRectMake(179, 159, 121, 21)];
    _warpFactorLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_warpFactorLabel];
    
    UILabel *favoriteTea = [[UILabel alloc] initWithFrame:CGRectMake(20, 188, 151, 21)];
    favoriteTea.textAlignment = NSTextAlignmentRight;
    favoriteTea.font = [UIFont systemFontOfSize:15];
    favoriteTea.text = @"Favorite Tea:";
    [self.view addSubview:favoriteTea];
    
    _favoriteTeaLabel = [[UILabel alloc] initWithFrame:CGRectMake(179, 188, 121, 21)];
    _favoriteTeaLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_favoriteTeaLabel];
    
    UILabel *favoriteCaptain = [[UILabel alloc] initWithFrame:CGRectMake(20, 217, 151, 21)];
    favoriteCaptain.textAlignment = NSTextAlignmentRight;
    favoriteCaptain.font = [UIFont systemFontOfSize:15];
    favoriteCaptain.text = @"Favorite Captain:";
    [self.view addSubview:favoriteCaptain];
    
    _favoriteCaptainLabel = [[UILabel alloc] initWithFrame:CGRectMake(179, 217, 121, 21)];
    _favoriteCaptainLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_favoriteCaptainLabel];
    
    UILabel *favoriteGadget = [[UILabel alloc] initWithFrame:CGRectMake(20, 246, 151, 21)];
    favoriteGadget.textAlignment = NSTextAlignmentRight;
    favoriteGadget.font = [UIFont systemFontOfSize:15];
    favoriteGadget.text = @"Favorite Gadget:";
    [self.view addSubview:favoriteGadget];
    
    _favoriteGadgetLabel = [[UILabel alloc] initWithFrame:CGRectMake(179, 246, 121, 21)];
    _favoriteGadgetLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_favoriteGadgetLabel];
    
    UILabel *favoriteAlien = [[UILabel alloc] initWithFrame:CGRectMake(20, 275, 151, 21)];
    favoriteAlien.textAlignment = NSTextAlignmentRight;
    favoriteAlien.font = [UIFont systemFontOfSize:15];
    favoriteAlien.text = @"Favorite Alien:";
    [self.view addSubview:favoriteAlien];
    
    _favoriteAlienLabel = [[UILabel alloc] initWithFrame:CGRectMake(179, 275, 121, 21)];
    _favoriteAlienLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_favoriteAlienLabel];
}

-(void)refreshFields{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.officerLabel.text = [defaults objectForKey:kOfficerKey];
    self.authorizationCodeLabel.text = [defaults objectForKey:kAuthorizationCodeKey];
    self.rankLabel.text = [defaults objectForKey:kRankKey];
    self.warpDriveLabel.text = [defaults boolForKey:kWarpDriveKey] ? @"engaged" : @"Disabled";
    self.warpFactorLabel.text = [[defaults objectForKey:kWarpFactorKey] stringValue];
    self.favoriteTeaLabel.text = [defaults objectForKey:kFavoriteTeaKey];
    self.favoriteCaptainLabel.text = [defaults objectForKey:kFavoriteCaptionKey];
    self.favoriteGadgetLabel.text = [defaults objectForKey:kFavoriteGadgetKey];
    self.favoriteAlienLabel.text = [defaults objectForKey:kFavoriteAlienKey];
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
