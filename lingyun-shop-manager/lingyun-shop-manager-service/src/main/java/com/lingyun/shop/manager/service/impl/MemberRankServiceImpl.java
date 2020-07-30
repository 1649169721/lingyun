package com.lingyun.shop.manager.service.impl;

import com.lingyun.shop.manager.common.entity.HuiYuan;
import com.lingyun.shop.manager.common.entity.MemberRank;
import com.lingyun.shop.manager.dao.HuiYuanMapper;
import com.lingyun.shop.manager.dao.MemberRankMapper;
import com.lingyun.shop.manager.service.MemberRankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberRankServiceImpl implements MemberRankService {

    @Autowired
    private MemberRankMapper memberRankMapper;

    @Autowired
    private HuiYuanMapper huiYuanMapper;

    @Override
    public List<MemberRank> findAll(MemberRank memberRank) {
        return memberRankMapper.findAll(memberRank);
    }

    @Override
    public void deleteMemberRank(String ids) {
        String[] split = ids.split(",");
        for (int i = 0; i < split.length; i++) {
            if (split[i] != null && !"".equals(split[i])) {
                memberRankMapper.deleteByPrimaryKey(Long.valueOf(split[i].trim()));
            }
        }
    }

    @Override
    public MemberRank findOne(Long id) {
        return memberRankMapper.findOne(id);
    }

    @Override
    public void updatehuiyuan(MemberRank memberRank) {
        memberRankMapper.updateByPrimaryKey(memberRank);
    }

    @Override
    public void toAdd01(MemberRank memberRank) {
        memberRankMapper.insert(memberRank);
    }

    @Override
    public List<HuiYuan> findtwo(HuiYuan huiYuan) {
        return huiYuanMapper.findtwo(huiYuan);
    }

    @Override
    public void deleteMember(String ids) {
        String[] split = ids.split(",");
        for (int i = 0; i < split.length; i++) {
            if (split[i] != null && !"".equals(split[i])) {
                huiYuanMapper.deleteByPrimaryKey(Integer.valueOf(split[i].trim()));
            }
        }
    }

}
