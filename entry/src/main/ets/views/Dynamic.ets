@Component
export struct Dynamic{
    build() {
        Column() {
            Text('动态').fontSize(20).fontColor('#4B5563').fontWeight(600)
        }.width('100%').height('100%')
    }
}