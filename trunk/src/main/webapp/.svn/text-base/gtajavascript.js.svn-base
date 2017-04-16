dojo.require("dojox.widget.Calendar");
dojo.require("dojo.parser");
dojo.require("dijit.layout.SplitContainer");
dojo.require("dijit.layout.ContentPane");
dojo.require("dojo.dnd.Source");
dojo.require("dojo.dnd.Container");

dojo.require("dojox.layout.FloatingPane");
dojo.require("dojo.dnd.Manager");
dojo.require("dojo.dnd.Avatar");
dojo.require("dojo.dnd.Selector");
dojo.require("dijit.layout.ContentPane");
dojo.require("dijit.layout.TabContainer");
dojo.require("dijit.Dialog");
dojo.require("dijit.form.TextBox");
dojo.require("dojox.validate.regexp");
dojo.require("dijit.form.ValidationTextBox")
dojo.require("dijit.Tooltip");
dojo.require("dijit.form.Form");
dojo.require("dijit.form.CheckBox");
dojo.require("dijit.layout.AccordionContainer");
dojo.require("dijit.Menu");
dojo.require("dijit.PopupMenuItem");
dojo.require("dojox.layout.FloatingPane");
dojo.require("dijit.layout.BorderContainer");
dojo.require("dijit.layout.StackContainer");
dojo.require("dijit.Dialog");
dojo.require("dijit.Editor");
dojo.require("dojox.layout.FloatingPane");
dojo.require("dijit.form.RadioButton");
dojo.require("dijit._editor.plugins.AlwaysShowToolbar");
dojo.require("dijit._editor.plugins.EnterKeyHandling");
dojo.require("dijit._editor.plugins.LinkDialog");
dojo.require("dijit.form.HorizontalSlider");
dojo.require("dojox.data.HtmlStore");

dojo.require("dijit.Toolbar");
dojo.require("dojox.data.AppStore");
dojo.require("dojox.data.GoogleFeedStore");

var c1;
var clickedJob;
var page = 1;
var maxPage = 2;

var urls = new Array("http://www.simplyhired.ca/a/job-feed/rss/q-java/l-toronto","http://www.workopolis.com/rss.aspx?action=transfer&view=content/jobseeker/jobsearchviewrss&id=61810298","http://www.eluta.ca/rss?q=java+sort%3arank+location%3atoronto#","http://www.wowjobs.ca/wowrss.aspx?q=java&l=toronto&s=&sr=50&t=30&f=r&e=&si=a&dup=h","http://canada.jobisjob.com/rss?what=java&where=toronto","http://twitter.com/statuses/user_timeline/21480146.rss");
var feedIds = new Array("URL11","URL21","URL31","URL41","URL51","URL61");
var localMode = new Array("false","false","false","false","false","false");

var urls2 = new Array("http://ca.indeed.com/rss?q=Java&l=Toronto%2C+ON","http://rss.jobsearch.monster.com/rssquery.ashx?WT.mc_n=RSS2005_jsr&fn=6&cy=US&baseurl=jobsearch.monster.com","http://www.thingamajob.com/rss/Job-Search-Results.aspx?src=-1&PAGE_NO=1&CRITERIA=java+&COUNTRY=2&STATE=55&ALERT_FLAG=false&SEARCHTYPE=4","http://www.dovajobs.com/Custom/Modules/JobSearch/SearchResultsRss.ashx?q=java&c=toronto&rc=on&countryid=38","http://twitter.com/statuses/user_timeline/61277709.rss","http://twitter.com/statuses/user_timeline/45792953.rss");
var feedIds2 = new Array("URL12","URL22","URL32","URL42","URL52","URL62");
var localMode2 = new Array("false","false","false","false","false","false");

var urls3 = new Array("http://www.devbistro.com/rss/latest-jobs?rds=java&type=any&city=toronto&location=Canada-ON","http://canadajobs.allstarjobs.ca/rss.php?cat=184","http://www.thingamajob.com/rss/Job-Search-Results.aspx?src=-1&PAGE_NO=1&CRITERIA=java+&COUNTRY=2&STATE=55&ALERT_FLAG=false&SEARCHTYPE=4","http://www.dovajobs.com/Custom/Modules/JobSearch/SearchResultsRss.ashx?q=java&c=toronto&rc=on&countryid=38","http://twitter.com/statuses/user_timeline/61277709.rss","http://twitter.com/statuses/user_timeline/45792953.rss");
var feedIds3 = new Array("URL12","URL22","URL32","URL42","URL52","URL62");
var localMode3 = new Array("false","false","false","false","false","false");


