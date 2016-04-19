//
//  HomeViewController.m
//  CoreData登录验证
//
//  Created by George Jin on 3/29/16.
//  Copyright © 2016 First-Tek. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat imageW = self.view.frame.size.width;
    CGFloat imageH = self.view.frame.size.height/2;
    CGFloat imageY = 0;
    NSLog(@"djkd");
    
    for (int i =0; i<5; i++) {
        UIImageView *imageview = [[UIImageView alloc]init];
        NSString *imageName = [NSString stringWithFormat:@"image%d", i+1];
        imageview.image = [UIImage imageNamed:imageName];
        
        CGFloat imageX = i * imageW;
        imageview.frame = CGRectMake(imageX, imageY, imageW, imageH);
        
        [self.scrollView addSubview:imageview];
    }
    
    //设置UIScrollView的contentSize(内容的实际大小)
    CGFloat maxX = self.scrollView.frame.size.width * 5;
    self.scrollView.contentSize = CGSizeMake(maxX, 0);
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.pageControl.numberOfPages = 5;
    self.pageControl.currentPage = 0;
    
    //创建一个“计时器”控件NSTimer控件
    //通过scheduledTimerWithTimeInterval这个方法创建的计时器控件，创建好以后自动启动
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    
    //修改self.timer的优先级与控件一样
    //获取当前的消息循环对象
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    //改变self.timer对象的优先级
    [runloop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

//自动滚动图片的方法
- (void)scrollImage{
    //滚动一次图片
    NSInteger page = self.pageControl.currentPage;
    
    if(page == self.pageControl.numberOfPages-1){
        page = 0;
    }else{
        page++;
    }
    //计算下一页的contentOffset.x
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

//实现UIScrollView的滚动方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x;
    offsetX = offsetX + (scrollView.frame.size.width * 0.5);
    int page = offsetX / scrollView.frame.size.width;
    self.pageControl.currentPage = page;
    
}

//实现即将开始拖拽的方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //停止计时器
    [self.timer invalidate];
    self.timer = nil;
}

//实现拖拽完毕的方法
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //重新启动一个计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    //再次修改一下新创建的timer的优先级
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

























@end
