# SSScrollView
 简单无限轮播控件封装,图片轮播,文本轮播垂直于水平方式都支持
![image](https://github.com/l19901001/SSScrollView/blob/master/images/demonstration.gif)
![image](https://github.com/l19901001/SSScrollView/blob/master/images/e_image_gif.gif)
```
    SSScrollView *headerView = [[SSScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150) DragDirection:HeaderViewDragDirectionHorizontal];
    headerView.contentStyle = HeaderViewScrollViewImageViewStyle;
    //headerView.contentStyle = HeaderViewScrollViewLableStyle;
    headerView.rollingTime = 3.0;
    [headerView reloadheaderViewWithDatas:self.images];
 ```
