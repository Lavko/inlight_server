package com.msz.inhouse.inserver.webservice;

import com.msz.inhouse.inlight.container.Group;
import com.msz.inhouse.inserver.container.Commands;
import com.msz.inhouse.inserver.service.InLightService;
import com.msz.inhouse.inserver.util.GroupMapper;
import javafx.scene.paint.Color;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(path="/inlight")
public class InLightWebservice {

    @Autowired
    InLightService inLightService;

    @GetMapping(path="/findMyController")
    public @ResponseBody String findMyController() {
        return inLightService.findMyController();
    }

    @GetMapping(path="/switchOn")
    public @ResponseBody String switchOn(@RequestParam String group) {
        inLightService.command(Commands.SWITCH_ON, GroupMapper.getGroup(group));
        return "Done";
    }

    @GetMapping(path="/switchOff")
    public @ResponseBody String switchOff(@RequestParam String group) {
        inLightService.command(Commands.SWITCH_OFF, GroupMapper.getGroup(group));
        return "Done";
    }

    @GetMapping(path="/setWhite")
    public @ResponseBody String setWhite(@RequestParam String group) {
        inLightService.command(Commands.SET_WHITE, GroupMapper.getGroup(group));
        return "Done";
    }

    @GetMapping(path="/setHue")
    public @ResponseBody String setHue(@RequestParam String hue) {
        inLightService.command(Commands.SET_HUE, Group.ALL, Double.parseDouble(hue));
        return "Done";
    }

    @GetMapping(path="/setBrightness")
    public @ResponseBody String setBrightness(@RequestParam String percent) {
        inLightService.command(Commands.SET_BRIGHTNESS, Group.ALL, Integer.parseInt(percent));
        return "Done";
    }

    @GetMapping(path="/setColor")
    public @ResponseBody String setColor(@RequestParam String colorName) {
        Color color = Color.valueOf(colorName);
        inLightService.command(Commands.SET_BRIGHTNESS, Group.ALL, color);
        return "Done";
    }
}
