package com.lingyun.shop.manager.controller;

import com.lingyun.shop.manager.common.entity.HuiYuan;
import com.lingyun.shop.manager.common.entity.MemberRank;
import com.lingyun.shop.manager.common.pojo.Result;
import com.lingyun.shop.manager.service.MemberRankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/memberRank")
public class MemberRankController {

    @Autowired
    private MemberRankService memberRankService;

    @RequestMapping("/findAll")
    public List<MemberRank> findAll(MemberRank memberRank) {
        return memberRankService.findAll(memberRank);
    }

    @RequestMapping("/deleteMemberRank")
    public void deleteMemberRank(String ids) {
        memberRankService.deleteMemberRank(ids);
    }

    @RequestMapping("/findOne")
    public MemberRank findOne(Long id) {
        return memberRankService.findOne(id);
    }


    @RequestMapping("/updatehuiyuan")
    public Result updatehuiyuan(MemberRank memberRank) {
        try {
            memberRankService.updatehuiyuan(memberRank);
            return new Result(true, "修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "修改失败！");
        }
    }

    @RequestMapping("/toAdd01")
    public Result toAdd01(MemberRank memberRank) {
        try {
            memberRankService.toAdd01(memberRank);
            return new Result(true, "新增成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "新增失败！");
        }
    }

    @RequestMapping("/findtwo")
    public List<HuiYuan> findtwo(HuiYuan huiYuan) {
        return memberRankService.findtwo(huiYuan);
    }

    @RequestMapping("/deleteMember")
    public void deleteMember(String ids) {
        memberRankService.deleteMember(ids);
    }


}
