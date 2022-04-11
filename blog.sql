/*
 Navicat Premium Data Transfer

 Source Server         : yyj
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 10/08/2021 19:51:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appreciation` bit(1) NOT NULL,
  `commentabled` bit(1) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `first_picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `share_statement` bit(1) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `views` int NULL DEFAULT NULL,
  `type_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK292449gwg5yf7ocdlmswv9w4j`(`type_id`) USING BTREE,
  INDEX `FK8ky5rrsxh01nkhctmo7d48p82`(`user_id`) USING BTREE,
  CONSTRAINT `FK292449gwg5yf7ocdlmswv9w4j` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8ky5rrsxh01nkhctmo7d48p82` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES (3, b'1', b'1', '对于 Spring和 SpringBoot到底有什么区别，我听到了很多答案，刚开始迈入学习 SpringBoot的我当时也是一头雾水，随着经验的积累、我慢慢理解了这两个框架到底有什么区别，相信对于用了 SpringBoot很久的同学来说，还不是很理解 SpringBoot到底和 Spring有什么区别，看完文章中的比较，或许你有了不同的答案和看法！\r\n\r\n什么是Spring\r\n作为 Java开发人员，大家都 Spring都不陌生，简而言之， Spring框架为开发 Java应用程序提供了全面的基础架构支持。\r\n\r\n它包含一些很好的功能，如依赖注入和开箱即用的模块，如： SpringJDBC、SpringMVC、SpringSecurity、SpringAOP、SpringORM、SpringTest，这些模块缩短应用程序的开发时间，提高了应用开发的效率例如，在 JavaWeb开发的早期阶段，我们需要编写大量的代码来将记录插入到数据库中。\r\n\r\n但是通过使用 SpringJDBC模块的 JDBCTemplate，我们可以将操作简化为几行代码。\r\n\r\n什么是Spring Boot\r\nSpringBoot基本上是 Spring框架的扩展，它消除了设置 Spring应用程序所需的 XML配置，为更快，更高效的开发生态系统铺平了道路。\r\n\r\nSpringBoot中的一些特征：\r\n\r\n1、创建独立的 Spring应用。\r\n\r\n2、嵌入式 Tomcat、 Jetty、 Undertow容器（无需部署war文件）。\r\n\r\n3、提供的 starters 简化构建配置\r\n\r\n4、尽可能自动配置 spring应用。 5、提供生产指标,例如指标、健壮检查和外部化配置\r\n\r\n6、完全没有代码生成和 XML配置要求\r\n\r\n从配置分析\r\nMaven依赖\r\n\r\n首先，让我们看一下使用Spring创建Web应用程序所需的最小依赖项\r\n\r\n	<dependency>\r\n		<groupId>org.springframework</groupId>\r\n		<artifactId>spring-web</artifactId>\r\n		<version>5.1.0.RELEASE</version>\r\n	</dependency>\r\n	<dependency>\r\n		<groupId>org.springframework</groupId>\r\n		<artifactId>spring-webmvc</artifactId>\r\n		<version>5.1.0.RELEASE</version>\r\n	</dependency>\r\n与Spring不同，Spring Boot只需要一个依赖项来启动和运行Web应用程序：\r\n\r\n	<dependency>\r\n		<groupId>org.springframework.boot</groupId>\r\n		<artifactId> spring-boot-starter-web</artifactId>\r\n		<version>2.0.6.RELEASE</version>\r\n	</dependency>\r\n在进行构建期间，所有其他依赖项将自动添加到项目中。\r\n\r\n另一个很好的例子就是测试库。我们通常使用 SpringTest， JUnit， Hamcrest和 Mockito库。在 Spring项目中，我们应该将所有这些库添加为依赖项。但是在 SpringBoot中，我们只需要添加 spring-boot-starter-test依赖项来自动包含这些库。\r\n\r\nSpring Boot为不同的Spring模块提供了许多依赖项。一些最常用的是：\r\n\r\nspring-boot-starter-data-jpa spring-boot-starter-security spring-boot-starter-test spring-boot-starter-web spring-boot-starter-thymeleaf\r\n\r\n有关 starter的完整列表，请查看Spring文档。\r\n\r\nMVC配置\r\n\r\n让我们来看一下 Spring和 SpringBoot创建 JSPWeb应用程序所需的配置。\r\n\r\nSpring需要定义调度程序 servlet，映射和其他支持配置。我们可以使用 web.xml 文件或 Initializer类来完成此操作：\r\n\r\n	public class MyWebAppInitializer implements WebApplicationInitializer {\r\n		@Override\r\n		public void onStartup(ServletContext container) {\r\n			AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();\r\n			context.setConfigLocation(\"com.pingfangushi\");\r\n			container.addListener(new ContextLoaderListener(context));\r\n			ServletRegistration.Dynamic dispatcher = container.addServlet(\r\n					\"dispatcher\", new DispatcherServlet(context));\r\n			dispatcher.setLoadOnStartup(1);\r\n			dispatcher.addMapping(\"/\");\r\n		}\r\n	}\r\n还需要将 @EnableWebMvc注释添加到 @Configuration类，并定义一个视图解析器来解析从控制器返回的视图：\r\n\r\n@EnableWebMvc\r\n@Configuration\r\npublic class ClientWebConfig implements WebMvcConfigurer {\r\n    @Bean\r\n    public ViewResolver viewResolver() {\r\n        InternalResourceViewResolver bean = new InternalResourceViewResolver();\r\n        bean.setViewClass(JstlView.class);\r\n        bean.setPrefix(\"/WEB-INF/view/\");\r\n        bean.setSuffix(\".jsp\");\r\n        return bean;\r\n    }\r\n}复制代码\r\n再来看 SpringBoot一旦我们添加了 Web启动程序， SpringBoot只需要在 application配置文件中配置几个属性来完成如上操作：\r\n\r\nspring.mvc.view.prefix=/WEB-INF/jsp/ spring.mvc.view.suffix=.jsp 上面的所有Spring配置都是通过一个名为auto-configuration的过程添加 Bootweb starter来自动包含的。\r\n\r\n这意味着 SpringBoot将查看应用程序中存在的依赖项，属性和 bean，并根据这些依赖项，对属性和 bean进行配置。当然，如果我们想要添加自己的自定义配置，那么 SpringBoot自动配置将会退回。\r\n\r\n配置模板引擎\r\n现在我们来看下如何在Spring和Spring Boot中配置Thymeleaf模板引擎。\r\n\r\n在 Spring中，我们需要为视图解析器添加 thymeleaf-spring5依赖项和一些配置：\r\n\r\n	@Configuration\r\n	@EnableWebMvc\r\n	public class MvcWebConfig implements WebMvcConfigurer {\r\n		@Autowired\r\n		private ApplicationContext applicationContext;\r\n\r\n		@Bean\r\n		public SpringResourceTemplateResolver templateResolver() {\r\n			SpringResourceTemplateResolver templateResolver = new SpringResourceTemplateResolver();\r\n			templateResolver.setApplicationContext(applicationContext);\r\n			templateResolver.setPrefix(\"/WEB-INF/views/\");\r\n			templateResolver.setSuffix(\".html\");\r\n			return templateResolver;\r\n		}\r\n\r\n		@Bean\r\n		public SpringTemplateEngine templateEngine() {\r\n			SpringTemplateEngine templateEngine = new SpringTemplateEngine();\r\n			templateEngine.setTemplateResolver(templateResolver());\r\n			templateEngine.setEnableSpringELCompiler(true);\r\n			return templateEngine;\r\n		}\r\n\r\n		@Override\r\n		public void configureViewResolvers(ViewResolverRegistry registry) {\r\n			ThymeleafViewResolver resolver = new ThymeleafViewResolver();\r\n			resolver.setTemplateEngine(templateEngine());\r\n			registry.viewResolver(resolver);\r\n		}\r\n	}\r\nSpringBoot1X只需要 spring-boot-starter-thymeleaf的依赖项来启用 Web应用程序中的 Thymeleaf支持。\r\n\r\n但是由于 Thymeleaf3.0中的新功能，我们必须将 thymeleaf-layout-dialect 添加为SpringBoot2XWeb应用程序中的依赖项。配置好依赖，我们就可以将模板添加到 src/main/resources/templates文件夹中， SpringBoot将自动显示它们。\r\n\r\nSpring Security 配置\r\n\r\n为简单起见，我们使用框架默认的 HTTPBasic身份验证。让我们首先看一下使用 Spring启用 Security所需的依赖关系和配置。\r\n\r\n	@Configuration\r\n	@EnableWebSecurity\r\n	public class CustomWebSecurityConfigurerAdapter extends\r\n			WebSecurityConfigurerAdapter {\r\n		@Autowired\r\n		public void configureGlobal(AuthenticationManagerBuilder auth)\r\n				throws Exception {\r\n			auth.inMemoryAuthentication().withUser(\"admin\")\r\n					.password(passwordEncoder().encode(\"password\"))\r\n					.authorities(\"ROLE_ADMIN\");\r\n		}\r\n\r\n		@Override\r\n		protected void configure(HttpSecurity http) throws Exception {\r\n			http.authorizeRequests().anyRequest().authenticated().and().httpBasic();\r\n		}\r\n\r\n		@Bean\r\n		public PasswordEncoder passwordEncoder() {\r\n			return new BCryptPasswordEncoder();\r\n		}\r\n	}\r\n这里我们使用 inMemoryAuthentication来设置身份验证。同样， SpringBoot也需要这些依赖项才能使其工作。但是我们只需要定义 spring-boot-starter-security的依赖关系，因为这会自动将所有相关的依赖项添加到类路径中。\r\n\r\nSpringBoot中的安全配置与上面的相同 。\r\n\r\n应用程序启动引导配置\r\n\r\nSpring和 SpringBoot中应用程序引导的基本区别在于 servlet。Spring使用 web.xml 或 SpringServletContainerInitializer作为其引导入口点。SpringBoot仅使用 Servlet3功能来引导应用程序，下面让我们详细来了解下。\r\n\r\nSpring 引导配置 Spring支持传统的 web.xml引导方式以及最新的 Servlet3+方法。\r\n\r\n配置 web.xml方法启动的步骤\r\n\r\nServlet容器（服务器）读取 web.xml\r\nweb.xml中定义的 DispatcherServlet由容器实例化\r\nDispatcherServlet通过读取 WEB-INF/{servletName}-servlet.xml来创建WebApplicationContext。最后， DispatcherServlet注册在应用程序上下文中定义的 bean\r\n使用 Servlet3+方法的 Spring启动步骤\r\n容器搜索实现\r\n\r\nServletContainerInitializer的类并执行\r\nSpringServletContainerInitializer找到实现所有类\r\nWebApplicationInitializerWebApplicationInitializer创建具有XML或上下文 @Configuration类 WebApplicationInitializer创建 DispatcherServlet与先前创建的上下文。\r\nSpringBoot 引导配置\r\n\r\nSpring Boot应用程序的入口点是使用@SpringBootApplication注释的类\r\n\r\n	@SpringBootApplication\r\n	public class Application {\r\n		public static void main(String[] args) {\r\n			SpringApplication.run(Application.class, args);\r\n		}\r\n	}\r\n默认情况下， SpringBoot使用嵌入式容器来运行应用程序。在这种情况下， SpringBoot使用 publicstaticvoidmain入口点来启动嵌入式 Web服务器。\r\n\r\n此外，它还负责将 Servlet， Filter和 ServletContextInitializerbean从应用程序上下文绑定到嵌入式 servlet容器。SpringBoot的另一个特性是它会自动扫描同一个包中的所有类或 Main类的子包中的组件。\r\n\r\nSpringBoot提供了将其部署到外部容器的方式。我们只需要扩展 SpringBootServletInitializer即可：\r\n\r\n	/**\r\n	 * War部署\r\n	 */\r\n	public class ServletInitializer extends SpringBootServletInitializer {\r\n		@Override\r\n		protected SpringApplicationBuilder configure(\r\n				SpringApplicationBuilder application) {\r\n			return application.sources(Application.class);\r\n		}\r\n\r\n		@Override\r\n		public void onStartup(ServletContext servletContext)\r\n				throws ServletException {\r\n			super.onStartup(servletContext);\r\n			servletContext.addListener(new HttpSessionEventPublisher());\r\n		}\r\n	}\r\n这里外部 servlet容器查找在war包下的 META-INF文件夹下MANIFEST.MF文件中定义的 Main-class， SpringBootServletInitializer将负责绑定 Servlet， Filter和 ServletContextInitializer。\r\n\r\n打包和部署\r\n最后，让我们看看如何打包和部署应用程序。这两个框架都支持 Maven和 Gradle等通用包管理技术。但是在部署方面，这些框架差异很大。例如，Spring Boot Maven插件在 Maven中提供 SpringBoot支持。它还允许打包可执行 jar或 war包并 就地运行应用程序。\r\n\r\n在部署环境中 SpringBoot 对比 Spring的一些优点包括：\r\n\r\n1、提供嵌入式容器支持\r\n\r\n2、使用命令_java -jar_独立运行jar\r\n\r\n3、在外部容器中部署时，可以选择排除依赖关系以避免潜在的jar冲突\r\n\r\n4、部署时灵活指定配置文件的选项\r\n\r\n5、用于集成测试的随机端口生成', '2021-08-07 00:22:02', 'Spring Boot和Spring的区别', 'https://cdn.educba.com/academy/wp-content/uploads/2019/04/what-is-spring-boot.jpg', '转载', b'1', b'1', b'0', 'Spring 和 Spring Boot 的区别', '2021-08-07 00:31:30', 3, 5, 1);
