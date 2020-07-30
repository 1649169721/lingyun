package com.lingyun.shop.manager.service;

import com.lingyun.shop.manager.common.entity.HuiYuan;
import com.lingyun.shop.manager.common.entity.MemberRank;

import java.util.List;

public interface MemberRankService {

    public List<MemberRank> findAll(MemberRank memberRank);

    public void deleteMemberRank(String ids);

    MemberRank findOne(Long id);

    void updatehuiyuan(MemberRank memberRank);

    void toAdd01(MemberRank memberRank);

    public List<HuiYuan> findtwo(HuiYuan huiYuan);

    void deleteMember(String ids);
}
