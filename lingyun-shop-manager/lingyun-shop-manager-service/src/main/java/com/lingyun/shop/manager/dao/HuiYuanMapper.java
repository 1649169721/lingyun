package com.lingyun.shop.manager.dao;

import com.lingyun.shop.manager.common.entity.HuiYuan;

import java.util.List;

public interface HuiYuanMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(HuiYuan record);

    int insertSelective(HuiYuan record);

    HuiYuan selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HuiYuan record);

    int updateByPrimaryKey(HuiYuan record);

    public List<HuiYuan> findtwo(HuiYuan huiYuan);
}