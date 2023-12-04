@Entry
@Component
struct MainPage {

  private controller: TabsController = new TabsController();

  build() {
    Column() {
      Tabs({barPosition: BarPosition.End, controller: this.controller}) {
        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor(Color.Blue)
        }
        .tabBar('首页')

        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor(Color.Yellow)
        }
        .tabBar('发现')

        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor(Color.Green)
        }
        .tabBar('我的')
      }
      .vertical(false)
      .scrollable(false)
      .barMode(BarMode.Fixed)
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}