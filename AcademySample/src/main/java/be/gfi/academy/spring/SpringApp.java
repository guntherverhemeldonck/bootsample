package be.gfi.academy.spring;

import be.gfi.academy.Project;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringApp {

    public static void main(String[] args) {
        ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        Project project = (Project) ctx.getBean("project");
        ctx.close();
        System.out.printf("Project %s\n", project.getProjectName());
    }
}