var widgetCreator = function(item){
    var node = dojo.doc.createElement("div");
    node.id = dojo.dnd.getUniqueId();
    
    
    var n = dojo.create("div", {
        innerHTML: item + "<span class=\"ex2\" style=\"background-color:orange\" border=\"1\"> Right Click on Job For More Options</span><img src='img/traffic-light-red.png' width='20'><hr>"
    });
    node.appendChild(n);
    var rightClickMenu = dijit.byId("tree_menu");
    // when we right-click anywhere on the tree, make sure we open the menu
    rightClickMenu.bindDomNode(node);
    
    dojo.connect(rightClickMenu, "_openMyself", node, function(e){
        // get a hold of, and log out, the tree node that was the source of this open event		      
        clickedJob = node;
    });
    
    
    total += item + "<###>";
    return {
        node: node,
        data: item,
        type: ["v"]
    };
};

function moveinMethod(index){

    dojo.require("dojo.fx");
    
    var fadeOut = dojo.fadeOut({
        node: "animDiv",
        duration: 1000
    });
    var fadeIn = dojo.fadeIn({
        node: "animDiv2",
        duration: 1000
    });
    var wipeOut = dojo.fx.wipeOut({
        node: "animDiv",
        duration: 1000
    });
    
    var wipeIn = dojo.fx.wipeIn({
        node: "animDiv2",
        duration: 1000
    });
    var slideRight = dojo.fx.slideTo({
        node: "animDiv",
        duration: 1000,
        left: 300,
        top: 80
    });
    var slideLeft = dojo.fx.slideTo({
        node: "animDiv2",
        duration: 1000,
        left: 0,
        top: 80
    });
    
    var animOut = dojo.fx.combine([fadeOut, wipeOut, slideRight]);
    var animIn = dojo.fx.combine([fadeIn, wipeIn, slideLeft]);
    
    
    switch (index) {
        case 1:
            animOut.play();
            animIn.play();
            break;
            
        case 2:
            alert("Coming Soon");
            break;
    }
    
    
    
    
    
    
    
}

function  fetchForPage(page,index,divId) {	
	if(page == 1)
	fetch(feedIds[index],urls[index],localMode[index],divId)
    else
	if(page == 2) 
    fetch(feedIds2[index],urls2[index],localMode2[index],divId)
  

}



function attachItemsToNode(divId, appStore, items, local, feedId){
     
    var wishlist = new dojo.dnd.Source(divId);

	dojo.attr(wishlist.node, {
                        id: feedId
                        
                    });
	dojo.addClass(wishlist.node,"source");				
    for (i = 0; i < items.length; i++) {
    
        var e = items[i];
        
        var title = appStore.getValue(e, "title");
        var updated = appStore.getValue(e, "updated");
        var summary = appStore.getValue(e, "summary");
		var description = appStore.getValue(e, "content");
        var link = appStore.getValue(e, "link");
        
        
        var maindiv = dojo.doc.createElement("div");
        //	 alert(local+" here");
        //  maindiv.id = dojo.dnd.getUniqueId();
        dojo.attr(maindiv, {            
            onclick: "showJobDetails(this)",
			onmouseover: "changeImage()", 
			onmouseout: "changeImageBack()",dndType: "v"
			
			
        });
		dojo.addClass(maindiv,"dojoDndItem");
        // alert(local+" here222");
        dojo.style(maindiv, {
            "backgroundColor": "lightgrey"
        
        });
        
        //  alert(local+" here1");
        var div = dojo.create("div");
        
        div.innerHTML = title;
        
        
        
        var div2 = dojo.create("div");
        dojo.style(div2, {
            "visibility": "hidden",
            "height": "1px",
            "width": "1px"
        
        });
        if (local == "true") {
            //	alert(local+" here2");
            div2.innerHTML = link.href;
        }
        else {
            //alert(link);
            div2.innerHTML = link;
        }
        
        dojo.attr(div2, {
            name: "nameLink"
        
        });
        
        
        var div1 = dojo.create("div");
        dojo.style(div1, {
            "visibility": "hidden",
            "height": "1px",
            "width": "1px"
        
        });
        div1.innerHTML = summary +"<br>"+description + "<br>" + title;
        dojo.attr(div1, {
            name: "nameDes"
        
        });
        
        
        
        dojo.place(div, maindiv);
        dojo.place(div1, maindiv);
        dojo.place(div2, maindiv);
        var br = dojo.doc.createElement("br");
        wishlist.insertNodes(false, [maindiv]);
        wishlist.insertNodes(false, [br]);
        
        
    }
}

