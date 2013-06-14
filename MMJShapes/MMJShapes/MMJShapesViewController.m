//
//  MMJShapesViewController.m
//  MMJShapes
//
//  Created by Mihaela Mihaljević Jakić on 6/11/13.
//  Copyright (c) 2013 Token d.o.o. All rights reserved.
//

#import "MMJShapesViewController.h"
#import "MMJDrawingView.h"
#import "MMJShapeData.h"

@interface MMJShapesViewController ()
@property (weak, nonatomic) IBOutlet MMJDrawingView *drawingView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerForShapes;

@property (strong, nonatomic) MMJShapeData *shapeData;

@end

@implementation MMJShapesViewController

#pragma mark - Properties

- (MMJShapeData *)shapeData
{
    return _shapeData ? _shapeData : [[MMJShapeData alloc] init];
}

#pragma mark - Picker View Data Source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 4;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component)
    {
        case 0:
            return [MMJShapeData shapesCount];
            break;
        case 1:
            return [MMJShapeData shapesCount] * 3;
            break;
        case 2:
            return [MMJShapeData shapesCount] * 2;
            break;
        case 3:
            return [MMJShapeData fillsCount];
            break;
        default:
            return 0;
    }
}


#pragma mark - Picker View Delegate

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
           forComponent:(NSInteger)component
{
    switch (component)
    {
        case 0:
            return (NSString*) [MMJShapeData shapeNameAtIndex:row];
            break;
        case 1:
            return [NSString stringWithFormat:@"F%d", row];
            break;
        case 2:
            return [NSString stringWithFormat:@"S%d", row + 1];
            break;
        case 3:
            return (NSString*) [MMJShapeData shapeFillNameAtIndex:row];;
            break;
        default:
            return @"#";
    }
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    switch (component)
    {
        case 0:
            self.drawingView.shapeType = [MMJShapeData shapeTypeAtIndex:row];
            break;
        case 1:
            self.drawingView.frameSize = row + 1;
            break;
        case 2:
            self.drawingView.sizeStep = row + 1;
            break;
        case 3:
            self.drawingView.shapeFill = [MMJShapeData shapeFillTypeAtIndex:row];;
            break;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    CGFloat maxNumbertextWidth = [MMJShapeData maxStringWidth:[NSString stringWithFormat:@"F%d", 10]];
    switch(component)
    {
        case 0: return [MMJShapeData maxShapeNameWidth];
        case 1: return maxNumbertextWidth;
        case 2: return maxNumbertextWidth;
        case 3: return [MMJShapeData maxFillNameWidth];;
        default: return maxNumbertextWidth;
    }
}


#pragma mark - Drawing View

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

@end
