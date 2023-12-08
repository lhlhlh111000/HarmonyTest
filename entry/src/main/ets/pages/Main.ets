import { Constants } from '../common/Constants';
import { BottomTabsList } from '../model/BottomTabsItem';
import { DiscoverPage } from './discover/Discover';
import { HomePage } from './home/Home';
@Entry
@Component
struct MainPage {

  private controller: TabsController = new TabsController();

  @State
  bottomTabIndex: number = 0;

  @Builder
  tabBuilder(index: number) {
    Column() {
      Image(BottomTabsList[index].icon)
        .width(Constants.TAB_ICON_SIZE)
        .height(Constants.TAB_ICON_SIZE)
        .objectFit(ImageFit.Contain)

      Text(BottomTabsList[index].text)
        .fontSize($r('app.float.bottom_font_size'))
        .opacity(Constants.OPACITY)
        .fontColor(this.bottomTabIndex == index
          ? $r('app.color.bottom_tabs_font_color_selected')
          : $r('app.color.bottom_tabs_font_color'))
    }
    .width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
    .border({width: {top: Constants.BORDER_WIDTH}, color: $r('app.color.color_border')})
    .backgroundColor($r('app.color.bottom_tabs_background_color'))
  }

  build() {
    Column() {
      Tabs({barPosition: BarPosition.End, controller: this.controller}) {
        TabContent() {
          HomePage()
        }
        .tabBar(this.tabBuilder(0))

        TabContent() {
          DiscoverPage()
        }
        .tabBar(this.tabBuilder(1))

        TabContent() {
          Column()
            .width(Constants.FULL_PERCENT)
            .height(Constants.FULL_PERCENT)
            .backgroundColor(Color.Green)
        }
        .tabBar(this.tabBuilder(2))
      }
      .vertical(false)
      .scrollable(false)
      .barMode(BarMode.Fixed)
      .width(Constants.FULL_PERCENT)
      .height(Constants.FULL_PERCENT)
      .barHeight(Constants.BAR_HEIGHT)
      .onChange((index) => {
        this.bottomTabIndex = index;
      })
    }
    .width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)
  }
}