package com.lingyun.shop.manager.controller;

import com.lingyun.shop.manager.common.entity.HuiYuan;
import com.lingyun.shop.manager.common.entity.MemberRank;
import com.lingyun.shop.manager.common.interfaces.MemberRankServiceApi;
import com.lingyun.shop.manager.service.MemberRankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class MemberRankController implements MemberRankServiceApi {

    @Autowired
    private MemberRankService memberRankService;

    @Override
    public List<MemberRank> findAll(MemberRank memberRank) {
        return memberRankService.findAll(memberRank);
    }

    @Override
    public void deleteMemberRank(String ids) {
        memberRankService.deleteMemberRank(ids);
    }

    @Override
    public MemberRank findOne(Long id) {
        return memberRankService.findOne(id);
    }

    @Override
    public void updatehuiyuan(MemberRank memberRank) {
        memberRankService.updatehuiyuan(memberRank);
    }

    @Override
    public void toAdd01(MemberRank memberRank) {
        memberRankService.toAdd01(memberRank);
    }

    @Override
    public List<HuiYuan> findtwo(HuiYuan huiYuan) {
        return memberRankService.findtwo(huiYuan);
    }

    @Override
    public void deleteMember(String ids) {
        memberRankService.deleteMember(ids);
    }

}
