package com.lingyun.shop.manager.service;

import com.lingyun.shop.manager.common.entity.HuiYuan;
import com.lingyun.shop.manager.common.entity.MemberRank;
import com.lingyun.shop.manager.common.interfaces.MemberRankServiceApi;
import org.springframework.cloud.openfeign.FeignClient;

import java.util.List;

@FeignClient(value = "lingyun-shop-manager-service")
public interface MemberRankService extends MemberRankServiceApi {


}
