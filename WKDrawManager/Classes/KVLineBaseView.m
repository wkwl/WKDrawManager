//
//  KVLineBaseView.m
//  KavinDrawTool
//
//  Created by sgx_02 on 2021/12/26.
//

#import "KVLineBaseView.h"

@interface KVLineBaseView ()
/** 记录各点的坐标方便后边添加渐变阴影 和 点击层视图等 */
@property (nonatomic, strong) NSMutableArray *pointsArr;


@end

@implementation KVLineBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.pointsArr = [NSMutableArray array];
        _pointsArray = _pointsArr;
        self.yTextSpaceOfYLine = 10.0f;
        self.yTextWidth = 40;
        self.xTextWidth = 40;
        self.yTextHeight = 20;
        self.xTextHeight = 20;
        self.xLineDashSpace = 0;
        self.xLineDashWidth = 2;
        self.yLineDashSpace = 0;
        self.yLineDashWidth = 2;
        self.rowMarkLineSpace = 0;
        self.yLineHeight = 0;
        self.xLineWidth = 0;
        self.yTextFont = [UIFont systemFontOfSize:12];
        self.yTextColor = [UIColor blackColor];
        self.xTextFont = [UIFont systemFontOfSize:11];
        self.xTextColor = [UIColor blackColor];
        self.xAxisLineColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
        self.xSpaceLineColor = self.xAxisLineColor;
        self.ySpaceLineColor = self.xAxisLineColor;
        self.yAxisLineColor = self.xAxisLineColor;
        self.lineStrokeColor = [UIColor colorWithRed:255/255.0 green:69/255.0 blue:0/255.0 alpha:1];
        self.lineStrokeWidth = 1;
        CGFloat startX = self.yTextSpaceOfYLine +self.yTextWidth;
        CGFloat startY = self.yTextHeight/2.0;//可以加上视图与顶部之间的间距
        self.startPoint = CGPointMake(startX, startY);
        
        self.gradientColors = @[(__bridge id)[UIColor colorWithRed:255/255.0 green:69/255.0 blue:0/255.0 alpha:0.8].CGColor,(__bridge id)[UIColor colorWithWhite:1 alpha:1].CGColor];
        self.gradientLocations = @[@0.0,@1.0];
        self.gradientStartPoint = CGPointMake(0,0.0);
        self.gradientEndPoint = CGPointMake(0,0.9);
    }
    return self;
}

#pragma mark - set
/** X轴长度*/
- (void)setXLineWidth:(CGFloat)xLineWidth {
    _xLineWidth = xLineWidth;
}

/** Y轴长度*/
- (void)setYLineHeight:(CGFloat)yLineHeight {
    _yLineHeight = yLineHeight;
}

/** 与X轴平行的分割线间距（表示各个Y轴所对应数字值的辅助线）*/
- (void)setRowMarkLineSpace:(CGFloat)rowMarkLineSpace {
    _rowMarkLineSpace = rowMarkLineSpace;
}

- (void)setRowMarkLineCount:(NSInteger)rowMarkLineCount {
    _rowMarkLineCount = rowMarkLineCount;
}

/** 与Y轴平行的分割线间距（表示各个X轴所对应数字值的辅助线）*/
- (void)setColMarkLineSpace:(CGFloat)colMarkLineSpace {
    _colMarkLineSpace = colMarkLineSpace;
}

/** 折线图Y轴坐标数组*/
- (void)setXValueData:(NSArray *)xValueData {
    _xValueData = xValueData;
}

/** 折线图X轴坐标数组*/
- (void)setYValueData:(NSArray *)yValueData {
    _yValueData = yValueData;
}

/** X轴坐标文本宽度*/
- (void)setXTextWidth:(CGFloat)xTextWidth {
    _xTextWidth = xTextWidth;
}

/** Y轴坐标文本宽度*/
- (void)setYTextWidth:(CGFloat)yTextWidth {
    _yTextWidth = yTextWidth;
}

/** X轴坐标文本高度*/
- (void)setXTextHeight:(CGFloat)xTextHeight {
    _xTextHeight = xTextHeight;
}

/** Y轴坐标文本高度*/
- (void)setYTextHeight:(CGFloat)yTextHeight {
    _yTextHeight = yTextHeight;
}

/** Y轴坐标文本与Y轴之间的间距*/
- (void)setYTextSpaceOfYLine:(CGFloat)yTextSpaceOfYLine {
    _yTextSpaceOfYLine = yTextSpaceOfYLine;
}

/** 设置X轴以及与Xz轴平行的辅助线虚线间距（xLineDashSpace 为0时，即为实线非虚线）*/
- (void)setXLineDashSpace:(CGFloat)xLineDashSpace {
    _xLineDashSpace = xLineDashSpace;
}