function fetch(feedId, urlStr, local, divId){
  
    if (local == "true") {
    
        var appStore = new dojox.data.AppStore({
            url: urlStr
        });
        
        
        var gotEntries = function(items, request){
            if (items) {
                attachItemsToNode(divId, appStore, items, local, feedId);
                
                
            }
        }
        
        
        
        
        
        appStore.fetch({
            onComplete: gotEntries
        });
        
    }
    else {
    
        var store1 = new dojox.data.GoogleFeedStore();
         store1.fetch({
            query: {
                url: urlStr
            },
            onComplete: function(items1){
            
                attachItemsToNode(divId, store1, items1, local, feedId);
                
                
                
            },
            count: 15
        });
		
    }
    
    
    
}




function clearValueInSearchBox(searchBox){
    searchBox.value = '';
}

function onSearchEnter(){

    if (event.keyCode == 13) {
        searchStore();
    }
    
    
}

var oldSearchItems = new Array();
var parentOfSearchItems = new Array();

function clearOldItems(){
    for (var i = 0; i < oldSearchItems.length; i++) {
        var item = oldSearchItems[i];
        dojo.animateProperty({
            node: item,
            duration: 1500,
            properties: {
                color: {
                    start: 'blue',
                    end: 'black'
                },
                backgroundColor: {
                    end: '#D3D3D3'
                },
                borderWidth: {
                    start: '5',
                    end: '0'
                },
                borderColor: {
                    end: 'lightgrey'
                }
            
            }
        }).play();
        
        item.style.borderWidth = "1px";
        
        item.style.borderColor = "blue";
    }
    oldSearchItems = new Array();
	
	
	for (var i = 0; i < parentOfSearchItems.length; i++) {
	   var parentNodeId = parentOfSearchItems[i]; 
	   var parentNode = dojo.byId(parentNodeId);
	   dojo.animateProperty({
                node: parentNode,
                duration: 1500,
                properties: {                    
                    borderWidth: {
                        start: '5',
                        end: '0'
                    },
                    borderColor: {
                        end: 'white'
                    }
                
                }
            }).play();
            parentNode.style.borderWidth = "1px";
            parentNode.style.borderStyle = "dashed";
            parentNode.style.borderColor = "white";
	}
	parentOfSearchItems = new Array();
	
}

var resumeMatchPercentage = '10%';

function increasePrecentage(thisVar){
    resumeMatchPercentage = thisVar;
    changeTextOnSlider();
}

function changeTextOnSlider(){
    dojo.byId("slider1input").value = resumeMatchPercentage;
}

function changeTextOnSliderBack(){
    dojo.byId("slider1input").value = "Resume Match " + resumeMatchPercentage;
}