INSERT INTO `t_blog` VALUES (4, b'1', b'1', '最近经理说，要把项目搭成Spring Boot + Spring Cloud + Docker，恩~，我看出来这是在给我自己研究技术的机会（然后抱着马上就要成为后台大神的幻想开始YY，咳，快醒醒，那个啥已经亡啦，抓紧时间撸代码=。=）。于是就开始了一个小小白的BCD（Spring Boot，Spring Cloud，Docker，简称BCD，哈哈哈）之旅。\r\n\r\n首先申明，该篇文章会与个人研究进度有关，并保证不断更新文章直到整个框架整合完整，本人尽量同步进行整理与更新。将搭建中的各种尝试与问题尽可能全的进行梳理。对于读者自己尝试搭建可能遇到的问题，由于本人没有遇到所以可能无法作答，请见谅。如文中有理解错误或理解不到位的地方欢迎指出。\r\n\r\n搭建环境\r\nIntelliJ IDEA\r\njdk1.8\r\nMacBook Pro（i7，16G，512G，哈哈哈我就是来装逼的）\r\n\r\n第一步应该傻子都会吧。\r\n\r\n然后选择Spring Initializr，选好jdk路径，如果配置过的话应该是自动会有的，然后点Next。\r\n\r\nType中可以选Maven和Gradle，因为之前的项目是用Maven，所以这里就选了Maven；Language可以选Java，Kotlin，Groovy；Packaging可以选Jar和War。（其实我超想选Gradle和Kotlin，毕竟Android是我老本行=。=），然后点Next。\r\n\r\nSpring Boot选了2.0.0 M4，然后选择Web模块里面的Web（可以看到是集成了Tomcat和Spring MVC，不得不感叹IDEA真是太强大了），对，就只选这一个就可以把Spring Boot搭起来了，再点Next。\r\n\r\n这边可以修改项目名称，也就是Project name，其他可以不用动，点Finish，等待编译完成，项目就创建成功了。\r\n\r\n创建成功之后，项目结构就会像这样。application.properties是整个项目的配置文件。resources顾名思义是放一些资源文件的，其中static文件夹是放js，css，img等静态资源文件而templates文件夹是放html或者其他的一些模板文件的，这具体得看你使用什么模板进行前端的开发。BcdApplication是IDEA自动帮你创建的，如下图。\r\n\r\nController\r\n项目搭起来以后，首先写一个controller。\r\n\r\n在templates文件夹下面新建一个html文件。\r\n创建一个controller的文件夹，添加一个BcdController，添加映射到bcd.html，启动项目。在浏览器输入localhost:8080/bcd回车，见证奇迹的时刻。\r\n\r\n额。。。等等，让我想想，赶紧百度了Spring Boot配置JSP，嗯，然后说不推荐JSP让我用thymeleaf。在pom.xml中加上thymeleaf的依赖。\r\n\r\n重启一下项目。\r\n\r\nPerfect!!!\r\n然后问题又来了，Q1：如果我要向前端页面传数据呢，之前都是用的JSP，而现在是html。于是又是一通乱百，找到一个解决方法。那就是用HttpServletRequest或者Model或者Map。\r\n\r\nhtml1.png\r\n这就是thymeleaf的神奇之处，这样就能把数据传到前台了。\r\n然后问题又来了，Q2：如果我想传Java Bean呢，传Object而不是String。这就需要配置Json转换器，让BcdApplication继承WebMvcConfigurerAdapter，然而WebMvcConfigurerAdapter是过时的。\r\n\r\nTa让我们用WebMvcConfigurer代替，因为jdk1.8的接口可以实现默认方法。然后重写里面的configureMessageConverters方法。\r\n\r\n接着创建entity文件夹并新建一个Java Bean。\r\n\r\n在controller里面添加String-Object的返回值。\r\n\r\n然后在html里面这样写。\r\n\r\n好了，大功告成！重新运行一下项目就出来了。\r\n\r\n其实Spring除了@Controller注解，还有一个@RestController\r\n\r\n这个注解是专门用来写Rest API的，返回的直接就是转成Json的数据。\r\n\r\n原文连接：[https://www.jianshu.com/p/39afe7f498f0](https://www.jianshu.com/p/39afe7f498f0 \"原文连接\")', '2021-08-07 00:27:49', 'idea创建spring boot项目', 'https://dwglogo.com/wp-content/uploads/2017/11/IntelliJ_IDEA_logo_01.png', '转载', b'1', b'1', b'0', 'IDEA搭建Spring Boot', '2021-08-07 01:07:42', 14, 5, 1);
INSERT INTO `t_blog` VALUES (5, b'0', b'0', '[https://zhuanlan.zhihu.com/p/353775844](https://zhuanlan.zhihu.com/p/353775844 \"https://zhuanlan.zhihu.com/p/353775844\")', '2021-08-07 01:09:30', '如何利用 Github 搭建自己的免费图床？', 'https://pic3.zhimg.com/80/v2-0d40ae1fda6669eee808ec3a409a0f3a_720w.jpg', '转载', b'1', b'1', b'0', '如何利用 Github 搭建自己的免费图床？', '2021-08-07 01:13:03', 1, 6, 1);
INSERT INTO `t_blog` VALUES (6, b'0', b'1', '## 一、Java语言特点\r\nJava是一种简单、面向对象、分布式、易读、鲁棒、安全、结构明晰、可移植、高性能、多线程、动态的语言。\r\n\r\n- 面向对象（继承、封装、多态）\r\n- 一次编译，到处运行（JVM实现跨平台运行）\r\n- 可靠性\r\n- 安全性\r\n- 支持多线程（对比C++没有内置多线程机制）\r\netc...\r\n## 二、Java为什么不支持多继承？\r\n多继承：指一个子类同时继承多个父类，从而具备多个父类的特征\r\n\r\n### 多继承会造成\r\n\r\n1、若子类继承的父类中拥有相同的成员变量，子类在引用该变量时将无法判别使用哪个父类的成员变量\r\n\r\n2、若一个子类继承的多个父类拥有相同方法，同时子类并未覆盖该方法（若覆盖，则直接使用子类中该方法），那么调用该方法时将无法确定调用哪个父类的方法。\r\n\r\nJava为了简单，废弃了C++中非常容易混淆的多继承等特性。\r\n\r\n三、Java实现“多继承”的三种方式\r\n上面提到的Java不可以多继承特指类，而Java的多继承机制可以通过多层继承、内部类以及接口来实现\r\n\r\n多层继承：实际就是多个单继承累积，最下面的子类可以具备前几个父类的特征，但这样的多继承会造成代码冗余，可读性较差，一般的开发同学都不会这样浪费时间。\r\n\r\n内部类：通过成员内部类实现多继承，代码示例如下\r\n\r\n	class dota {\r\n		private String str = \"let\'s play some dota\";\r\n\r\n		public void play() {\r\n			System.out.println(str);\r\n			System.out.println(\"好呀好呀\");\r\n		}\r\n	}\r\n	class lol {\r\n		private String str2 = \"let\'s play some lol\";\r\n		public void play() {\r\n			System.out.println(str2);\r\n			System.out.println(\"不约\");\r\n		}\r\n	}\r\n	class player {\r\n		class dotar extends dota {\r\n			public void play() {\r\n				super.play();\r\n			}\r\n		}\r\n		class loler extends lol {\r\n			public void play() {\r\n				super.play();\r\n			}\r\n		}\r\n		public void play() {\r\n			dotar d = new dotar();\r\n			d.play();\r\n			loler l = new loler();\r\n			l.play();\r\n		}\r\n	}\r\n	public class MultiExtendTest1 {\r\n		public static void main(String[] args) {\r\n			player p = new player();\r\n			p.play();\r\n		}\r\n	}\r\n接口：多继承机制实现优先使用接口，接口使用比较灵活，在企业级项目编程是最推荐的方式，示例代码：\r\n\r\n	interface Dota{\r\n		void play();\r\n	}\r\n	interface Lol{\r\n		void play();\r\n	}\r\n	interface test extends Dota,Lol{\r\n		void sayhi();\r\n	}\r\n	class Player implements test,Dota,Lol{\r\n		public void play(){\r\n			System.out.println(\"let\'s play some dota\");\r\n		}\r\n		public  void sayhi(){\r\n			System.out.println(\"hi\");\r\n		}\r\n	}\r\n	public class MultiExtendTest2{\r\n		public static void main(String[] args) {\r\n			Player p=new Player();\r\n			p.play();\r\n			p.sayhi();\r\n		}\r\n	}\r\n### 接口注意事项：\r\n\r\n- 和抽象类一样，接口不能实例化，接口是特殊的抽象类\r\n- 如果一个类继承了接口，必须重写实现接口中的所有方法\r\n- 接口没有构造函数，抽象类可以有\r\n- 接口的属性都是默认static final，在定义时指定初始值，接口中只有常量，接口的方法自动用public abstract修饰，只有全局抽象方法\r\n- 接口只有方法的声明，没有方法体\r\n- 抽象类可以在不提供接口方法实现的情况下实现接口', '2021-08-07 01:15:19', 'Java 实现“多继承”', 'https://tse2-mm.cn.bing.net/th/id/OIP-C.d0NHhTUihbNfZ8bz6YXQTgHaEJ?pid=ImgDet&rs=1', '原创', b'1', b'1', b'0', 'Java 实现“多继承”', '2021-08-07 01:15:19', 3, 5, 1);
INSERT INTO `t_blog` VALUES (7, b'1', b'1', '# 测试博客111\r\n\r\n真的就只是测试哦', '2021-08-09 00:33:27', '测试博客111', 'https://tse4-mm.cn.bing.net/th/id/OIP-C.fFe8h1l-2hk0wWKxoPQgNwHaEH?pid=ImgDet&rs=1', '', b'1', b'0', b'0', '测试博客111', '2021-08-09 00:34:12', 0, 9, 1);
INSERT INTO `t_blog` VALUES (8, b'1', b'1', '# 测试博客222\r\n\r\n真的就只是测试哦', '2021-08-09 00:34:02', '测试博客222', 'https://tse4-mm.cn.bing.net/th/id/OIP-C.fFe8h1l-2hk0wWKxoPQgNwHaEH?pid=ImgDet&rs=1', '', b'1', b'0', b'0', '测试博客222', '2021-08-09 00:34:16', 0, 10, 1);
INSERT INTO `t_blog` VALUES (9, b'1', b'1', '#测试博客333\r\n\r\n真的就只是测试哦', '2021-08-09 00:34:52', '测试博客333', 'https://tse4-mm.cn.bing.net/th/id/OIP-C.fFe8h1l-2hk0wWKxoPQgNwHaEH?pid=ImgDet&rs=1', '', b'1', b'0', b'0', '测试博客333', '2021-08-09 00:34:52', 0, 11, 1);

