require(["dijit/layout/AccordionContainer", "dijit/layout/ContentPane", "dojo/domReady!"],
        function(AccordionContainer, ContentPane){
    var aContainer = new AccordionContainer({style:"height: 300px"}, "markup");
    aContainer.addChild(new ContentPane({
        title: "This is a content pane",
        content: "Hi!"
    }));
    aContainer.addChild(new ContentPane({
        title:"This is as well",
        content:"Hi how are you?"
    }));
    aContainer.addChild(new ContentPane({
        title:"This too",
        content:"Hello im fine.. thnx"
    }));
    aContainer.startup();
});