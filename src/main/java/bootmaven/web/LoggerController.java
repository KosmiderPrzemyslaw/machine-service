package bootmaven.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
public class LoggerController {
    private final Logger logger = LoggerFactory.getLogger(LoggerController.class);
}
