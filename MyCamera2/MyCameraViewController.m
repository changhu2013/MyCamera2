//
//  MyCameraViewController.m
//  MyCamera2
//
//  Created by changhu on 13-8-9.
//  Copyright (c) 2013年 com.demo. All rights reserved.
//

#import "MyCameraViewController.h"

@interface MyCameraViewController ()

@end

@implementation MyCameraViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [activityIndicator release];
    [textField release];
    [press release];
    [super dealloc];
}
- (IBAction)touchView:(id)sender {
    
    NSLog(@"toucht the view ");
    [textField resignFirstResponder];
}

- (IBAction)editingDidEnd:(id)sender {
    
    NSLog(@"editing did end....");
    [sender resignFirstResponder];
}

- (IBAction)clickBtn:(id)sender {
    NSLog(@"click btn");
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"title" message:@"error!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",@"Ather", nil];
    
    [alert show];
    [alert release];
}

- (IBAction)clickBtn2:(id)sender {
    
    NSLog(@"click btn2");
    
    //UIActionSheet在Ipad上显示的效果和IPhone不同，存在bug
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"你确定清除文本框内容么？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil];
    
    
    [actionSheet showInView:self.view];
    [actionSheet release];
}

- (IBAction)clickBtn3:(id)sender {
    
    if([activityIndicator isAnimating]){
        NSLog(@"stop....");
        [activityIndicator stopAnimating];
        [activityIndicator setHidden:YES];
    }else {
        
        NSLog(@"start .......");
        [activityIndicator startAnimating];
        [activityIndicator setHidden:NO];
    }
    
    
    
}

- (IBAction)clickBtn4:(id)sender {
    NSLog(@"click btn 4");
    
    if([timer isValid]){
        NSLog(@"timer isvalid....");
    }
    
    press.progress = 0.0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(update) userInfo:nil repeats:YES];
}

- (IBAction)clickSegment:(id)sender {
    
    UISegmentedControl *seg =(UISegmentedControl *)sender;
    
    if(seg.selectedSegmentIndex == 0){
        NSLog(@"selected segment index : 0");
    }else if(seg.selectedSegmentIndex == 1){
        NSLog(@"selected segment index : 1");
    }else {
        NSLog(@"selected segment index : %i", seg.selectedSegmentIndex);
    }
}

-(void)update{
    
    press.progress = press.progress + 0.01;
    
    if(press.progress >= 1.0){
        //关闭定时器
        [timer invalidate];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"进度条完成" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
        
        [alert show];
        [alert release];
        
    }
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    NSLog(@"action sheet ..... %i", buttonIndex);
    if(buttonIndex == [actionSheet destructiveButtonIndex]){
        [textField setText:@""];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    
    NSLog(@"shouldAutorotateToInterfaceOrientation");
    return NO;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    NSLog(@"willRotaToInterfaceOrientation");
    //如果设备向左旋转
    if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft){
        [textField setText:@"Left"];
    }else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeRight){
        [textField setText:@"Right"];
    }
    
    
}

@end
