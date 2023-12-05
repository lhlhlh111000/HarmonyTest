import http from '@ohos.net.http';
export class HttpRequest {

  static _instance: HttpRequest;

  static getInstance(): HttpRequest {
    if (HttpRequest._instance == null) {
      HttpRequest._instance = new HttpRequest();
    }

    return HttpRequest._instance;
  }

  options = {
    usingCache: true,
    priority: 1,
    connectTimeout: 6000,
    readTimeout: 6000
  };

  httpRequest = http.createHttp();

  banner() {
    this.httpRequest.request("https://www.wanandroid.com/banner/json", this.options, (err, data) => {
    })
  }

  request() {
    this.httpRequest.request("https://www.wanandroid.com/article/list/1/json", this.options, (err, data) => {
      if (!err) {
        console.info("Result: " + JSON.stringify(data.result));
        console.info("code: " + JSON.stringify(data.responseCode));
      } else {
        console.info("error: " + JSON.stringify(err));
      }
    })
  }
}