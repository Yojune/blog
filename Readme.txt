项目运行需要配置的环境和注意事项

1. 导入项目选择maven，jdk版本选择1.8

2. 修改application-dev.yml文件中数据库连接的用户名和密码为本地数据库的，
    
   application-dev.yml中profiles下的active后是dev

3. 在本地数据库新建名为blog的数据库

4. 导入数据库文件blog.sql

5. 访客页面：localhost:8080
    后台登录URL：localhost:8080/admin
    管理员账号jay 密码111111

改进功能：访客首页的标签栏实现动态效果
	分类和标签页的选择框移到右边并实现悬浮效果
	

