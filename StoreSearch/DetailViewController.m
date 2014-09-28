//
//  DetailViewController.m
//  StoreSearch
//
//  Created by RoBeRt on 14-9-22.
//  Copyright (c) 2014年 Springshine. All rights reserved.
//

#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SearchResult.h"

@interface DetailViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, weak) IBOutlet UIView *popupView;
@property (nonatomic, weak) IBOutlet UIImageView *artworkImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *artistNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *kindLabel;
@property (nonatomic, weak) IBOutlet UILabel *genreLabel;
@property (nonatomic, weak) IBOutlet UIButton *priceButton;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [[UIImage imageNamed:@"PriceButton"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.priceButton setBackgroundImage:image forState:UIControlStateNormal];
    
    self.view.tintColor = [UIColor colorWithRed:20/255.0f green:160/255.0f blue:160/255.0f alpha:1.0f];
    self.popupView.layer.cornerRadius = 10.0f;
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close:)];
    gestureRecognizer.cancelsTouchesInView = NO;
    gestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:gestureRecognizer];
    
    if (self.searchResult != nil) {
        [self updateUI];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action Methods
- (IBAction)close:(id)sender {
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];

}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return (touch.view == self.view);
}

- (void)updateUI {
    self.nameLabel.text = self.searchResult.name;
    
    NSString *artistName = self.searchResult.artistName;
    if (artistName == nil) {
        artistName = @"Unkown";
    }
    
    self.artistNameLabel.text = artistName;
    self.kindLabel.text = self.searchResult.kind;
    self.genreLabel.text = self.searchResult.genre;
}

- (void)dealloc {
    NSLog(@"dealloc %@", self);
}

@end
