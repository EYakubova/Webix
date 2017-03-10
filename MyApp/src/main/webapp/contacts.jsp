<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
    <jsp:include page="header.jsp" />
    <jsp:include page="footer.jsp" />
    <div id="contacts" style="display: none;">
        <span class='webix_icon fa-envelope-o'></span> 
        <a href="mailto:dmitry.radyno@gmail.com">dmitry.radyno@gmail.com</a><br>
        <span class='webix_icon fa-phone-square'></span> +375 29 123-45-67<br>
        <span class='webix_icon fa-twitter'></span> 
        <a href="https://twitter.com/radyno">@radyno</a><br>
        <span class='webix_icon fa-facebook'></span> 
        <a href="https://www.facebook.com/dmitry.radyno">Dmitry Radyno</a><br>
    </div>
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
                                { view: "template", template: "html->header", css: "header", borderless: true},
                                getTopMenu("contacts")
                            ]},
                            getPhotos()
                        ]},
                        { height: 400, cols: [
                            { template: "html->contacts", borderless: true, css: "contacts" },
                            { header: "Latest reports", body: getLastSpeakersList(), width: 409 }
                        ]},
                        getFooter()
                ]
            }, {}]
        });
        </script>
</body>
</html>