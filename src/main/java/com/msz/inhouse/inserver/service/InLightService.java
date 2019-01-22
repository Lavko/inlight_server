package com.msz.inhouse.inserver.service;

import com.msz.inhouse.inlight.Controller;
import com.msz.inhouse.inlight.container.ControllerNotFoundException;
import com.msz.inhouse.inlight.container.Group;
import com.msz.inhouse.inlight.service.DiscoverService;
import com.msz.inhouse.inserver.container.Commands;
import javafx.scene.paint.Color;
import lombok.extern.java.Log;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
@Log
public class InLightService {

    private Controller controller;

    public void createController(String ipAddress) {
        this.controller = new Controller(ipAddress);
    }

    public String findMyController() {
        DiscoverService discoverService = new DiscoverService();
        try {
            this.controller = discoverService.discoverWifiBox();
            log.info("Found controller at " + this.controller.getIpAddress());
            return "Found controller at " + this.controller.getIpAddress();
        } catch (ControllerNotFoundException e) {
            log.warning(e.getMessage());
        } catch (IOException e) {
            log.warning(e.getMessage());
        }
        return "Controller not found";
    }

    public void command(Commands command, Group group) {
        this.command(command, group, 0, 0, null);
    }

    public void command(Commands command, Group group, int value) {
        this.command(command, group, value, 0, null);
    }

    public void command(Commands command, Group group, double value) {
        this.command(command, group, 0, value, null);
    }

    public void command(Commands command, Group group, Color color) {
        this.command(command, group, 0, 0, color);
    }

    private void command(Commands command, Group group, int brightnessPercent, double hueValue, Color color) {
        try {
            switch (command) {
                case SWITCH_ON:
                    controller.on(group);
                    break;
                case SWITCH_OFF:
                    controller.off(group);
                    break;
                case SET_WHITE:
                    controller.setWhite(group);
                    break;
                case SET_BRIGHTNESS:
                    controller.setBrightness(brightnessPercent);
                    break;
                case SET_HUE:
                    controller.setHue(hueValue);
                    break;
                case SET_COLOR:
                    if(color == null) {
                        log.warning("Color was null.");
                        break;
                    }
                    controller.setColor(color);
                    break;
            }
        }catch (IOException e) {
            log.warning(e.getMessage());
        }
    }
}
