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
    <script src="./codebase/eventForm.js" type="text/javascript" charset="utf-8"></script>
    <script src="./codebase/speakerForm.js" type="text/javascript" charset="utf-8"></script>
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
                                getTopMenu()
                            ]
                        },
                        getPhotos()
                    ]},
                    { cols: [
                        {
						    id: "events",
						    view:"datatable",
						    columns:[
						        { id:"date_to",	header:"Date" , width:80 },
						        { id:"name",	header:"Name", fillspace: true },
						        { id:"location",header:"Location", 	width:400 },
						        { id:"edit",header:"", width: 34, template: "<span class='webix_icon fa-edit editEvent control'></span>"},
						        { id:"remove", header:"<span class='webix_icon fa-plus bigControl' onclick='addEventClick();'></span>", width: 34, template: "<span class='webix_icon fa-trash-o removeEvent control'></span>"}
						    ],
							    onClick: {
							    	    removeEvent: removeEventClick,
							    	    editEvent: editEventClick
							    },
							    autoheight:true,
							    select:"row",
							    datatype: "json",
							    url: "events?nocache=" + (new Date()).valueOf(),
							    save: "saveEvent"
							},
						
						{ width: 10 },
						{
						    id: "speakers",
						    view:"datatable",
						    columns:[
						        { id:"author",	header:"Author", width:150 },
						        { id:"topic",	header:"Topic",	width:300 },
						        { id:"edit",header:"", width: 34, template: "<span class='webix_icon fa-edit editSpeaker control'></span>"},
						        { id:"remove", header:"<span class='webix_icon fa-plus bigControl' onclick='addSpeakerClick();'></span>", width: 34, template: "<span class='webix_icon fa-trash-o removeSpeaker control'></span>"}
						    ],
						    onClick: {
						        removeSpeaker: removeSpeakerClick,
						        editSpeaker: editSpeakerClick
						    },
						    select: "row",
						    autoheight:true,
						    autowidth:true,
						    datatype: "json",
						    save: "saveSpeaker"
						}
                    ]},
                    getFooter()
                ]
            }, {}]
        });

        $$("speakers").attachEvent("onAfterLoad", function(){
            var firstId = $$("events").getFirstId();
            if (firstId) {
                $$("events").select(firstId);
            }
        });

        $$("speakers").bind($$("events"), function(slave, master){
            if (!master) return false;
            return master.id == slave.event_id;
        });

        $$("speakers").load("speakers?nocache=" + (new Date()).valueOf());
        
        function removeEventClick(ev, id, html){
            var event = this.getItem(id.row),
                self = this;

            webix.confirm({
                title:"Deleting an event",
                ok:"Yes, delete it", 
                cancel:"No, leave it",
                text:"Are you sure you want to delete the event " + event.name + "?",
                callback: function(result) {
                    if (result) {
                        self.remove(id);
                    }
                }
            });
        }
        
        function addEventClick() {
            editEvent(null, function(newValue) {
                $$("events").add(newValue);
            });
        }
        function editEventClick(ev, id, html){
            editEvent(this.getItem(id.row), webix.bind(function(newValue) {
                this.updateItem(newValue.id, newValue);
            }, this));
        }
        
        function removeSpeakerClick(ev, id, html){
            var topic = this.getItem(id.row),
                self = this;

            webix.confirm({
                title:"Deleting a report",
                ok:"Yes, delete it", 
                cancel:"No, leave it",
                text:"Are you sure you want to delete the report'" + topic.topic + "'?",
                callback: function(result) {
                    if (result) {
                        self.remove(id);
                    }
                }
            });
        }
        function editSpeakerClick(ev, id, html){
            editSpeaker(this.getItem(id.row), webix.bind(function(newValue) {
                this.updateItem(newValue.id, newValue);
            }, this));
        }
        function addSpeakerClick() {
            editSpeaker({
                event_id: $$('events').getSelectedId()
            }, function(newValue) {
                $$("speakers").add(newValue);
            });
        }

</script>

</body>
</html>