import http from '@ohos.net.http';
import { Callback } from './Callback';
import {Result, Banner} from '../model/Models';

export class HttpRequest {

  private static _instance: HttpRequest;

  static getInstance(): HttpRequest {
    if (HttpRequest._instance == null) {
      HttpRequest._instance = new HttpRequest();
    }

    return HttpRequest._instance;
  }

  banner(callback: Callback<Result<Array<Banner>>>): void {
    this._get("https://www.wanandroid.com/banner/json", callback);
  }

  private _get<T>(url: string, callback?: Callback<Result<T>>): void {
    let options = {
      usingCache: true,
      priority: 1,
      connectTimeout: 6000,
      readTimeout: 6000
    } as http.HttpRequestOptions;

    let httpRequest = http.createHttp();

    if (!callback) {
      callback = (data) => {
        // empty callback
      };
    }

    httpRequest.request(url, options, (err, data) => {
      if (!err) {
        if (data.resultType != http.HttpDataType.STRING) {
          callback({
            errorMsg: 'Invalid data type.',
            errorCode: data.responseCode
          });
        } else {
          let result: Result<T> = JSON.parse(data.result as string);
          if (result) {
            callback(result);
          } else {
            callback({
              errorMsg: 'Json format error.',
              errorCode: data.responseCode
            });
          }
        }
      } else {
        callback({
          errorMsg: err.message
        });
      }

      httpRequest.destroy();
    });
  }
}