package com.lingyun.shop.manager.common.interfaces;

import com.lingyun.shop.manager.common.entity.HuiYuan;
import com.lingyun.shop.manager.common.entity.MemberRank;
import org.springframework.web.bind.annotation.*;

import java.util.List;

public interface MemberRankServiceApi {

    @RequestMapping(value = "/findAll")
    public List<MemberRank> findAll(@RequestBody MemberRank memberRank);

    @RequestMapping(value = "/deleteMemberRank", method = RequestMethod.POST)
    public void deleteMemberRank(@RequestParam(value = "ids") String ids);

    @RequestMapping(value = "/findOne", method = RequestMethod.POST)
    public MemberRank findOne(@RequestParam(value = "id") Long id);

    @RequestMapping(value = "/updatehuiyuan", method = RequestMethod.POST)
    public void updatehuiyuan(@RequestBody MemberRank memberRank);

    @RequestMapping(value = "/toAdd01", method = RequestMethod.POST)
    public void toAdd01(@RequestBody MemberRank memberRank);

    @RequestMapping(value = "/findtwo", method = RequestMethod.POST)
    public List<HuiYuan> findtwo(@RequestBody HuiYuan huiYuan);

    @RequestMapping(value = "/deleteMember", method = RequestMethod.POST)
    public void deleteMember(@RequestParam(value = "ids") String ids);

}
