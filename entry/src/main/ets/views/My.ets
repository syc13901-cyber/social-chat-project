@Component
export struct My{
    build() {
        Column() {
            Text('我的').fontSize(20).fontColor('#4B5563').fontWeight(600)
        }.width('100%').height('100%')
    }
}