function searchStore(){
	
	
    var value = (dojo.byId('searchText').value);
    //dont search for all that means *.*
    if (value == "") 
        return;
    
    if (oldSearchItems.length > 0) {
        clearOldItems();
    }
    var searchStr = "*" + value + "*";
    
    dojo.byId('searchText').value = '';
    var suffix = page;
	var jobsFoundSpan =dojo.byId('jobsFoundSpan');
	jobsFoundSpan.innerHTML = 'Searching...';
	var counter = 0;
    var gotBooks = function(items, request){
        oldSearchItems = oldSearchItems.concat(items);
        for (var i = 0; i < items.length; i++) {
			counter++;
			jobsFoundSpan.innerHTML = searchStr+" Jobs Found :"+counter;
            var item = items[i];
			var parentId = item.parentNode.id;
			if(dojo.indexOf(parentOfSearchItems,parentId) == -1 ){
				parentOfSearchItems[parentOfSearchItems.length] = parentId;
			}
            dojo.animateProperty({
                node: item,
                duration: 1500,
                properties: {
                    color: {
                        start: 'blue',
                        end: 'black'
                    },
                    backgroundColor: {
                        end: 'yellow'
                    },
                    borderWidth: {
                        start: '1',
                        end: '5'
                    },
                    borderColor: {
                        end: 'blue'
                    }
                
                }
            }).play();
            item.style.borderWidth = "1px";
            item.style.borderStyle = "dashed";
            item.style.borderColor = "blue";
        }
    }
	
    var store = new dojox.data.HtmlStore({
        dataId: "URL1" + suffix
    });
    store.fetch({
        queryOptions: {
            ignoreCase: true
        },
        query: {
            name: searchStr
        },
        onComplete: gotBooks
    });
    store = new dojox.data.HtmlStore({
        dataId: "URL2" + suffix
    });
    store.fetch({
        queryOptions: {
            ignoreCase: true
        },
        query: {
            name: searchStr
        },
        onComplete: gotBooks
    });
    store = new dojox.data.HtmlStore({
        dataId: "URL3" + suffix
    });
    store.fetch({
        queryOptions: {
            ignoreCase: true
        },
        query: {
            name: searchStr
        },
        onComplete: gotBooks
    });
    store = new dojox.data.HtmlStore({
        dataId: "URL4" + suffix
    });
    store.fetch({
        queryOptions: {
            ignoreCase: true
        },
        query: {
            name: searchStr
        },
        onComplete: gotBooks
    });
    store = new dojox.data.HtmlStore({
        dataId: "URL5" + suffix
    });
    store.fetch({
        queryOptions: {
            ignoreCase: true
        },
        query: {
            name: searchStr
        },
        onComplete: gotBooks
    });
    store = new dojox.data.HtmlStore({
        dataId: "URL6" + suffix
    });
    store.fetch({
        queryOptions: {
            ignoreCase: true
        },
        query: {
            name: searchStr
        },
        onComplete: gotBooks
    });
	
	
	higLightParentOfSearchItem();
    
}

function higLightParentOfSearchItem() {	
	for (var i = 0; i < parentOfSearchItems.length; i++) {
	   var parentNodeId = parentOfSearchItems[i]; 
	   var parentNode = dojo.byId(parentNodeId);
	   dojo.animateProperty({
                node: parentNode,
                duration: 1500,
                properties: {                    
                    borderWidth: {
                        start: '0',
                        end: '5'
                    },
                    borderColor: {
                        end: 'yellow'
                    }
                
                }
            }).play();
            parentNode.style.borderWidth = "1px";
            parentNode.style.borderStyle = "dashed";
            parentNode.style.borderColor = "blue";
	}
}

function goBack(){
    dijit.byId('stackContainer').back();
    if (page != 1) 
        page = page - 1;
    if (page == 1) {
        dojo.byId('previous').disabled = 'disabled';
    }
    dojo.byId('next').disabled = '';
	var jobsFoundSpan =dojo.byId('jobsFoundSpan');
	jobsFoundSpan.innerHTML = '';
	
}

function goForward(){
    dijit.byId('stackContainer').forward();
    
    if (page != maxPage) 
        page = page + 1;
    if (page == maxPage) {
        dojo.byId('next').disabled = 'disabled';
    }
    dojo.byId('previous').disabled = '';
	var jobsFoundSpan =dojo.byId('jobsFoundSpan');
	jobsFoundSpan.innerHTML = '';
}

function changeImage(){
    var imgCart = dojo.byId("cart");
    //imgCart.width = 100;
    
    dojo.animateProperty({
        node: imgCart,
        duration: 2000,
        properties: {
            color: {
                start: 'blue',
                end: 'black'
            },
            backgroundColor: {
                start: 'white',
                end: '#FF9933'
            },
            borderWidth: {
                start: '1',
                end: '3'
            },
            width: {
                start: '56',
                end: '100'
            }
        
        
        }
    }).play();
    
    var txt = dojo.byId("emailme");
    txt.style.backgroundColor = 'lightgrey';
    
    var dragjobshere = dojo.byId("dragjobshere");
    dragjobshere.innerHTML = "Drop Jobs here";
    
    var cartImageContainer = dojo.byId("container1");
    cartImageContainer.style.backgroundColor = '#FFFFCC';
    dojo.animateProperty({
        node: cartImageContainer,
        duration: 2000,
        properties: {
            color: {
                start: 'blue',
                end: 'black'
            },
            backgroundColor: {
                start: 'white',
                end: '#FF9933'
            },
            borderWidth: {
                start: '1',
                end: '3'
            }
        
        
        }
    }).play();
    
}




