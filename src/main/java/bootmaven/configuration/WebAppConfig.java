package bootmaven.configuration;

import bootmaven.converter.UserConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.format.FormatterRegistry;
import org.springframework.ui.freemarker.FreeMarkerConfigurationFactoryBean;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebAppConfig implements WebMvcConfigurer {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("/admin/login");
        registry.addViewController("/403").setViewName("403");
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(getUserConverter());
    }

    @Bean
    public UserConverter getUserConverter() {
        return new UserConverter();
    }

}
