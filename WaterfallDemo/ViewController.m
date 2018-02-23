//
//  ViewController.m
//  WaterfallDemo
//
//  Created by chenyun on 2018/2/23.
//  Copyright © 2018年 yctc. All rights reserved.
//

#import "ViewController.h"
#import "WaterLayout.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, WaterLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.collectionView];
}

#pragma mark - WaterLayoutDelegate

- (CGFloat)waterflowLayout:(WaterLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth {
    CGFloat scale = self.view.frame.size.width / 375;
    NSInteger randomH = [self getRandomNumber:100 to:300];
    return scale * randomH;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = randomColor;
    return cell;
}

// [from, to)
- (int)getRandomNumber:(int)from to:(int)to

{
    
    return (int)(from + (arc4random() % (to - from + 1)));
    //+1,result is [from to]; else is [from, to)!!!!!!!
    
}


#pragma mark - 懒加载

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        WaterLayout *layout = [[WaterLayout alloc] init];
        layout.delegate = self;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