function changeImageBack(){
    var imgCart = dojo.byId("cart");
    dojo.animateProperty({
        node: imgCart,
        duration: 2000,
        properties: {
            color: {
                start: 'blue',
                end: 'black'
            },
            backgroundColor: {
                start: '#FF9933',
                end: 'white'
            },
            borderWidth: {
                start: '1',
                end: '3'
            },
            width: {
                start: '100',
                end: '56'
            }
        
        
        }
    }).play();
    imgCart.width = 50;
    var txt = dojo.byId("emailme");
    txt.style.backgroundColor = 'white';
    var dragjobshere = dojo.byId("dragjobshere");
    dragjobshere.innerHTML = "";
    var cartImageContainer = dojo.byId("container1");
    
    dojo.animateProperty({
        node: cartImageContainer,
        duration: 2000,
        properties: {
            color: {
                start: 'blue',
                end: 'black'
            },
            backgroundColor: {
                start: '#FF9933',
                end: 'white'
            },
            borderWidth: {
                start: '1',
                end: '3'
            }
        
        
        }
    }).play();
}



//this function is for right click menu action
function myId(action){

    showInfo(action, clickedJob.id);
    
}

function showNote(){

    var dialogColor = dijit.byId("dialogColor");
    dialogColor.show();
}

function showInfo(action, clickedJob){

    var dialogInfo = dijit.byId("dialogInfo");
    var infodiv = dojo.byId("infodiv");
    
    infodiv.innerHTML = "Coming soon : " + action;
    dialogInfo.show();
}

/*
 * Wrap the text so that its not more that max characters
 */
function showLines(max, text){
    max--;
    text = "" + text;
    var temp = "";
    var chcount = 0;
    for (var i = 0; i < text.length; i++) // for each character ... 
    {
        var ch = text.substring(i, i + 1); // first character
        var ch2 = text.substring(i + 1, i + 2); // next character
        if (ch == '\n') // if character is a hard return
        {
            temp += ch;
            chcount = 1;
        }
        else {
            if (chcount == max) // line has max chacters on this line
            {
                temp += '\n <br>' + ch; // go to next line
                chcount = 1; // reset chcount
            }
            else // Not a newline or max characters ...
            {
                temp += ch;
                chcount++; // so add 1 to chcount
            }
        }
    }
    return (temp); // sends value of temp back
}

//this is the job details div , which will be initialized only once
function createTabsForDetails(details, jobLink){
    var containerEl = dojo.byId('dialogJobDetails');
    var tabDiv = document.createElement('div');
    tabDiv.setAttribute('id', 'tabDiv');
    containerEl.appendChild(tabDiv);
    
    var div1 = document.createElement('div');
    
    dojo.style(div1, {
        "opacity": 0.5,
        "border": "3px solid black",
        "height": "300px",
        "width": "300px"
    });
    
    tabDiv.appendChild(div1);
    var div2 = document.createElement('div');
    dojo.style(div2, {
        "opacity": 0.5,
        "border": "3px solid black",
        "height": "300px",
        "width": "300px"
    });
    tabDiv.appendChild(div2);
    
    var div3 = document.createElement('div');
    dojo.style(div3, {
        "opacity": 0.5,
        "border": "3px solid black",
        "height": "300px",
        "width": "300px"
    });
    tabDiv.appendChild(div3);
    
    var div4 = document.createElement('div');
    dojo.style(div4, {
        "opacity": 0.5,
        "border": "3px solid black",
        "height": "300px",
        "width": "300px"
    });
    tabDiv.appendChild(div4);
    
    
    
    var cp1 = new dijit.layout.ContentPane({
        id: "cp1"
    }, div1);
    cp1.setAttribute('title', 'Details');
    
    
    var cp2 = new dijit.layout.ContentPane({
        id: "cp2"
    }, div2);
    cp2.setAttribute('title', 'More Details');
    cp2.attr("href", jobLink);
    cp2.attr("preLoad", "false");
    cp2.attr("refreshOnShow", "true");
    
    
    var cp3 = new dijit.layout.ContentPane({
        id: "cp3"
    }, div3);
    cp3.setAttribute('title', 'Phone & Contact Information');
    var cp4 = new dijit.layout.ContentPane({
        id: "cp4"
    }, div4);
    cp4.setAttribute('title', 'Raiting & Job Popularity');
    
    
    
    cp1.setContent(details);
    //cp2.setContent("We use our built in crawling and search <br> mechanishm to drill into details over the web. You can do more by dragging and droping this job to job basket");
    cp3.setContent("GTAJava will try to find out possible contact information and email ids using Artificial Intelligence. You can do more by dragging and droping this job to job basket");
    
    
    
    var tabs = new dijit.layout.TabContainer({
        id: "tabs"
    }, tabDiv);
    tabs.setAttribute('width', '50');
    tabs.addChild(cp1);
    tabs.addChild(cp2);
    tabs.addChild(cp3);
    tabs.addChild(cp4);
    tabs.startup();
    
}

