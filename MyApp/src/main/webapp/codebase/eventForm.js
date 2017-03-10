function editEvent(value, callback) {

    var saveEvent = function() {
        var newValue = $$("eventForm").getValues();
        $$("eventForm").clear();
        $$("eventWindow").close();
        callback(newValue);
    };
    var discardChanges = function() {
        $$("eventForm").clear();
        $$("eventWindow").close();
    };

    webix.ui({
        id: "eventWindow",
        view:"window",
        height:420,
        width:400,
        position:"center",
        modal: true,
        head: "Editing an event",
        body:{
            rows: [{
                id: "eventForm",
                view:"form",
                elements:[
                    { view:"text", name:"name", label:"Name"},
                    { view:"datepicker", name:"date_to", label:"Date", stringResult: true },
                    { view:"text", name:"location", label:"Address"},
                    { view:"text", name:"photo", label:"Image"},
                    { view:"textarea", name:"description",height:170, label:"Description", labelPosition:"top" }
                ],
                rules:{
                    name: webix.rules.isNotEmpty,
                    description: webix.rules.isNotEmpty
                }
            }, { view:"toolbar", cols:[
                {},
                { view:"button", label:"Save", type:"form", click:saveEvent, width: 200 },
                { view:"button", label:"Cancel", click:discardChanges, width: 200 },
                {}
            ]}]
        }
    }).show();

    if (value) {
        $$("eventForm").setValues(value);
    }
}