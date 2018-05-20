package com.king.mapper;

import com.king.pojo.Consumer;
import com.king.pojo.ConsumerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ConsumerMapper {
    int countByExample(ConsumerExample example);

    int deleteByExample(ConsumerExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Consumer record);

    int insertSelective(Consumer record);

    List<Consumer> selectByExample(ConsumerExample example);

    Consumer selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Consumer record, @Param("example") ConsumerExample example);

    int updateByExample(@Param("record") Consumer record, @Param("example") ConsumerExample example);

    int updateByPrimaryKeySelective(Consumer record);

    int updateByPrimaryKey(Consumer record);
    
    List<Consumer> selectAll();
    
    List<Consumer> selectByName(String name);
}