function showJobDetails(job){
    dojo.animateProperty({
        node: job,
        duration: 2000,
        properties: {
            color: {
                start: 'blue',
                end: 'black'
            },
            backgroundColor: {
                start: '#FF9933',
                end: 'white'
            },
            borderWidth: {
                start: '1',
                end: '5'
            }
        
        
        }
    }).play();
    job.style.backgroundColor = 'white';
    job.style.borderWidth = "1px";
    job.style.borderStyle = "dashed";
    job.style.borderColor = "#FF9933";
    var jobDiscription = null;
    var jobLink = null;
    for (var count = 0; count < job.childNodes.length; count++) {
        var node = job.childNodes.item(count);
        
        if (node.tagName == "DIV") {
            if (node.getAttribute("name") == "nameDes") {
                jobDiscription = node.innerHTML;
                
            }
            else 
                if (node.getAttribute("name") == "nameLink") {
                    jobLink = node.innerHTML;
					
                }
        }
    }
    
    var dialogJobDetails = dijit.byId("dialogJobDetails");
    dialogJobDetails.show();
    var cp1 = dijit.byId('cp1');
    var cp2 = dijit.byId('cp2');
    if (cp1 == null) {
        createTabsForDetails(jobDiscription, jobLink);
    }
    else {
        cp1.setContent(jobDiscription);
        cp2.attr("href", jobLink);
        cp2.attr("preLoad", "false");
    }
    
}



function hideNote(action){

    var dialogColor = dijit.byId("dialogColor");
    dialogColor.hide();
    
    var editorval = dijit.byId("editor").getValue(false);
    
}


var item_price;
var total = "<###>";

function checkPw(dialogFields){
    var ipaddvar = document.getElementById("ipadd").value;
    var d = dijit.byId("newpw");
    var terms = dijit.byId("cb");
    if (!terms.checked) {
        alert("Please accept Terms and Condition");
        return;
    }
    
    if (dialogFields.confirmpw != dialogFields.newpw) {
        alert("Email Ids are different.");
    }
    else 
        if (d.isValid()) {
            c1.selectAll();
            c1.deleteSelectedNodes();
            c1.clearItems();
            c1.clearItems();
            
            
            saveServerObject_postxhr(dialogFields.confirmpw, dialogFields.confirmpw, total, dialogFields.emailsub, ipaddvar);
            dojo.byId("cost").innerHTML = total;
            
        }
        else {
            alert("Email Id Not Valid");
        }
    
}

function init(){
    c1 = new dojo.dnd.Source("container1", {
        creator: widgetCreator,
        accept: ["v"]
    });
    
}

dojo.addOnLoad(init);

function saveServerObject_postxhr(urlParam, labelParam, details, subject, ipadd){

    var kw = {
        url: "SyncMailServlet",
        handleAs: "text",
        load: function(response){
            console.log("POST SUCCESS:" + response);
            dojo.byId("status").innerHTML = response;
        },
        error: function(data){
            console.log("POST ERROR:" + response);
        },
        timeout: 10000,
        content: {
            'name': urlParam,
            'emailid': labelParam,
            "details": details,
            "subject": subject,
            "ipaddress": ipadd
        }
    };
    
    dojo.xhrPost(kw); //Servlet get argement with doPost
}

function Display(DATA){
    dojo.byId("status").innerHTML = DATA;
}
