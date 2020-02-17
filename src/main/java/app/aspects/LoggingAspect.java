package app.aspects;

import org.aopalliance.intercept.Joinpoint;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {
    Logger logger = Logger.getLogger(this.getClass().getSimpleName());

    @Pointcut("execution(* app.controller.*.*(..))")
    private void forController() {
    }

    @Pointcut("execution(* app.service.*.*(..))")
    private void forService() {
    }

    @Pointcut("execution(* app.dao.*.*(..))")
    private void forDao() {
    }

    @Pointcut("forController() || forService() || forDao()")
    private void forAllApp() {
    }

    @Before("forAllApp()")
    public void before(JoinPoint joinPoint) {
        String method = joinPoint.getSignature().toShortString();
        logger.info("Logger:   @Before in ----> " + method);
        Object[] args = joinPoint.getArgs();
        for (Object cur : args) {
            logger.info("Logger:   argument -> " + cur);
        }
    }

    @AfterReturning(pointcut = "forAllApp()", returning = "result")
    public void after(JoinPoint joinPoint, Object result) {
        String method = joinPoint.getSignature().toShortString();
        logger.info("Logger:   @AfterReturning in ----> " + method);
        logger.info("Logger:   results ->" + result);
    }
}
