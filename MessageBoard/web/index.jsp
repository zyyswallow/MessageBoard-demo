
<%@page import="java.sql.Timestamp"%>
<%@page import="Bean.Message"%>
<%@page import="java.util.List"%>
<%@page import="Handler.MessageHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>留言板</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">

    </head>

    <body>

        <!-- ====Navigation Bar on the top of the screen==== -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Logo & Name</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">登录</a></li>
                        <li><a href="#">注册</a></li>
                    </ul>
                </div>


            </div>
        </nav>

        <!-- ==== main content ==== -->
        <div class="container-fluid">
            <div class="row-main" style="margin-top:7%">
                <div class="col-sm-8 col-sm-offset-2">

                    <!-- ==== 输入区 ==== -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <span class="glyphicon glyphicon-pencil"></span>
                            发表您的留言
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">您的IP地址</label>
                                    <div class="col-sm-5">
                                        <input class="form-control" id="IPAddress" type="text" readonly="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">您的留言</label>
                                    <div class="col-sm-9">
                                        <textarea id="textContent" class="form-control" rows="3"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2 col-sm-offset-3">
                                        <button type="button" class="btn btn-primary btn-block" onclick="submitMessage()">提交</button>
                                    </div>
                                    <div class="col-sm-2 col-sm-offset-1">
                                        <button type="button" id="clear" class="btn btn-primary btn-block" onclick="clearTextArea()">清空</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- ==== 留言展示区 ==== -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <span class="glyphicon glyphicon-list"></span>
                            留言板
                        </div>
                        <div class="panel-body">
                            <div id="messageBox">
                                <%
                                    List<Message> list = MessageHandler.getMessageHandler().getAllMessages();
                                    for (int i = 0; i < list.size(); i++) {
                                        String IP = list.get(i).getAuthorIP();
                                        String time = list.get(i).getTime().toString().substring(0, 16);
                                        String content = list.get(i).getContent();
                                %>
                                <div class="panel panel-primary">
                                    <div class="panel-body">
                                        <h5>来自 IP: <%=IP%>  (<%=time%>)</h5>
                                        <p class=""><%=content%></p>
                                    </div>
                                </div>  
                                <%
                                    }
                                %>


                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </body>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
</html>
