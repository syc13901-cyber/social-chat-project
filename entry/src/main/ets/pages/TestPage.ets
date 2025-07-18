@Entry
@Component
struct TestPage {
    @State title: string = '子组件1';
    @Provide message: string = '跨组件通讯'

    // 组件传参 父组件向子组件传参
    build() {
        Column() {
            Text('父组件向子组件传参: ' + this.title)
                .fontSize(28)
                .fontWeight(FontWeight.Bold)

            Child({ title: this.title })

            ListCom()


        }
        .height('100%')
        .width('100%')
    }
}

/**
 * 自定义组件
 */
@Component
struct Child {
    @Link title: string; // 接收父组件传参, 单向
    @Consume message: string

    build() {
        Column() {
            Text(this.title + this.message)
                .fontSize(24)
                .fontColor('#000000')
                .onClick(() => {
                    this.title = '子组件2';
                })

            Son()
        }.width('100%')

    }
}

@Component
struct Son {
    @Consume message: string

    build() {
        Column() {
            Text('子组件3' + this.message)
                .fontSize(24)
                .fontColor('#000000')
        }.width('100%')
    }
}

/**
 * 循环渲染
 */
@Component
struct ListCom {
    list: String[]= ['元素一', '元素二', '元素三', '元素四', '元素五', '元素六', '元素七', '元素八', '元素九', '元素十']

    build() {
        Column() {
            ForEach(this.list,(item:string,index:number)=>{
                if(index > 5){
                    Text(item+' '+ index)
                        .fontSize(26)
                        .fontColor('#fff50505')
                }else{
                    Text('索引号小于5不显示')
                }

            })


        }
        .width('100%')

    }
}

