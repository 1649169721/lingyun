package com.lingyun.shop.manager.dao;

import com.lingyun.shop.manager.common.entity.MemberRank;

import java.util.List;

public interface MemberRankMapper {
    int deleteByPrimaryKey(Long id);

    int insert(MemberRank record);

    int insertSelective(MemberRank record);

    MemberRank selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(MemberRank record);

    int updateByPrimaryKey(MemberRank record);

    public List<MemberRank> findAll(MemberRank memberRank);

    MemberRank findOne(Long id);
}