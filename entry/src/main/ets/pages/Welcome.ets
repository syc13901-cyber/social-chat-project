@Entry
@Component
struct Welcome {
    // 创建页面栈对象
    @Provide pageInfos: NavPathStack = new NavPathStack()

    build() {
        Navigation(this.pageInfos)
            .hideNavBar(true)
            .hideTitleBar(true)
            .onAppear(() => {
                this.pageInfos.pushPathByName("Start", null, false) // 跳转到名为Start页面
            })

    }
}