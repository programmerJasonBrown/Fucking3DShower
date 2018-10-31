package example.controller;

import example.pojo.Point;
import example.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @program: my3DShower
 * @description:
 * @author: Chao Qian
 * @create: 2018-10-18 14:45
 **/
@Controller
@RequestMapping("/home")
public class IndexController {

    @Autowired
    private PositionService positionService;

    @RequestMapping("/index")
    public String index() {
        return "homePage";
    }

    @RequestMapping("/test")
    @ResponseBody
    public Point test(){
        System.out.println(positionService);
        return positionService.getPosition();

//        return new Point(1,2,3,"N");
    }


}