/** 设置X轴以及与Xz轴平行的辅助线虚线每一小段的宽度*/
- (void)setXLineDashWidth:(CGFloat)xLineDashWidth {
    _xLineDashWidth = xLineDashWidth;
}

/** 设置Y轴以及与Y轴平行的辅助线虚线间距（xLineDashSpace 为0时，即为实线非虚线）*/
- (void)setYLineDashSpace:(CGFloat)yLineDashSpace {
    _yLineDashSpace = yLineDashSpace;
}

/** 设置Y轴以及与Y轴平行的辅助线虚线每一小段的宽度*/
- (void)setYLineDashWidth:(CGFloat)yLineDashWidth {
    _yLineDashWidth = yLineDashWidth;
}

/** 设置X轴线条颜色*/
- (void)setXAxisLineColor:(UIColor *)xAxisLineColor {
    _xAxisLineColor = xAxisLineColor;
}

/** 设置y轴线条颜色*/
- (void)setYAxisLineColor:(UIColor *)yAxisLineColor {
    _yAxisLineColor = yAxisLineColor;
}

/** X轴平行的辅助线颜色*/
- (void)setXSpaceLineColor:(UIColor *)xSpaceLineColor {
    _xSpaceLineColor = xSpaceLineColor;
}

/** Y轴平行的辅助线颜色*/
- (void)setYSpaceLineColor:(UIColor *)ySpaceLineColor {
    _ySpaceLineColor = ySpaceLineColor;
}

/** Y轴坐标文本字体大小*/
- (void)setYTextFont:(UIFont *)yTextFont {
    _yTextFont = yTextFont;
}

/** Y轴坐标文本字体颜色*/
- (void)setYTextColor:(UIColor *)yTextColor {
    _yTextColor = yTextColor;
}

/** X轴坐标文本字体大小*/
- (void)setXTextFont:(UIFont *)xTextFont {
    _xTextFont = xTextFont;
}

/** X轴坐标文本字体颜色*/
- (void)setXTextColor:(UIColor *)xTextColor {
    _xTextColor = xTextColor;
}

/** 设置折线最大值*/
- (void)setMaxValue:(CGFloat)maxValue {
    _maxValue = maxValue;
}

/** 折线颜色*/
- (void)setLineStrokeColor:(UIColor *)lineStrokeColor {
    _lineStrokeColor = lineStrokeColor;
}

/** 折线宽度*/
- (void)setLineStrokeWidth:(CGFloat)lineStrokeWidth {
    _lineStrokeWidth = lineStrokeWidth;
}

/** 设置渐变色数组*/
- (void)setGradientColors:(NSArray *)gradientColors {
    _gradientColors = gradientColors;
}

/** 渐变范围数组*/
- (void)setGradientLocations:(NSArray *)gradientLocations {
    _gradientLocations = gradientLocations;
}

/** 渐变起点*/
- (void)setGradientStartPoint:(CGPoint)gradientStartPoint {
    _gradientStartPoint = gradientStartPoint;
}

/** 渐变终点*/
- (void)setGradientEndPoint:(CGPoint)gradientEndPoint {
    _gradientEndPoint = gradientEndPoint;
}
#pragma mark - public methods
/** 开始绘制折线图*/
- (void)startDrawView {
    if (self.rowMarkLineCount == 0) {
        self.rowMarkLineCount = self.yValueData.count;
    }
    /** 辅助线间距为0 时，默认用总高度减去X轴文本高度与一个Y轴的文本高度为Y轴总高度*/
    if (self.rowMarkLineSpace == 0) {
//        CGFloat totalRowSpace = self.frame.size.height;
    
        self.yLineHeight = self.frame.size.height - self.xTextHeight-self.yTextHeight/2.0-self.startPoint.y;
         
        if (self.yValueData.count == 0) {
            return;
        }
        self.rowMarkLineSpace = self.yLineHeight/(self.rowMarkLineCount);
    }
    
    /** y轴高度为0 时，则根据间距自动计算*/
    if (self.yLineHeight == 0) {
        
        self.yLineHeight = self.rowMarkLineSpace * self.rowMarkLineCount;
    }
    
    /** X轴间距为0时，X轴长度根据视图总宽度减去 一个Y轴与Y轴文本间距 以及Y轴文本宽度 再减去右侧一半的X轴文本宽度*/
    if (self.colMarkLineSpace == 0 ){
        if (self.xValueData.count == 0) {
            return;
        }
        CGFloat totalWidht = self.frame.size.width - self.yTextSpaceOfYLine - self.yTextWidth - (self.xTextWidth/2.0);
        self.xLineWidth = totalWidht;
        self.colMarkLineSpace = totalWidht/(self.xValueData.count-1);
    }
    
    /** X轴长度为0 时，则根据间距自动计算*/
    if (self.xLineWidth == 0) {
        self.xLineWidth = self.colMarkLineSpace * (self.xValueData.count -1);
    }
    
    [self drawXtextLab];
    [self drawYtextLab];
    
    [self drawXAxsiLine];
    [self drawYAxsiLine];
    
    [self drawXSpaceLine];
    [self drawYSpaceLine];
    
    /** 绘制折线*/
    [self drawChartLine];
    /** 绘制渐变色*/
    [self drawGradient];
    self.tmpLayers = [NSMutableArray arrayWithArray:self.layer.sublayers];
    
}


