function getTopMenu(selectedValue) {
        return { cols: [{}, { view:"toolbar", height: 40, borderless:true, cols:[
            {view:"segmented", multiview:false, value:1, width: 600, options:[
               { id:"upcoming", value:"Upcoming events" },
               { id:"contacts", value:"Contacts" }
            ], on: {
                'onChange': function(newValue, oldValue){
                    window.location.href = newValue;
                }
            }, value: selectedValue }
        ]}, {}] };
    }

function getFooter() {
    return {
        height: 30,
        paddingY: 6,
        cols: [
            {},
            {
                template: "html->footer",
                css: "footer",
                borderless: true,
                width: 160
            },
            {}
        ]
    };
}

function getPhotos() {
    var imgTemplate = function(obj){
        return '<img src="'+obj.src+'" class="content" ondragstart="return false"/>'
    };
    return { rows: [
 { height: 10},
        {
            view:"carousel",
            id:"carousel",
            width:410,
            height: 230,
            borderless: true,
            cols:[
                { css:"image", template:imgTemplate, data:{src:"photos/photo1.jpg"}},
                { css:"image", template:imgTemplate, data:{src:"photos/photo2.jpg"}},
                { css:"image", template:imgTemplate, data:{src:"photos/photo3.jpg"}},
                { css:"image", template:imgTemplate, data:{src:"photos/photo4.jpg"}},
                { css:"image", template:imgTemplate, data:{src:"photos/photo5.jpg"}},
                { css:"image", template:imgTemplate, data:{src:"photos/photo6.jpg"}}
            ]
        },
        {}
    ]};
}

function getLastSpeakersList() {
    return {
        id:"tweets",
        view:"list",
        template:"<img src='./photos/#photo#' class='eventpic' /><span class='speakerHeader'>#author# - #topic#</span><br><span class='speakerDetails'>#description#</span>",
        type:{
            height:190
        },
        select:false,
        datatype: "json",
        url: "lastSpeakers?nocache=" + (new Date()).valueOf()
    };
}