-- ----------------------------
-- Table structure for t_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_tags`;
CREATE TABLE `t_blog_tags`  (
  `blogs_id` bigint NOT NULL,
  `tags_id` bigint NOT NULL,
  INDEX `FK5feau0gb4lq47fdb03uboswm8`(`tags_id`) USING BTREE,
  INDEX `FKh4pacwjwofrugxa9hpwaxg6mr`(`blogs_id`) USING BTREE,
  CONSTRAINT `FK5feau0gb4lq47fdb03uboswm8` FOREIGN KEY (`tags_id`) REFERENCES `t_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKh4pacwjwofrugxa9hpwaxg6mr` FOREIGN KEY (`blogs_id`) REFERENCES `t_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_blog_tags
-- ----------------------------
INSERT INTO `t_blog_tags` VALUES (3, 3);
INSERT INTO `t_blog_tags` VALUES (4, 6);
INSERT INTO `t_blog_tags` VALUES (5, 8);
INSERT INTO `t_blog_tags` VALUES (6, 11);
INSERT INTO `t_blog_tags` VALUES (7, 11);
INSERT INTO `t_blog_tags` VALUES (7, 12);
INSERT INTO `t_blog_tags` VALUES (7, 13);
INSERT INTO `t_blog_tags` VALUES (7, 14);
INSERT INTO `t_blog_tags` VALUES (8, 11);
INSERT INTO `t_blog_tags` VALUES (8, 12);
INSERT INTO `t_blog_tags` VALUES (8, 13);
INSERT INTO `t_blog_tags` VALUES (8, 14);
INSERT INTO `t_blog_tags` VALUES (9, 11);
INSERT INTO `t_blog_tags` VALUES (9, 12);
INSERT INTO `t_blog_tags` VALUES (9, 13);
INSERT INTO `t_blog_tags` VALUES (9, 14);

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_comment` bit(1) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `blog_id` bigint NULL DEFAULT NULL,
  `parent_comment_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKke3uogd04j4jx316m1p51e05u`(`blog_id`) USING BTREE,
  INDEX `FK4jj284r3pb7japogvo6h72q95`(`parent_comment_id`) USING BTREE,
  CONSTRAINT `FK4jj284r3pb7japogvo6h72q95` FOREIGN KEY (`parent_comment_id`) REFERENCES `t_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKke3uogd04j4jx316m1p51e05u` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (3, 'Spring Boot');
INSERT INTO `t_tag` VALUES (4, 'CSS');
INSERT INTO `t_tag` VALUES (5, 'HTML');
INSERT INTO `t_tag` VALUES (6, 'IDEA');
INSERT INTO `t_tag` VALUES (7, '数据库');
INSERT INTO `t_tag` VALUES (8, 'Github');
INSERT INTO `t_tag` VALUES (9, '后端');
INSERT INTO `t_tag` VALUES (10, '前端');
INSERT INTO `t_tag` VALUES (11, '基础');
INSERT INTO `t_tag` VALUES (12, '啊啊啊');
INSERT INTO `t_tag` VALUES (13, '啊');
INSERT INTO `t_tag` VALUES (14, '啊啊');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (4, '计算机网络');
INSERT INTO `t_type` VALUES (5, 'Java');
INSERT INTO `t_type` VALUES (6, '工具');
INSERT INTO `t_type` VALUES (8, 'C++');
INSERT INTO `t_type` VALUES (9, '分类01');
INSERT INTO `t_type` VALUES (10, '分类02');
INSERT INTO `t_type` VALUES (11, '分类03');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'https://z3.ax1x.com/2021/08/04/fA8MQJ.jpg', '2021-08-07 12:36:23', 'hh@163.com', '管理员', '96e79218965eb72c92a549dd5a330112', 1, '2021-08-07 12:36:23', 'jay');

SET FOREIGN_KEY_CHECKS = 1;