/** 刷新折线图数据*/
- (void)reloadData {
    [self clearView];
    [self startDrawView];
}

/** 清空视图*/
- (void)clearView {
    [self.pointsArr removeAllObjects];
    [self removeAllLab];
    [self removeAllLayer];
    
}

#pragma mark - private methods

/**  绘制X轴*/
- (void)drawXAxsiLine {
    UIBezierPath *xAxisPath = [[UIBezierPath alloc] init];
    [xAxisPath moveToPoint:CGPointMake(self.startPoint.x, self.yLineHeight+self.startPoint.y)];
    [xAxisPath addLineToPoint:CGPointMake(self.startPoint.x+self.xLineWidth, self.yLineHeight+self.startPoint.y)];
   
    
    CAShapeLayer *xAxisLayer = [CAShapeLayer layer];
    [xAxisLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:self.xLineDashSpace], nil]];
    xAxisLayer.lineWidth = 0.5;
    xAxisLayer.strokeColor = self.xAxisLineColor.CGColor;
    xAxisLayer.path = xAxisPath.CGPath;
    [self.layer addSublayer:xAxisLayer];
}

/**  绘制Y轴*/
- (void)drawYAxsiLine {
    UIBezierPath *yAxisPath = [[UIBezierPath alloc] init];
    [yAxisPath moveToPoint:CGPointMake(self.startPoint.x, self.startPoint.y + self.yLineHeight)];
    [yAxisPath addLineToPoint:CGPointMake(self.startPoint.x, self.startPoint.y)];
    
    CAShapeLayer *yAxisLayer = [CAShapeLayer layer];
    //设置虚线线宽及间距
    [yAxisLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithFloat:self.yLineDashWidth], [NSNumber numberWithFloat:self.yLineDashSpace], nil]];    // 设置线为虚线
    yAxisLayer.lineWidth = 0.5;
    yAxisLayer.strokeColor = self.yAxisLineColor.CGColor;
    yAxisLayer.path = yAxisPath.CGPath;
    [self.layer addSublayer:yAxisLayer];
}


/** Y轴坐标文本*/
- (void)drawYtextLab {
    for (int i = 0; i<self.rowMarkLineCount+1; i++) {
        UILabel *ytextLab = [[UILabel alloc] init];
        ytextLab.frame = CGRectMake(0, self.startPoint.y -self.yTextHeight/2.0+i*self.rowMarkLineSpace, self.yTextWidth, self.yTextHeight);
        ytextLab.textAlignment = NSTextAlignmentRight;
        ytextLab.font = self.yTextFont;
        ytextLab.textColor = self.yTextColor;
        if (self.maxValue > 0) {
            CGFloat value = self.maxValue/self.rowMarkLineCount;
            ytextLab.text = [NSString stringWithFormat:@"%.0f",value*(self.rowMarkLineCount-i)];
        }
//        ytextLab.text =  [NSString stringWithFormat:@"%@", self.yValueData[self.yValueData.count - 1 - i]];
        [self addSubview:ytextLab];
    }
}

/** X轴坐标文本*/
- (void)drawXtextLab {
    for (int i = 0; i<self.xValueData.count; i++) {
        UILabel *xTextLab = [[UILabel alloc] init];
        xTextLab.frame = CGRectMake(self.startPoint.x - self.xTextWidth/2.0+i*self.colMarkLineSpace,self.startPoint.y+self.yTextHeight/2.0+self.yLineHeight, self.xTextWidth, self.xTextHeight);
        xTextLab.textAlignment =  NSTextAlignmentCenter;
        xTextLab.font = self.xTextFont;
        xTextLab.textColor = self.xTextColor;
        xTextLab.text = [NSString stringWithFormat:@"%@",self.xValueData[i]];
        [self addSubview:xTextLab];
    }
}

/** 绘制与Y轴平行的辅助线*/
- (void)drawYSpaceLine {
    for (int i = 0; i<self.xValueData.count-1; i++) {
        CGFloat pointX = self.startPoint.x +self.colMarkLineSpace *(i+1);
        UIBezierPath *yAxisPath = [[UIBezierPath alloc] init];
        [yAxisPath moveToPoint:CGPointMake(pointX, self.yLineHeight+self.startPoint.y)];
        [yAxisPath addLineToPoint:CGPointMake(pointX, self.startPoint.y)];
        
        CAShapeLayer *yAxisLayer = [CAShapeLayer layer];
        [yAxisLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithFloat:self.yLineDashWidth],[NSNumber numberWithFloat:self.yLineDashSpace], nil]];
        yAxisLayer.lineWidth = 0.5;
        yAxisLayer.strokeColor = self.ySpaceLineColor.CGColor;
        yAxisLayer.path = yAxisPath.CGPath;
        [self.layer addSublayer:yAxisLayer];
    }
}

