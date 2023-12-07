import webview from '@ohos.web.webview';
import router from '@ohos.router';
import { Constants } from '../../common/Constants';

@Entry
@Component
export struct WebPage {

  private controller: WebviewController = new webview.WebviewController();

  @Builder
  title() {
    Row() {
      Image($r('app.media.ic_back'))
        .width(30)
        .height(30)
        .onClick(() => {
          router.back();
        })

      Text($r('app.string.detail'))
        .fontSize(20)
    }
    .width(Constants.FULL_PERCENT)
    .padding(10)
  }

  build() {

    Column() {
      this.title()
      Web({src: this._getLoadUrl(), controller: this.controller})
        .width(Constants.FULL_PERCENT)
        .height(Constants.FULL_PERCENT)
        .domStorageAccess(true)
        .databaseAccess(true)
    }
    .width(Constants.FULL_PERCENT)
    .height(Constants.FULL_PERCENT)
  }

  private _getLoadUrl() : string {
    let params = router.getParams();
    if (params.hasOwnProperty('url')) {
      return params['url'];
    }

    return '';
  }
}