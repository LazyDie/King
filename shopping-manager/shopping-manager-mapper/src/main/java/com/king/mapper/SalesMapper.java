package com.king.mapper;

import com.king.pojo.Sales;
import com.king.pojo.SalesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SalesMapper {
    int countByExample(SalesExample example);

    int deleteByExample(SalesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Sales record);

    int insertSelective(Sales record);

    List<Sales> selectByExample(SalesExample example);

    Sales selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Sales record, @Param("example") SalesExample example);

    int updateByExample(@Param("record") Sales record, @Param("example") SalesExample example);

    int updateByPrimaryKeySelective(Sales record);

    int updateByPrimaryKey(Sales record);
    
    List<Sales> selectAll();
    
    List<Sales> selectXiaoLiang();
}