/** 绘制与X轴平行的辅助线*/
- (void)drawXSpaceLine {
    for (int i = 0; i<self.rowMarkLineCount; i++) {
        CGFloat pointY = i*self.rowMarkLineSpace+self.startPoint.y;
        UIBezierPath *xAxisPath = [[UIBezierPath alloc] init];
        [xAxisPath moveToPoint:CGPointMake(self.startPoint.x, pointY)];
        [xAxisPath addLineToPoint:CGPointMake(self.startPoint.x+self.xLineWidth, pointY)];
        
        CAShapeLayer *xAxisLayer = [CAShapeLayer layer];
        [xAxisLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithFloat:self.xLineDashWidth], [NSNumber numberWithFloat:self.xLineDashSpace], nil]];
        xAxisLayer.lineWidth = 0.5;
        xAxisLayer.strokeColor = self.xSpaceLineColor.CGColor;
        xAxisLayer.path = xAxisPath.CGPath;
        [self.layer addSublayer:xAxisLayer];
    }
}

/** 开始绘制折线图*/
- (void)drawChartLine {
    UIBezierPath *pAxisPath = [[UIBezierPath alloc] init];
    for (int i = 0; i < self.yValueData.count; i ++) {
        CGFloat point_X = self.colMarkLineSpace * i + self.startPoint.x;
        CGFloat value = [self.yValueData[i] floatValue];
        CGFloat percent = value / self.maxValue;
        CGFloat point_Y = self.yLineHeight * (1 - percent) + self.startPoint.y;
        
        CGPoint point = CGPointMake(point_X, point_Y);
        // 记录各点的坐标方便后边添加渐变阴影 和 点击层视图 等
        [self.pointsArr addObject:[NSValue valueWithCGPoint:point]];
        if (i == 0) {
            [pAxisPath moveToPoint:point];
        }
        else {
            [pAxisPath addLineToPoint:point];
        }
    }
    
    CAShapeLayer *pAxisLayer = [CAShapeLayer layer];
    pAxisLayer.lineWidth = self.lineStrokeWidth;
    pAxisLayer.strokeColor = self.lineStrokeColor.CGColor;
    pAxisLayer.fillColor = [UIColor clearColor].CGColor;
    pAxisLayer.path = pAxisPath.CGPath;
//    pAxisLayer.zPosition = 100000;
    [self.layer addSublayer:pAxisLayer];
}

/** 渐变阴影*/
- (void)drawGradient {
    CGFloat maxV = -MAXFLOAT;
    for (int i = 0; i < [self.yValueData count]; i++) {
        if ([self.yValueData[i] floatValue] * 1000> maxV) {
            maxV = [self.yValueData[i] floatValue] *1000;
        }
      
    }
    maxV = maxV/1000.0;
//    CGFloat percent = mxV / self.maxValue;
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width-self.xTextWidth/2.0, self.frame.size.height);

    gradientLayer.colors = self.gradientColors;
    gradientLayer.locations = self.gradientLocations;
    gradientLayer.startPoint = self.gradientStartPoint;
    gradientLayer.endPoint = self.gradientEndPoint;
    
    UIBezierPath *gradientPath = [[UIBezierPath alloc] init];
    [gradientPath moveToPoint:CGPointMake(self.startPoint.x, self.yLineHeight + self.startPoint.y)];
    
    for (int i = 0; i < self.pointsArr.count; i ++) {
        [gradientPath addLineToPoint:[self.pointsArr[i] CGPointValue]];
    }
    
    CGPoint endPoint = [[self.pointsArr lastObject] CGPointValue];
    endPoint = CGPointMake(endPoint.x + self.startPoint.x, self.yLineHeight + self.startPoint.y);
    [gradientPath addLineToPoint:endPoint];
    [gradientPath closePath];
    CAShapeLayer *arc = [CAShapeLayer layer];
//    arc.fillColor = [UIColor whiteColor].CGColor;
    arc.path = gradientPath.CGPath;
    gradientLayer.mask = arc;
    [self.layer addSublayer:gradientLayer];
    
}



/** 清空坐标轴文本*/
- (void)removeAllLab {
    for (UIView * view in self.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            [(UILabel *)view removeFromSuperview];
        }
    }
}

/** 清空辅助线*/
- (void)removeAllLayer {
    for (CALayer * layer in self.tmpLayers) {
        [layer removeFromSuperlayer];
    }
}
@end
