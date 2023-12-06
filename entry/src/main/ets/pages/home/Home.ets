import { Constants } from '../../common/Constants';
import { HttpRequest } from '../../data/HttpRequest';
import { ADataSource } from '../../model/ADataSource';
import { Banner, Result } from '../../model/Models'

@Component
export struct HomePage {

  @State
  private banners: ADataSource<Banner> = new ADataSource([]);

  private swiperController: SwiperController = new SwiperController();

  aboutToAppear() {
    HttpRequest.getInstance().banner((data) => {
      this.banners = data.data ? new ADataSource(data.data) : new ADataSource([]);
    });
  }

  build() {
    Column() {
      if (this.banners.totalCount() > 0) {
        Swiper(this.swiperController) {
          LazyForEach(this.banners, (item: Banner) => {
            Image(item.imagePath)
              .width(Constants.FULL_PERCENT)
              .height(160)
          }, (item: Banner) => {
            return item.id.toString();
          });
        }
        .cachedCount(2)
        .index(1)
        .autoPlay(true)
        .loop(true)
        .duration(1000)
        .interval(4000)
        .curve(Curve.Linear)
        .align(Alignment.TopStart)
      }
    }
    .height(Constants.FULL_PERCENT)
    .width(Constants.FULL_PERCENT)
  }
}