function editSpeaker(value, callback) {

    var saveSpeaker = function() {
        var newValue = $$("speakerForm").getValues();
        $$("speakerForm").clear();
        $$("speakerWindow").close();
        callback(newValue);
    };
    var discardChanges = function() {
        $$("speakerForm").clear();
        $$("speakerWindow").close();
    };

    webix.ui({
        id: "speakerWindow",
        view:"window",
        height:420,
        width:400,
        position:"center",
        modal: true,
        head: "Editing a report",
        body:{
            rows: [{
                id: "speakerForm",
                view:"form",
                elements:[
                    { view:"text", name:"author", label:"Author"},
                    { view:"text", name:"topic", label:"Topic"},
                    { view:"text", name:"photo", label:"Photo"},
                    { view:"textarea", name:"description",height:200, label:"Description", labelPosition:"top" }
                ],
                rules:{
                    name: webix.rules.isNotEmpty,
                    description: webix.rules.isNotEmpty
                }
            }, { view:"toolbar", cols:[
                {},
                { view:"button", label:"Save", type:"form", click:saveSpeaker, width: 200 },
                { view:"button", label:"Cancel", click:discardChanges, width: 200 },
                {}
            ]}]
        }
    }).show();

    if (value) {
        $$("speakerForm").setValues(value);
    }
}