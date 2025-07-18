@Component
export struct Chat {
    build() {
        Column() {
            Text('聊天界面').fontSize(20).fontColor('#4B5563').fontWeight(600)
        }.width('100%').height('100%')
    }
}