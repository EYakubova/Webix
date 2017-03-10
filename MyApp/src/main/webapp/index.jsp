<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
                                getTopMenu("upcoming")
                            ]},
                            getPhotos()
                        ]
                    },
                    { cols: [
						{ body: {
							view:"list",
							template:"<img src='./photos/#photo#' class='eventpic' /> <h3>#name# (#date#)</h3>#description# <a href='event?eventId=#id#' class='details'>Details</a>",
							css: "eventsList",
							type:{
								height:152
							},
							select:false,
							autoheight: true,
							datatype:"json",
							url:"events?nocache=" + (new Date()).valueOf()
						}},
						{ header: "Latest reports", body: getLastSpeakersList(), width: 409 }
					]},
                    getFooter()
                ]
            }, {}]
        });
    </script>
</body>
</html>