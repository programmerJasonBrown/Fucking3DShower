package example.service.impl;


import example.mapper.PositionMapper;
import example.domain.Position;
import example.domain.PositionExample;
import example.pojo.Point;
import example.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: my3DShower
 * @description:
 * @author: Chao Qian
 * @create: 2018-10-22 20:37
 **/
@Service("positionService")
public class PositionServiceImpl implements PositionService {

    @Autowired
    private PositionMapper positionMapper;

    @Override
    public Point getPosition() {
        PositionExample positionExample = new PositionExample();
        positionExample.createCriteria().andStateEqualTo("Y");
        List<Position> positionList = positionMapper.selectByExample(positionExample);
        if (positionList == null || positionList.size() == 0) {
            return new Point(0, 0, 0, "N");
        } else {
            Position position = positionList.get(0);
            Point point = new Point(position.getX(), position.getY(), position.getZ(), position.getState());
            position.setState("N");
            positionMapper.updateByPrimaryKey(position);
            return point;
        }
    }
}
