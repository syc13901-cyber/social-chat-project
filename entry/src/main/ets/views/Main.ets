import { Address } from "./Address"
import { Chat } from "./Chat"
import { Dynamic } from "./Dynamic"
import { My } from "./My"

@Builder
function MainBuilder(){
    Main()
}

@Component
export struct Main {
    @State currentIndex: number = 0

    @Builder
    tabBuilder(title: string, icon: Resource, index: number) {
        Column() {
            Image(icon).width(20).height(20)
                .fillColor(this.currentIndex == index ? '#4CAF50' : '#9CA3AF')
            Text(title).fontSize(12).fontColor(this.currentIndex == index ? '#4CAF50' : '#9CA3AF')
                .margin({ top: 4 })
        }.width('100%').height(50)
    }
    build() {
        NavDestination() {
            Tabs({ barPosition: BarPosition.End }) {
                TabContent() {
                    Chat()
                }.tabBar(this.tabBuilder('消息', $r('app.media.tab_home'), 0))

                TabContent() {
                    Address()
                }.tabBar(this.tabBuilder('通讯录', $r('app.media.tab_connection'), 1))

                TabContent() {
                    Dynamic()
                }.tabBar(this.tabBuilder('动态', $r('app.media.tab_dongtai'), 2))

                TabContent() {
                    My()
                }.tabBar(this.tabBuilder('我的', $r('app.media.tab_my'), 3))
            }.divider({
                strokeWidth: 2,
                color: '#f5f5f5',
                startMargin: 0,
                endMargin: 0
            }).onChange((index: number) => {
                this.currentIndex = index
            })
        }.hideTitleBar(true)

    }
}
