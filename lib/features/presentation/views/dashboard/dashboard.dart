import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snapbite/features/data/models/responses/menu_list_response.dart';
import 'package:snapbite/features/presentation/bloc/menu/menu_bloc.dart';
import 'package:snapbite/utils/app_dimensions.dart';
import 'package:snapbite/utils/app_images.dart';

import '../../../../core/service/dependency_injection.dart';
import '../../../../utils/app_colors.dart';
import '../../bloc/base_bloc.dart';
import '../../bloc/base_event.dart';
import '../../bloc/base_state.dart';
import '../base_view.dart';

class DashboardView extends BaseView {
  DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends BaseViewState<DashboardView> {
  var bloc = injection<MenuBloc>();
  MenuResult? menuResult;
  Menu? selectedMenu;

  @override
  void initState() {
    super.initState();
    bloc.add(GetMenuListEvent());
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.initColors().nonChangeWhite,
        body: BlocProvider<MenuBloc>(
          create: (_) => bloc,
          child: BlocListener<MenuBloc, BaseState<MenuState>>(
            listener: (_, state) async {
              if (state is GetMenuListSuccessState) {
                setState(() {
                  menuResult = state.menuResult;
                  selectedMenu = menuResult!.menu!.first;
                });
              }
            },
            child: menuResult != null
                ? Stack(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                AppImages.shopCover,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned.fill(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromRGBO(0, 0, 0, 0),
                                        Colors.black,
                                      ],
                                      stops: [0.0439, 1.0],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 24.w,
                                  right: 19.w,
                                  top: 101.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'El Cabanyal',
                                          style: TextStyle(
                                            fontSize: AppDimensions.kFontSize32,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.initColors().white,
                                          ),
                                        ),
                                        Text(
                                          'FASTFOOD · BURGERS',
                                          style: TextStyle(
                                            fontSize: AppDimensions.kFontSize14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.initColors().white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      AppImages.shopLogo,
                                      height: 61.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 49.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          left: 16.w,
                                          right: 8.w,
                                          top: 8.h,
                                          bottom: 8.h,
                                        ),
                                        decoration: BoxDecoration(
                                            color: AppColors.initColors()
                                                .tabBorderColor,
                                            borderRadius:
                                                BorderRadius.circular(8.r)),
                                        child: Row(
                                          children: [
                                            Text(
                                              selectedMenu!.title!.en ?? '',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    AppDimensions.kFontSize14,
                                                color: AppColors.initColors()
                                                    .menuColor,
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              size: 20.h,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      AppImages.icSearch2,
                                      height: 32.h,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 32.h),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 215.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23.92.r),
                                color: AppColors.initColors().white,
                                border: Border.all(
                                  color: AppColors.initColors().tabBorderColor,
                                  width: 1.w,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(23.92.r),
                                child: Container(
                                  height: 42.h,
                                  width: 209.w,
                                  color: AppColors.initColors().white,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          color: AppColors.initColors().white,
                                          child: Center(
                                            child: Image.asset(
                                              AppImages.icScooter,
                                              height: 22.h,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: AppColors.initColors()
                                              .tabSelectColor,
                                          child: Center(
                                            child: Image.asset(
                                              AppImages.icTakeaway,
                                              height: 22.h,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: AppColors.initColors().white,
                                          child: Center(
                                            child: Image.asset(
                                              AppImages.icPickup,
                                              height: 22.h,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : SizedBox.shrink(),
          ),
        ));
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
