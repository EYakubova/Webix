<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Webix - Front-End Events</title>
    <link rel="shortcut icon" href="favicon.ico" />
    <link rel="stylesheet" href="./codebase/webix.css" type="text/css" media="screen" charset="utf-8">
    <link rel="stylesheet" href="./codebase/myapp.css" type="text/css" media="screen" charset="utf-8">
    <script src="./codebase/webix.js" type="text/javascript" charset="utf-8"></script>
    <script src="./codebase/myapp.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
    <div id="header" style="display: none;">
        <div class="confname"><s:property value="event.name" /></div>
        <div class="conftime"><s:date name="event.date" format="dd/MM/yyyy" /> - <s:property value="event.location" /></div>
        <div class="confdsc"><s:property value="event.description" /></div>
    </div>
    <jsp:include page="footer.jsp" />
    <div id='myapp'></div>

    <script type="text/javascript" charset="utf-8">
        webix.ui({
            container:"myapp",
            cols: [{}, {
                width: 1280,
                rows: [
                    {
                        height: 250,
                        borderless:true,
                        cols: [{
                            rows: [
                                { view: "template", template: "html->header", css: "header", borderless: true },
                                getTopMenu()
                            ]
                        },
                        getPhotos()
                    ]},
                    { cols: [
                        { body: {
                            view:"list",
                            template:"<img src='./photos/#photo#' class='userpic' /> <h3>#author#: #topic#</h3>#description#",
                            css: "speakersList",
                            type:{
                                height:170
                            },
                            select:false,
                            minHeight: 400,
                            autoheight: true,
                            datatype: "json",
                            url:"speakers?eventId=<s:property value="event.id" />&nocache=" + (new Date()).valueOf()
                        } },
                        { header: "Latest reports", body: getLastSpeakersList(), width: 409 }
                    ]},
                    getFooter()
                ]
            }, {}]
        });
    </script>
</body>
</html>