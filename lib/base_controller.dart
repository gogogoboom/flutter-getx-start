import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gogoboom_flutter_common/gogoboom_flutter_common.dart';

import 'models/page_params.dart';
import 'widget/base_loading.dart';

abstract class BaseController<T> extends SuperController<T> {
  RefreshController refreshController = RefreshController();

  // RefreshController get refreshController  {
  //   _refreshController = RefreshController();
  //   return _refreshController;
  // }

  PageParams? pageParams;

  ///需要分页的话重写这个变量
  bool supportPagination = false;

  bool isLastPage = false;

  ///是否正在加载中
  bool isFetching = false;

  ///展示的空信息
  String? emptyMsg;

  late Future<T> Function() requestFunc;

  GestureDetector get _placeholderError => GestureDetector(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/ic_placeholder_error.png', width: 200),
              const SizedBox(
                height: 16,
              ),
              Text('tip_page_error'.tr, style: Get.textTheme.subtitle2)
            ],
          ),
        ),
        onTap: () => _refresh(needLoading: true),
      );

  Center get _placeholderEmpty => Center(
        child: GestureDetector(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/ic_placeholder_empty.png',
                  width: 200,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(emptyMsg ?? 'tip_page_empty'.tr,
                    style: Get.textTheme.subtitle2)
              ],
            ),
          ),
          onTap: () => _refresh(needLoading: true),
        ),
      );

  Widget volatile(NotifierBuilder<T?> widget) {
    return obx(widget,
        onLoading: loading(),
        onError: (_) => _placeholderError,
        onEmpty: _placeholderEmpty);
  }

  void onRefresh() => _refresh();

  void reload() => _refresh(needLoading: true);

  void _refresh({bool needLoading = false}) {
    pageParams ??= PageParams.init();
    pageParams?.page = 1;
    isLastPage = false;
    isFetching = true;
    try {
      if (needLoading) {
        change(null, status: RxStatus.loading());
      }
      Future<T> compute() => requestFunc();
      compute().then((newValue) {
        if (newValue is List) {
          change(newValue,
              status: newValue.isEmpty ? RxStatus.empty() : RxStatus.success());
        } else {
          change(newValue, status: RxStatus.success());
        }
        onDataLoaded();
      }, onError: (err) {
        logger.e('出错了...「$err」');
        change(state, status: RxStatus.error(err.toString()));
      });
    } catch (e) {
      logger.e('刷新失败了...「$e」');
    } finally {
      refreshController.refreshCompleted();
      refreshController.loadComplete();
      isFetching = false;
    }
  }

  ///下一页
  Future<void> onLoadMore({bool append = true}) async {
    pageParams?.next();
    isFetching = true;
    try {
      change(state, status: RxStatus.loadingMore());
      final newValue = await requestFunc();
      if (newValue is List) {
        if (newValue.length < 20) {
          isLastPage = true;
          refreshController.loadNoData();
        }
        if (!append) {
          (state as List?)?.clear();
        }
        (state as List?)!.addAll(newValue);
        refreshController.loadComplete();
      } else {
        logger.w('不支持的分页类型');
      }
      change(state, status: RxStatus.success());
      onDataLoaded();
    } catch (e) {
      logger.e('加载更多失败了...「$e」');
      refreshController.loadNoData();
    } finally {
      isFetching = false;
    }
  }

  ///下一页
  Future<T> loadMore(int page) async {
    (pageParams ??= PageParams.init()).page = page;
    return requestFunc();
  }

  // int get getItemTotal {
  //   if (state is ListResponse) {
  //     return (state as ListResponse?)?.count ?? 0;
  //   }
  //   return 0;
  // }

  int get getItemCount {
    if (state is List) {
      return (state as List?)?.length ?? 0;
    }
    return 0;
  }

  M? indexOfItem<M>(int index) {
    if (state is List) {
      return (state as List?)?[index] as M?;
    }
    return null;
  }

  void onDataLoaded() {}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    if (supportPagination) {
      // refreshController = RefreshController();
      onRefresh();
    }
    super.onReady();
  }

  @override
  void onClose() {
    // refreshController.dispose();
    super.onClose();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
