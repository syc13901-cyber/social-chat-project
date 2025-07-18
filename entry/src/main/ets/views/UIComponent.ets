
/**
 *    [返回    标题     更多]
 *    [返回    标题        ]
 *    [       标题        ]
 */
@Preview
@Component
export struct CommonTitle {
    @Prop title: string = "标题" // 标题
    @Prop isShowMore: boolean = false // 是否显示更多按钮
    @Prop isShowBack: boolean = false //
    onBack: () => void = ()=> {}
    build() {
        Row() {
            Row(){
                if(this.isShowBack){
                    Image($r('app.media.back'))
                        .width(28)
                        .height(28)
                        .onClick(()=>{
                            // 返回上一页
                            this.onBack()
                        })
                }
            }.width(60).height(28)


            Text(this.title)


            Row(){
                if(this.isShowMore){
                    Image($r('app.media.more'))
                        .width(28)
                        .height(28)
                }
            }.width(60).height(28)
        }
        .width('100%')
        .height(60)
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)
        .padding({ left: 16, right: 16 })
        .backgroundColor('#ffffff')
        .borderWidth({ bottom: 1 })
        .borderStyle(BorderStyle.Solid)
        .borderColor('#eef2f6')
    }
}